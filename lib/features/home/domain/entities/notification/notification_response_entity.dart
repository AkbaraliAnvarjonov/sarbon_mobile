import 'package:equatable/equatable.dart';

import '../../../data/models/notification/notification_response.dart';

class NotificationResponseEntity extends Equatable {
  const NotificationResponseEntity({
    required this.notifications,
  });

  final List<NotificationEntity> notifications;

  @override
  List<Object?> get props => [notifications];
}

class NotificationEntity extends Equatable {
  const NotificationEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.imageUrl,
    required this.usersId,
    required this.type,
    required this.cargoId,
    required this.isRead ,
  });

  final String id;
  final String title;
  final String description;
  final String date;
  final String imageUrl;
  final String usersId;
  final String type;
  final String cargoId;
  final bool isRead;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        date,
        imageUrl,
        usersId,
        type,
        cargoId,
        isRead,
      ];
}

extension NotificationResponseEntityX on NotificationResponse {
  NotificationResponseEntity toEntity() => NotificationResponseEntity(
        notifications: data?.data?.response
                ?.map(
                  (notification) => NotificationEntity(
                    isRead: notification.isRead ?? false,
                    id: notification.guid ?? '',
                    title: notification.title ?? '',
                    description: notification.notification ?? '',
                    date: notification.time ?? '',
                    imageUrl: notification.image ?? '',
                    usersId: notification.userId ?? '',
                    type: notification.type ?? '',
                    cargoId: notification.cargoId ?? '',
                  ),
                )
                .toList() ??
            [],
      );
}
