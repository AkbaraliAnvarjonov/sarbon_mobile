import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../../services/api_status.dart';
import '../../../domain/entities/announcement/get_active_inactive_announcement/get_active_inactive_announcement_entity.dart';
import '../../../domain/usecases/announcement/get_active_announcement_usecase.dart';
import '../../../domain/usecases/announcement/get_inactive_announcement_usecase.dart';

part 'announcement_event.dart';

part 'announcement_state.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  AnnouncementBloc({
    required this.getActiveAnnouncementUseCase,
    required this.getInActiveAnnouncementUseCase,
  }) : super(const AnnouncementState()) {
    on<GetActiveAnnouncementEvent>(_getActiveAnnouncement);
    on<GetInActiveAnnouncementEvent>(_getInActiveAnnouncement);
  }

  final GetActiveAnnouncementUseCase getActiveAnnouncementUseCase;
  final GetInActiveAnnouncementUseCase getInActiveAnnouncementUseCase;

  Future<void> _getActiveAnnouncement(
    GetActiveAnnouncementEvent event,
    Emitter<AnnouncementState> emit,
  ) async {
    emit(state.copyWith(getActiveAnnouncementStatus: ApiStatus.loading));
    final response = await getActiveAnnouncementUseCase(NoParams());
    response.fold(
      (failure) {
        emit(state.copyWith(getActiveAnnouncementStatus: ApiStatus.error));
      },
      (entity) {
        emit(
          state.copyWith(
            getActiveAnnouncementStatus: ApiStatus.success,
            activeAnnouncementList: entity.activeInActiveAnnouncementList,
          ),
        );
      },
    );
  }

  Future<void> _getInActiveAnnouncement(
    GetInActiveAnnouncementEvent event,
    Emitter<AnnouncementState> emit,
  ) async {
    emit(state.copyWith(getInActiveAnnouncementStatus: ApiStatus.loading));
    final response = await getInActiveAnnouncementUseCase(NoParams());
    response.fold(
      (failure) {
        emit(state.copyWith(getInActiveAnnouncementStatus: ApiStatus.error));
      },
      (entity) {
        emit(
          state.copyWith(
            getInActiveAnnouncementStatus: ApiStatus.success,
            inActiveAnnouncementList: entity.activeInActiveAnnouncementList,
          ),
        );
      },
    );
  }
}
