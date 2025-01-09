part of 'orders_bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();
}

class OrdersTabChangedEvent extends OrdersEvent {
  const OrdersTabChangedEvent({required this.tabIndex});

  final int tabIndex;

  @override
  List<Object?> get props => [tabIndex];
}

class FetchSignedOrdersEvent extends OrdersEvent {
  const FetchSignedOrdersEvent();

  @override
  List<Object?> get props => [];
}

class FetchArchivedOrdersEvent extends OrdersEvent {
  const FetchArchivedOrdersEvent();

  @override
  List<Object?> get props => [];
}

class FetchCancelledOrdersEvent extends OrdersEvent {
  const FetchCancelledOrdersEvent();

  @override
  List<Object?> get props => [];
}

class FetchNewOrdersEvent extends OrdersEvent {
  const FetchNewOrdersEvent();

  @override
  List<Object?> get props => [];
}

class PutCancelOrderEvent extends OrdersEvent {
  const PutCancelOrderEvent({
    required this.orderId,
    required this.carType,
  });

  final String orderId;
  final String carType;

  @override
  List<Object?> get props => [
        orderId,
        carType,
      ];
}

class SendDealOrderEvent extends OrdersEvent {
  const SendDealOrderEvent({
    required this.orderId,
    required this.cargoId,
    required this.carType,
    required this.acceptedOffers,
    required this.provisions,
  });

  final String orderId;
  final String cargoId;
  final String carType;
  final List<String> provisions;
  final num acceptedOffers;

  @override
  List<Object?> get props => [
        orderId,
        cargoId,
        provisions,
        acceptedOffers,
        carType,
      ];
}

class SendFinishedOrderEvent extends OrdersEvent {
  const SendFinishedOrderEvent({
    required this.orderId,
    required this.carType,
  });

  final String orderId;
  final String carType;

  @override
  List<Object?> get props => [orderId, carType];
}

/// Show status events

class PutOrderStatusEvent extends OrdersEvent {
  const PutOrderStatusEvent({
    required this.orderId,
    required this.carType,
  });

  final String orderId;
  final String carType;

  @override
  List<Object?> get props => [orderId, carType];
}

class GiveRatingEvent extends OrdersEvent {
  const GiveRatingEvent({
    required this.rating,
  });

  final double rating;

  @override
  List<Object?> get props => [rating];
}

class SelectRatingCauseItemsEvent extends OrdersEvent {
  const SelectRatingCauseItemsEvent({
    required this.index,
    required this.status,
  });

  final int index;
  final bool status;

  @override
  List<Object?> get props => [index, status];
}

class PostRatingReviewsEvent extends OrdersEvent {
  const PostRatingReviewsEvent({
    required this.comment,
    required this.companyId,
    required this.usersId3,
  });

  final String comment;
  final String companyId;
  final String usersId3;

  @override
  List<Object?> get props => [comment, companyId, usersId3];
}

class SelectAccidentEvent extends OrdersEvent {
  const SelectAccidentEvent({
    required this.status,
    required this.index,
  });

  final bool status;
  final int index;

  @override
  List<Object?> get props => [status, index];
}

class SelectBreakdownEvent extends OrdersEvent {
  const SelectBreakdownEvent({
    required this.status,
    required this.index,
  });

  final bool status;
  final int index;

  @override
  List<Object?> get props => [status, index];
}

class SelectStatusEvent extends OrdersEvent {
  const SelectStatusEvent({
    required this.index,
    required this.itemIndex,
  });

  final int index;
  final int itemIndex;

  @override
  List<Object?> get props => [
        index,
        itemIndex,
      ];
}

class ChangeOnTapedIndexEvent extends OrdersEvent {
  const ChangeOnTapedIndexEvent({
    required this.index,
  });

  final int index;

  @override
  List<Object?> get props => [index];
}

/// Pagination events

class FetchNewOrdersPaginationEvent extends OrdersEvent {
  const FetchNewOrdersPaginationEvent();

  @override
  List<Object?> get props => [];
}

class FetchSignedOrdersPaginationEvent extends OrdersEvent {
  const FetchSignedOrdersPaginationEvent();

  @override
  List<Object?> get props => [];
}

class FetchArchivedOrdersPaginationEvent extends OrdersEvent {
  const FetchArchivedOrdersPaginationEvent();

  @override
  List<Object?> get props => [];
}

class FetchCancelledOrdersPaginationEvent extends OrdersEvent {
  const FetchCancelledOrdersPaginationEvent();

  @override
  List<Object?> get props => [];
}
