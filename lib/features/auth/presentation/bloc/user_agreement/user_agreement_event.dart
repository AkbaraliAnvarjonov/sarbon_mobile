part of 'user_agreement_bloc.dart';

abstract class UserAgreementEvent extends Equatable {
  const UserAgreementEvent();
}

class FetchUserAgreementEvent extends UserAgreementEvent {
  const FetchUserAgreementEvent();

  @override
  List<Object> get props => [];
}
