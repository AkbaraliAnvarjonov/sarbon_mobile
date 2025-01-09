part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();
}

class ChangeImageEvent extends EditProfileEvent {
  const ChangeImageEvent({
    required this.image,
  });

  final File? image;

  @override
  List<Object?> get props => [
        image,
      ];
}

class IsRemoveUserImageEvent extends EditProfileEvent {
  const IsRemoveUserImageEvent();

  @override
  List<Object?> get props => [];
}

class StatusChangedEvent extends EditProfileEvent {
  const StatusChangedEvent();

  @override
  List<Object?> get props => [];
}

class ChangePasswordEvent extends EditProfileEvent {
  const ChangePasswordEvent({
    required this.password,
  });

  final String password;

  @override
  List<Object?> get props => [
        password,
      ];
}

class PutUserInfoEvent extends EditProfileEvent {
  const PutUserInfoEvent({
    required this.userInfo,
  });

  final PutUserInfoRequest userInfo;

  @override
  List<Object?> get props => [
        userInfo,
      ];
}
