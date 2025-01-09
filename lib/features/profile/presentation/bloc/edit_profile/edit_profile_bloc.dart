import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../services/api_status.dart';
import '../../../data/models/user_update/put_user_info_request.dart';
import '../../../domain/usecases/put_user_info/put_user_info_usecase.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc({
    required this.putUserInfoUseCase,
  }) : super(const EditProfileState()) {
    on<ChangeImageEvent>(_changeImage);
    on<StatusChangedEvent>(_statusChanged);
    on<ChangePasswordEvent>(_changePassword);
    on<PutUserInfoEvent>(_putUserInfo);
    on<IsRemoveUserImageEvent>(_removeUserImage);
  }

  final PutUserInfoUseCase putUserInfoUseCase;

  Future<void> _putUserInfo(
    PutUserInfoEvent event,
    Emitter<EditProfileState> emit,
  ) async {
    final response = await putUserInfoUseCase(event.userInfo);
    response.fold(
      (failure) {
        emit(state.copyWith(updateInfoStatus: ApiStatus.error));
      },
      (success) {
        emit(state.copyWith(updateInfoStatus: ApiStatus.success));
      },
    );
  }

  void _changeImage(
    ChangeImageEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(
      state.copyWith(
        image: event.image,
        isRemoveImage: false,
      ),
    );
  }

  void _statusChanged(
    StatusChangedEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(updateInfoStatus: ApiStatus.loading));
  }

  void _changePassword(
    ChangePasswordEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _removeUserImage(
    IsRemoveUserImageEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(isRemoveImage: true));
  }
}
