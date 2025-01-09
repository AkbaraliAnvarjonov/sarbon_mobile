part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  const NotificationState({
    this.fetchNotificationStatus = ApiStatus.initial,
    this.notificationList = const [],
  });

  final ApiStatus fetchNotificationStatus;

  final List<NotificationEntity> notificationList;

  NotificationState copyWith({
    ApiStatus? fetchNotificationStatus,
    List<NotificationEntity>? notificationList,
  }) =>
      NotificationState(
        fetchNotificationStatus:
            fetchNotificationStatus ?? this.fetchNotificationStatus,
        notificationList: notificationList ?? this.notificationList,
      );

  @override
  List<Object?> get props => [
        fetchNotificationStatus,
        notificationList,
      ];
}
