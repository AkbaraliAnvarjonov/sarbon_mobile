import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sarbon_mobile/core/mixins/location_mixin.dart';
import 'package:sarbon_mobile/features/auth/domain/entities/check_user/check_user_request_entity.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../router/app_routes.dart';
import '../../../../../services/api_status.dart';
import '../../../data/models/user_role/user_role_model.dart';
import '../../../data/models/verify_otp/verify_otp_request_model.dart';
import '../../../domain/entities/login/get_companies_response_entity.dart';
import '../../../domain/entities/registration/driver/register_driver_request_entity.dart';
import '../../../domain/entities/registration/driver/trailer_type_response_entity.dart';
import '../../../domain/entities/registration/operator/register_operator_request_entity.dart';
import '../../../domain/entities/send_code/send_code_request_entity.dart';
import '../../../domain/usecases/check_user_usecase.dart';
import '../../../domain/usecases/get_companies_usecase.dart';
import '../../../domain/usecases/get_trailer_type_usecase.dart';
import '../../../domain/usecases/register_driver_usecase.dart';
import '../../../domain/usecases/register_operator_usecase.dart';
import '../../../domain/usecases/send_code_usecase.dart';
import '../../../domain/usecases/verify_otp_usecase.dart';

part 'confirmation_user_event.dart';

part 'confirmation_user_state.dart';

class ConfirmationUserBloc extends Bloc<ConfirmationUserEvent, ConfirmationUserState> {
  ConfirmationUserBloc({
    required this.sendCodeUseCase,
    required this.verifyOtpUseCase,
    required this.getCompaniesUseCase,
    required this.registerDriverUseCase,
    required this.registerOperatorUseCase,
    required this.getTrailerTypeUsecase,
    required this.checkUserUseCase,
  }) : super(const ConfirmationUserState()) {
    on<WritePhoneNumberEvent>(_writePhoneNumber);
    on<SendCodeEvent>(_sendCode);
    on<CheckUserEvent>(_checkUserEvent);
    on<VerifyOtpChangedEvent>(_verifyOtpChanged);
    on<WriteOtpEvent>(_writeOtp);
    on<SelectedRoleChangedEvent>(_selectUserRoleEvent);
    on<GetCompaniesEvent>(_getCompaniesForRegistration);
    on<SelectedTrailerChangedEvent>(_selectCompanyEvent);
    on<UserAgreementChangedEvent>(_changeUserAgreement);
    on<RegisterDriverEvent>(_userDriverRegister);
    on<RegisterOperatorEvent>(_userOperatorRegister);
    on<GetTrailerTypeEvent>(_getTrailerType);
  }

  final SendCodeUseCase sendCodeUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final CheckUserUseCase checkUserUseCase;
  final GetCompaniesUseCase getCompaniesUseCase;
  final GetTrailerTypeUsecase getTrailerTypeUsecase;
  final RegisterDriverUseCase registerDriverUseCase;
  final RegisterOperatorUseCase registerOperatorUseCase;

  Future<void> _getCompaniesForRegistration(
    GetCompaniesEvent event,
    Emitter<ConfirmationUserState> emit,
  ) async {
    emit(state.copyWith(getCompaniesStatus: ApiStatus.loading));
    final result = await getCompaniesUseCase({});
    result.fold(
      (l) => emit(
        state.copyWith(
          getCompaniesStatus: ApiStatus.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          companies: r.companies,
          getCompaniesStatus: ApiStatus.success,
        ),
      ),
    );
  }

  Future<void> _userDriverRegister(
    RegisterDriverEvent event,
    Emitter<ConfirmationUserState> emit,
  ) async {
    emit(state.copyWith(registerStatus: ApiStatus.loading));
    final String? fcmToken = kDebugMode ? '' : await FirebaseMessaging.instance.getToken();
    final String? deviceId = await _getId();
    final result = await LocationMixin.instance.hasPermission();
    ;
    final Position? position =
        result == LocationPermissionHandle.success ? await Geolocator.getCurrentPosition() : null;
    final response = await registerDriverUseCase(
      event.userRegisterInfo.copyWith(
        fcmToken: fcmToken,
        registerId: deviceId,
        location: '${position?.latitude ?? 0},${position?.longitude ?? 0}',
      ),
    );
    await response.fold(
      (l) {
        String errorText = '';
        if (l.message.contains('user_unq_login')) {
          errorText = 'Пользователь с таким логином уже существует';
        } else if (l.message.contains('user_unq_email')) {
          errorText = 'Пользователь с таким email уже существует';
        } else if (l.message.contains('duplicate key error')) {
          errorText = 'Пользователь с таким номером телефона уже существует';
        }
        emit(
          state.copyWith(
            registerStatus: ApiStatus.error,
            errorText: errorText,
          ),
        );
      },
      (r) async {
        emit(state.copyWith(registerStatus: ApiStatus.success));
        await localSource.deleteSmsId();
        await localSource.setUser(
          imageUrl: '',
          name: event.userRegisterInfo.fullName ?? '',
          phoneNumber: event.userRegisterInfo.phone ?? '',
          id: r.id ?? '',
          email: event.userRegisterInfo.email ?? '',
          login: event.userRegisterInfo.login ?? '',
          password: event.userRegisterInfo.password ?? '',
          vehicleId: event.userRegisterInfo.vehicleId ?? '',
        );
        await localSource.setFavouriteCargoes(<String>[]);
      },
    );
  }

  Future<void> _userOperatorRegister(
    RegisterOperatorEvent event,
    Emitter<ConfirmationUserState> emit,
  ) async {
    emit(state.copyWith(registerStatus: ApiStatus.loading));
    final String? fcmToken = await FirebaseMessaging.instance.getToken();
    final String? deviceId = await _getId();
    final response = await registerOperatorUseCase(
      event.userRegisterInfo.copyWith(
        fcmToken: fcmToken,
        registerId: deviceId,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(registerStatus: ApiStatus.error)),
      (r) async {
        emit(state.copyWith(registerStatus: ApiStatus.success));
        await localSource.deleteSmsId();
        await localSource.setUser(
          imageUrl: '',
          name: event.userRegisterInfo.fullName ?? '',
          phoneNumber: event.userRegisterInfo.phone ?? '',
          id: r.id ?? '',
          email: event.userRegisterInfo.email ?? '',
          login: event.userRegisterInfo.login ?? '',
          password: event.userRegisterInfo.password ?? '',
        );
        await localSource.setFavouriteCargoes(<String>[]);
      },
    );
  }

  Future<void> _sendCode(
    SendCodeEvent event,
    Emitter<ConfirmationUserState> emit,
  ) async {
    final result = await sendCodeUseCase(
      SendCodeParams(
        requestEntity: SendCodeRequestEntity(
          type: 'PHONE',
          otp: 'client_confirmation_code'.tr(),
          phoneNumber: '+998${event.phoneNumber}',
        ),
      ),
    );

    result.fold(
      (l) => emit(state.copyWith(getSmsIdStatus: ApiStatus.error)),
      (r) {
        localSource.setSmsId(r.smsId);
        emit(state.copyWith(getSmsIdStatus: ApiStatus.success));
      },
    );
  }

  Future<void> _checkUserEvent(
    CheckUserEvent event,
    Emitter<ConfirmationUserState> emit,
  ) async {
    emit(state.copyWith(checkUserStatus: ApiStatus.loading, getSmsIdStatus: ApiStatus.loading));
    final result = await checkUserUseCase(
      CheckUserParams(
        requestEntity: CheckUserRequestEntity(
          phoneNumber: '998${event.phoneNumber}',
        ),
      ),
    );

    result.fold(
      (l) => emit(state.copyWith(checkUserStatus: ApiStatus.error, getSmsIdStatus: ApiStatus.initial)),
      (r) {
        if (r.users.isEmpty) {
          emit(state.copyWith(checkUserStatus: ApiStatus.success));
        } else {
          emit(state.copyWith(checkUserStatus: ApiStatus.error, getSmsIdStatus: ApiStatus.initial));
        }
      },
    );
  }

  Future<void> _verifyOtpChanged(
    VerifyOtpChangedEvent event,
    Emitter<ConfirmationUserState> emit,
  ) async {
    emit(state.copyWith(verifyOtpStatus: ApiStatus.loading));
    final result = await verifyOtpUseCase(
      VerifyCodeParams(
        requestEntity: VerifyOtpRequestModel(
          data: VerifyRequestData(
            smsId: localSource.smsId,
            otp: event.otp,
            phone: event.phoneNumber,
            roleId: Constants.roleDriverId,
            clientTypeId: Constants.clientTypeDriverId,
          ),
          loginStrategy: 'PHONE_OTP',
        ),
      ),
    );

    result.fold(
      (l) => emit(state.copyWith(verifyOtpStatus: ApiStatus.error)),
      (r) {
        if (r) {
          localSource.deleteSmsId();
          emit(state.copyWith(verifyOtpStatus: ApiStatus.success));
        } else {
          emit(state.copyWith(verifyOtpStatus: ApiStatus.userFoundError));
        }
      },
    );
  }

  void _writePhoneNumber(
    WritePhoneNumberEvent event,
    Emitter<ConfirmationUserState> emit,
  ) {
    if (event.phoneNumber.length == 12) {
      emit(
        state.copyWith(
          isValidPhoneNumber: true,
          phoneNumber: event.phoneNumber,
        ),
      );
    } else {
      emit(state.copyWith(isValidPhoneNumber: false));
    }
  }

  void _writeOtp(
    WriteOtpEvent event,
    Emitter<ConfirmationUserState> emit,
  ) {
    if (event.otp.length == 6) {
      emit(
        state.copyWith(
          otp: event.otp,
        ),
      );
    } else {
      emit(state.copyWith(otp: ''));
    }
  }

  void _selectUserRoleEvent(
    SelectedRoleChangedEvent event,
    Emitter<ConfirmationUserState> emit,
  ) {
    emit(state.copyWith(selectedRole: event.selectedRole));
  }

  void _selectCompanyEvent(
    SelectedTrailerChangedEvent event,
    Emitter<ConfirmationUserState> emit,
  ) {
    emit(state.copyWith(selectedTypeItem: event.trailerTypeItem));
  }

  void _changeUserAgreement(
    UserAgreementChangedEvent event,
    Emitter<ConfirmationUserState> emit,
  ) {
    emit(state.copyWith(isUserAgreement: !state.isUserAgreement));
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

  Future<void> _getTrailerType(
    GetTrailerTypeEvent event,
    Emitter<ConfirmationUserState> emit,
  ) async {
    emit(state.copyWith(getCompaniesStatus: ApiStatus.loading));
    final result = await getTrailerTypeUsecase({});
    result.fold(
      (l) => emit(
        state.copyWith(
          getCompaniesStatus: ApiStatus.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          trailerTypes: r.trailerTypes,
          getCompaniesStatus: ApiStatus.success,
        ),
      ),
    );
  }
}
