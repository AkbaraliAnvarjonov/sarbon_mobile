part of 'order_for_notification_bloc.dart';

abstract class OrderForNotificationEvent extends Equatable {
  const OrderForNotificationEvent();
}

class GetOrderDetailsByNotificationEvent extends OrderForNotificationEvent {
  const GetOrderDetailsByNotificationEvent({
    required this.guid,
  });

  final String guid;

  @override
  List<Object> get props => [
        guid,
      ];
}

class GetDetailAddressesByNotificationEvent extends OrderForNotificationEvent {
  const GetDetailAddressesByNotificationEvent({
    required this.guid,
  });

  final String guid;

  @override
  List<Object> get props => [guid];
}

class GetAddressesPositionsEvent extends OrderForNotificationEvent {
  const GetAddressesPositionsEvent({
    required this.guid,
  });

  final String guid;

  @override
  List<Object?> get props => [guid];
}

class SendDealOrderEvent extends OrderForNotificationEvent {
  const SendDealOrderEvent({
    required this.orderId,
    required this.cargoId,
  });

  final String orderId;
  final String cargoId;

  @override
  List<Object?> get props => [
        orderId,
        cargoId,
      ];
}

class CancelOrderEvent extends OrderForNotificationEvent {
  const CancelOrderEvent({required this.orderId});

  final String orderId;

  @override
  List<Object?> get props => [orderId];
}
