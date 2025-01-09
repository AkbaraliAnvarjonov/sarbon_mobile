import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../router/app_routes.dart';
import '../../../../../services/api_status.dart';
import '../../../data/models/user_role/user_role_model.dart';
import '../../../data/models/verify_otp/verify_otp_request_model.dart';
import '../../../domain/entities/send_code/send_code_request_entity.dart';
import '../../../domain/usecases/send_code_usecase.dart';
import '../../../domain/usecases/update_user_password_usecase.dart';
import '../../../domain/usecases/verify_otp_usecase.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({
    required this.sendCodeUseCase,
    required this.verifyOtpUseCase,
    required this.updateUserPasswordUseCase,
  }) : super(const ForgotPasswordState()) {
    on<SelectedRoleChangedEvent>(_selectUserRoleEvent);
    on<SetPhoneNumberEvent>(_writePhoneNumber);
    on<SendCodeEvent>(_sendCode);
    on<VerifyOtpChangedEvent>(_verifyOtpChanged);
    on<SetOtpEvent>(_setOtp);
    on<UpdateUserPasswordEvent>(_updateUserPassword);
  }

  final SendCodeUseCase sendCodeUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final UpdateUserPasswordUseCase updateUserPasswordUseCase;

  void _selectUserRoleEvent(
    SelectedRoleChangedEvent event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(selectedRole: event.selectedRole));
  }

  void _writePhoneNumber(
    SetPhoneNumberEvent event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  Future<void> _sendCode(
    SendCodeEvent event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(getSmsIdStatus: ApiStatus.loading));
    final result = await sendCodeUseCase(
      SendCodeParams(
        requestEntity: SendCodeRequestEntity(
          type: 'PHONE',
          otp: 'client_confirmation_code'.tr(),
          phoneNumber: '+998${state.phoneNumber.replaceAll(' ', '').trim()}',
        ),
      ),
    );

    result.fold(
      (l) {
        emit(state.copyWith(getSmsIdStatus: ApiStatus.error));
      },
      (r) {
        localSource.setSmsId(r.smsId);
        emit(state.copyWith(getSmsIdStatus: ApiStatus.success));
      },
    );
  }

  Future<void> _verifyOtpChanged(
    VerifyOtpChangedEvent event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(verifyOtpStatus: ApiStatus.loading));
    final result = await verifyOtpUseCase(
      VerifyCodeParams(
        requestEntity: VerifyOtpRequestModel(
          data: VerifyRequestData(
            smsId: localSource.smsId,
            otp: event.otp,
            phone: '+998${state.phoneNumber.replaceAll(' ', '').trim()}',
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
          emit(state.copyWith(verifyOtpStatus: ApiStatus.userFoundError));
        } else {
          localSource.deleteSmsId();
          emit(state.copyWith(verifyOtpStatus: ApiStatus.success));
        }
      },
    );
  }

  void _setOtp(
    SetOtpEvent event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(otp: event.otp));
  }

  Future<void> _updateUserPassword(
    UpdateUserPasswordEvent event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(putUserPasswordStatus: ApiStatus.loading));
    final result = await updateUserPasswordUseCase(event.password);

    result.fold(
      (l) => emit(state.copyWith(putUserPasswordStatus: ApiStatus.error)),
      (r) => emit(state.copyWith(putUserPasswordStatus: ApiStatus.success)),
    );
  }
}
