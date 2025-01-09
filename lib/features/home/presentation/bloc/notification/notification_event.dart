part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class FetchNotificationEvent extends NotificationEvent {
  const FetchNotificationEvent();

  @override
  List<Object> get props => [];
}
