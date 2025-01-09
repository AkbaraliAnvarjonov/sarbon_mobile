part of 'confirmation_user_bloc.dart';

abstract class ConfirmationUserEvent extends Equatable {
  const ConfirmationUserEvent();
}

class WritePhoneNumberEvent extends ConfirmationUserEvent {
  const WritePhoneNumberEvent(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class SendCodeEvent extends ConfirmationUserEvent {
  const SendCodeEvent(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class CheckUserEvent extends ConfirmationUserEvent {
  const CheckUserEvent(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class VerifyOtpChangedEvent extends ConfirmationUserEvent {
  const VerifyOtpChangedEvent({
    required this.otp,
    required this.phoneNumber,
  });

  final String otp;
  final String phoneNumber;

  @override
  List<Object> get props => [otp, phoneNumber];
}

class WriteOtpEvent extends ConfirmationUserEvent {
  const WriteOtpEvent(this.otp);

  final String otp;

  @override
  List<Object> get props => [otp];
}

class SelectedRoleChangedEvent extends ConfirmationUserEvent {
  const SelectedRoleChangedEvent(this.selectedRole);

  final UserRole selectedRole;

  @override
  List<Object> get props => [selectedRole];
}

class GetCompaniesEvent extends ConfirmationUserEvent {
  const GetCompaniesEvent();

  @override
  List<Object?> get props => [];
}

class SelectedTrailerChangedEvent extends ConfirmationUserEvent {
  const SelectedTrailerChangedEvent(this.trailerTypeItem);

  final TrailerTypeItem trailerTypeItem;

  @override
  List<Object?> get props => [trailerTypeItem];
}

class UserAgreementChangedEvent extends ConfirmationUserEvent {
  const UserAgreementChangedEvent();

  @override
  List<Object> get props => [];
}

class RegisterOperatorEvent extends ConfirmationUserEvent {
  const RegisterOperatorEvent(this.userRegisterInfo);

  final RegisterOperatorRequestEntity userRegisterInfo;

  @override
  List<Object> get props => [userRegisterInfo];
}

class RegisterDriverEvent extends ConfirmationUserEvent {
  const RegisterDriverEvent(this.userRegisterInfo);

  final RegisterDriverRequestEntity userRegisterInfo;

  @override
  List<Object> get props => [userRegisterInfo];
}

class GetTrailerTypeEvent extends ConfirmationUserEvent {
  const GetTrailerTypeEvent();

  @override
  List<Object> get props => [];
}
