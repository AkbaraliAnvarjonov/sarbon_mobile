part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetUserInfoEvent extends ProfileEvent {
  const GetUserInfoEvent();

  @override
  List<Object?> get props => [];
}

class DeleteUserEvent extends ProfileEvent {
  const DeleteUserEvent();

  @override
  List<Object?> get props => [];
}