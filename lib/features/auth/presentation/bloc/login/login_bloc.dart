import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/mixins/cache_mixin.dart';
import '../../../../../router/app_routes.dart';
import '../../../../../services/api_status.dart';
import '../../../domain/entities/login/get_client_type_request_entity.dart';
import '../../../domain/entities/login/login_request_entity.dart';
import '../../../domain/entities/registration/social/register_social_request_entity.dart';
import '../../../domain/usecases/get_client_type_id_usecase.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/put_fcm_token_usecase.dart';
import '../../../domain/usecases/register_with_social_use_case.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with CacheMixin {
  LoginBloc({
    required this.loginUseCase,
    required this.getClientTypeIdUseCase,
    required this.putFcmTokenUseCase,
    required this.registerWithSocialUseCase,
  }) : super(const LoginState()) {
    on<UsernameEvent>(_username);
    on<PasswordEvent>(_password);
    on<LoginButtonPressedEvent>(_login);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<RegisterWithSocialEvent>(_registerWithSocial);
  }

  final LoginUseCase loginUseCase;
  final GetClientTypeIdUseCase getClientTypeIdUseCase;
  final PutFcmTokenUseCase putFcmTokenUseCase;
  final RegisterWithSocialUseCase registerWithSocialUseCase;

  void _username(
    UsernameEvent event,
    Emitter<LoginState> emit,
  ) =>
      emit(state.copyWith(username: event.username));

  void _password(
    PasswordEvent event,
    Emitter<LoginState> emit,
  ) =>
      emit(state.copyWith(password: event.password));

  Future<void> _login(
    LoginButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
    await _getClientId(emit);
    if ((state.clientTypeId?.isNotEmpty ?? false) &&
        (state.companyId?.isNotEmpty ?? false) &&
        (!state.status.isError)) {
      await _loginUser(emit);
    }
  }

  Future<void> _getClientId(
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final result = await getClientTypeIdUseCase(
      GetClientTypeRequestEntity(
        password: state.password,
        username: state.username,
      ),
    );

    result.fold(
      (e) => emit(state.copyWith(status: ApiStatus.error)),
      (r) {
        if (r.clientTypeId == Constants.clientTypeDriverId || r.clientTypeId == Constants.clientTypeOperatorId) {
          emit(
            state.copyWith(
              clientTypeId: r.clientTypeId ?? '',
              companyId: r.companyId ?? '',
            ),
          );
          return;
        }
        emit(state.copyWith(status: ApiStatus.error));
      },
    );
  }

  Future<void> _loginUser(
    Emitter<LoginState> emit,
  ) async {
    final String? fcmToken = kDebugMode ? '' : await FirebaseMessaging.instance.getToken();
    final String? deviceId = await _getId();
    final result = await loginUseCase(
      LoginRequestEntity(
        username: state.username,
        password: state.password,
        companyId: state.companyId ?? '',
        projectId: Constants.projectId,
        environmentId: Constants.environmentId,
        clientType: state.clientTypeId ?? '',
        environmentIds: const [Constants.environmentId],
        fcmToken: fcmToken,
        loginId: deviceId,
      ),
    );

    result.fold(
      (l) => emit(state.copyWith(status: ApiStatus.error)),
      (r) async {
        emit(state.copyWith(status: ApiStatus.success));
        await localSource.setUser(
          imageUrl: r.imageUrl,
          name: r.fullName,
          phoneNumber: r.phone,
          id: r.userId,
          email: r.email,
          login: r.login,
          vehicleId: r.vehicleId,
          password: state.password ?? '',
          firmId: r.firmId,
        );
        await localSource.setFavouriteCargoes(r.cargoIds);
        await putFcmTokenUseCase(
          PutFcmTokenParams(
            fcmToken: fcmToken ?? '',
            loginId: deviceId ?? '',
            userId: r.userId,
            registerId: r.registerId,
          ),
        );
      },
    );
  }

  Future<String?> _getId() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id;
    }
    return null;
  }

  void _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<LoginState> emit,
  ) =>
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));

  Future<void> _registerWithSocial(
    RegisterWithSocialEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final result = await registerWithSocialUseCase(RegisterSocialRequestEntity(
      displayName: event.displayName,
      loginType: event.loginType,
      accessToken: event.accessToken,
      idToken: event.idToken,
      type: event.type,
      registerType: event.registerType,
      uniqueId: event.uniqueId,
    ));

    if (result.isLeft) {
      emit(
        state.copyWith(
          status: ApiStatus.error,
        ),
      );
    } else if (result.isRight) {
      await localSource.setUser(
        imageUrl: '',
        name: result.right.fullName ?? '',
        phoneNumber: result.right.phone ?? '',
        id: result.right.guid ?? '',
        email: result.right.email ?? '',
        login: result.right.login ?? '',
        password: result.right.password ?? '',
        vehicleId: '',
      );
      await localSource.setFavouriteCargoes(<String>[]);
      emit(
        state.copyWith(status: ApiStatus.success),
      );
    }
  }
}
