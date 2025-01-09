part of 'user_agreement_bloc.dart';

class UserAgreementState extends Equatable {
  const UserAgreementState({
    this.userAgreementStatus = ApiStatus.initial,
    this.userAgreement = '',
  });

  final ApiStatus userAgreementStatus;
  final String userAgreement;

  UserAgreementState copyWith({
    ApiStatus? userAgreementStatus,
    String? userAgreement,
  }) =>
      UserAgreementState(
        userAgreementStatus: userAgreementStatus ?? this.userAgreementStatus,
        userAgreement: userAgreement ?? this.userAgreement,
      );

  @override
  List<Object?> get props => [
        userAgreementStatus,
        userAgreement,
      ];
}
