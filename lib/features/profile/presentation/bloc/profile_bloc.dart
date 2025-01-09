import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../router/app_routes.dart';
import '../../../../services/api_status.dart';
import '../../domain/entities/get_user_info_response_entity.dart';
import '../../domain/usecases/delete_user_usecase.dart';
import '../../domain/usecases/get_user_info_usecase.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required this.getUserInfoUseCase,
    required this.deleteUserUseCase,
  }) : super(const ProfileState()) {
    on<GetUserInfoEvent>(_getUserInfo);
    on<DeleteUserEvent>(_deleteUser);
  }

  final GetUserInfoUseCase getUserInfoUseCase;
  final DeleteUserUseCase deleteUserUseCase;

  Future<void> _getUserInfo(
    GetUserInfoEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final response = await getUserInfoUseCase(localSource.userId);
    response.fold(
      (l) => emit(state.copyWith(status: ApiStatus.error)),
      (r) {
        localSource.setUser(
          imageUrl: r.photo ?? '',
          name: r.fullName ?? '',
          phoneNumber: r.phone ?? '',
          email: r.email ?? '',
          login: r.login ?? '',
          password: r.password ?? '',
        );
        emit(
          state.copyWith(
            userInfo: r,
            status: ApiStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _deleteUser(
    DeleteUserEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(deleteUserStatus: ApiStatus.loading));
    final response = await deleteUserUseCase(localSource.userId);
    response.fold(
      (l) => emit(state.copyWith(deleteUserStatus: ApiStatus.error)),
      (r) => emit(state.copyWith(deleteUserStatus: ApiStatus.success)),
    );
  }
}
