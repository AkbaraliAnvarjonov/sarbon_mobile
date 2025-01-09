import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../services/api_status.dart';
import '../../../../data/models/notification/put_notification_request.dart';
import '../../../../domain/usecases/put_notification_usecase.dart';

part 'detail_notification_event.dart';

part 'detail_notification_state.dart';

class DetailNotificationBloc
    extends Bloc<PutNotificationEvent, DetailNotificationState> {
  DetailNotificationBloc({
    required this.putNotificationUseCase,
  }) : super(const DetailNotificationState()) {
    on<PutSingleNotificationEvent>(_putNotification);
  }

  final PutNotificationUseCase putNotificationUseCase;

  Future<void> _putNotification(
    PutSingleNotificationEvent event,
    Emitter<DetailNotificationState> emit,
  ) async {
    emit(state.copyWith(putNotificationStatus: ApiStatus.loading));
    final response = await putNotificationUseCase(
      PutNotificationParams(
        request: PutNotificationRequest(
          data: Data(
            guid: event.guid,
            isRead: true,
          ),
        ),
      ),
    );
    response.fold(
      (failure) {
        emit(state.copyWith(putNotificationStatus: ApiStatus.error));
      },
      (data) {
        emit(state.copyWith(putNotificationStatus: ApiStatus.success));
      },
    );
  }
}
