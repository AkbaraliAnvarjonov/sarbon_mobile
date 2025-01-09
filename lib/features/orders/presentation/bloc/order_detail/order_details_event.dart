part of 'order_details_bloc.dart';

abstract class OrderDetailsEvent extends Equatable {
  const OrderDetailsEvent();
}

class GetOrderDetailsEvent extends OrderDetailsEvent {
  const GetOrderDetailsEvent({
    required this.guid,
    required this.cargoId,
  });

  final String guid;
  final String cargoId;

  @override
  List<Object?> get props => [guid];
}

class GetDetailAddressesEvent extends OrderDetailsEvent {
  const GetDetailAddressesEvent({
    required this.guid,
  });

  final String guid;

  @override
  List<Object?> get props => [guid];
}

class GetAddressesPositionsEvent extends OrderDetailsEvent {
  const GetAddressesPositionsEvent({
    required this.guid,
  });

  final String guid;

  @override
  List<Object?> get props => [guid];
}

class PutOrderStatusEvent extends OrderDetailsEvent {
  const PutOrderStatusEvent({
    required this.orderId,
  });

  final String orderId;

  @override
  List<Object?> get props => [orderId];
}

class GiveRatingEvent extends OrderDetailsEvent {
  const GiveRatingEvent({
    required this.rating,
  });

  final double rating;

  @override
  List<Object?> get props => [rating];
}

class SelectRatingCauseItemsEvent extends OrderDetailsEvent {
  const SelectRatingCauseItemsEvent({
    required this.key,
  });

  final String key;

  @override
  List<Object?> get props => [key];
}

class PostRatingReviewsEvent extends OrderDetailsEvent {
  const PostRatingReviewsEvent();

  @override
  List<Object?> get props => [];
}

class ChangeComplaintEvent extends OrderDetailsEvent {
  const ChangeComplaintEvent({
    required this.complaintComment,
  });

  final String complaintComment;

  @override
  List<Object?> get props => [complaintComment];
}

class SelectAccidentEvent extends OrderDetailsEvent {
  const SelectAccidentEvent({
    required this.status,
  });

  final bool status;

  @override
  List<Object?> get props => [status];
}

class SelectBreakdownEvent extends OrderDetailsEvent {
  const SelectBreakdownEvent({
    required this.status,
  });

  final bool status;

  @override
  List<Object?> get props => [status];
}

class SelectStatusEvent extends OrderDetailsEvent {
  const SelectStatusEvent({
    required this.index,
  });

  final int index;

  @override
  List<Object?> get props => [
        index,
      ];
}
