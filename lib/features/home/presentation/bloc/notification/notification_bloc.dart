import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../../router/app_routes.dart';
import '../../../../../services/api_status.dart';
import '../../../domain/entities/notification/notification_response_entity.dart';
import '../../../domain/usecases/fetch_notification_usecase.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc({
    required this.fetchNotificationUseCase,
  }) : super(const NotificationState()) {
    on<FetchNotificationEvent>(_fetchNotification);
  }

  final FetchNotificationUseCase fetchNotificationUseCase;

  Future<void> _fetchNotification(
    FetchNotificationEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(state.copyWith(fetchNotificationStatus: ApiStatus.loading));
    final response = await fetchNotificationUseCase(NoParams());
    response.fold(
      (failure) {
        emit(state.copyWith(fetchNotificationStatus: ApiStatus.error));
      },
      (data) {
        emit(
          state.copyWith(
            fetchNotificationStatus: ApiStatus.success,
            notificationList: data.notifications,
          ),
        );
      },
    );
  }
}
