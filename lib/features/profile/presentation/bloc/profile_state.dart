part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.status = ApiStatus.initial,
    this.deleteUserStatus = ApiStatus.initial,
    this.userInfo,
  });

  final ApiStatus status;
  final ApiStatus deleteUserStatus;
  final GetUserInfoResponseEntity? userInfo;

  @override
  List<Object?> get props => [
        status,
        userInfo,
        deleteUserStatus,
      ];

  ProfileState copyWith({
    ApiStatus? status,
    ApiStatus? deleteUserStatus,
    GetUserInfoResponseEntity? userInfo,
  }) =>
      ProfileState(
        status: status ?? this.status,
        deleteUserStatus: deleteUserStatus ?? ApiStatus.initial,
        userInfo: userInfo ?? this.userInfo,
      );
}
