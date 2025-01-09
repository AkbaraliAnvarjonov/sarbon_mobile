part of 'detail_notification_bloc.dart';

class DetailNotificationState extends Equatable {
  const DetailNotificationState({
    this.putNotificationStatus = ApiStatus.initial,
  });

  final ApiStatus putNotificationStatus;

  DetailNotificationState copyWith({
    ApiStatus? putNotificationStatus,
  }) =>
      DetailNotificationState(
        putNotificationStatus:
            putNotificationStatus ?? this.putNotificationStatus,
      );

  @override
  List<Object?> get props => [
        putNotificationStatus,
      ];
}
