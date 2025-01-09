part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.selectedRole,
    this.phoneNumber = '',
    this.getSmsIdStatus = ApiStatus.initial,
    this.verifyOtpStatus = ApiStatus.initial,
    this.otp = '',
    this.putUserPasswordStatus = ApiStatus.initial,
  });

  final UserRole? selectedRole;
  final String phoneNumber;
  final ApiStatus getSmsIdStatus;
  final ApiStatus verifyOtpStatus;
  final String otp;
  final ApiStatus putUserPasswordStatus;

  ForgotPasswordState copyWith({
    UserRole? selectedRole,
    String? phoneNumber,
    ApiStatus? getSmsIdStatus,
    ApiStatus? verifyOtpStatus,
    String? otp,
    ApiStatus? putUserPasswordStatus,
  }) =>
      ForgotPasswordState(
        selectedRole: selectedRole ?? this.selectedRole,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        getSmsIdStatus: getSmsIdStatus ?? ApiStatus.initial,
        verifyOtpStatus: verifyOtpStatus ?? this.verifyOtpStatus,
        putUserPasswordStatus:
            putUserPasswordStatus ?? this.putUserPasswordStatus,
        otp: otp ?? this.otp,
      );

  @override
  List<Object?> get props => [
        selectedRole,
        phoneNumber,
        getSmsIdStatus,
        verifyOtpStatus,
        otp,
        putUserPasswordStatus,
      ];
}
