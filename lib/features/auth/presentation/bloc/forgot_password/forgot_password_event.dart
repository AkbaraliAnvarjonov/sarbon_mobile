part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
}

class SelectedRoleChangedEvent extends ForgotPasswordEvent {
  final UserRole selectedRole;

  const SelectedRoleChangedEvent({
    required this.selectedRole,
  });

  @override
  List<Object?> get props => [selectedRole];
}

class SetPhoneNumberEvent extends ForgotPasswordEvent {
  final String phoneNumber;

  const SetPhoneNumberEvent({
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [phoneNumber];
}

class SendCodeEvent extends ForgotPasswordEvent {
  const SendCodeEvent();

  @override
  List<Object?> get props => [];
}

class VerifyOtpChangedEvent extends ForgotPasswordEvent {
  const VerifyOtpChangedEvent({
    required this.otp,
  });

  final String otp;

  @override
  List<Object> get props => [otp];
}

class SetOtpEvent extends ForgotPasswordEvent {
  const SetOtpEvent({
    required this.otp,
  });

  final String otp;

  @override
  List<Object> get props => [otp];
}

class UpdateUserPasswordEvent extends ForgotPasswordEvent {
  const UpdateUserPasswordEvent({
    required this.password,
  });

  final String password;

  @override
  List<Object> get props => [password];
}
