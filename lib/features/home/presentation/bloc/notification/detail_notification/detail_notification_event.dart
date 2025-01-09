part of 'detail_notification_bloc.dart';

abstract class PutNotificationEvent extends Equatable {
  const PutNotificationEvent();
}

class PutSingleNotificationEvent extends PutNotificationEvent {
  const PutSingleNotificationEvent({
    required this.guid,
  });

  final String guid;

  @override
  List<Object> get props => [
        guid,
      ];
}
