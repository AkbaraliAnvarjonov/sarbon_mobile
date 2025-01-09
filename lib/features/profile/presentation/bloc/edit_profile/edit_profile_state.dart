part of 'edit_profile_bloc.dart';

class EditProfileState extends Equatable {
  const EditProfileState({
    this.image,
    this.updateInfoStatus = ApiStatus.initial,
    this.password = '',
    this.isRemoveImage = false,
  });

  final File? image;
  final ApiStatus updateInfoStatus;
  final String password;
  final bool isRemoveImage;

  EditProfileState copyWith({
    File? image,
    ApiStatus? updateInfoStatus,
    String? password,
    bool? isRemoveImage,
  }) =>
      EditProfileState(
        image: image ?? this.image,
        updateInfoStatus: updateInfoStatus ?? ApiStatus.initial,
        password: password ?? this.password,
        isRemoveImage: isRemoveImage ?? this.isRemoveImage,
      );

  @override
  List<Object?> get props => [
        image,
        updateInfoStatus,
        password,
        isRemoveImage,
      ];
}
