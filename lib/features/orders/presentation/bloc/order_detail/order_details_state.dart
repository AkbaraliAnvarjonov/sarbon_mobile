part of 'order_details_bloc.dart';

class OrderDetailsState extends Equatable {
  const OrderDetailsState({
    this.orderDetailStatus = ApiStatus.initial,
    this.details,
    this.rating = 0,
    this.complaintString = '',
    this.ratingReviews = const [],
    this.isAccidentSelected = false,
    this.isBreakdownSelected = false,
    this.selectedStatusIndex = -1,
    this.indicateStatus = const [],
    this.addresses = const [],
    this.addressStatus = ApiStatus.initial,
    this.addressesDetail = const [],
    this.addressPositionsStatus = ApiStatus.initial,
    this.addressPositions = const [],
  });

  final ApiStatus orderDetailStatus;
  final ApiStatus addressStatus;
  final ApiStatus addressPositionsStatus;
  final GetOrderDetailsResponseEntity? details;
  final List<GetAddressesDetailEntity> addressesDetail;
  final List<FetchAddressesPositionsEntity> addressPositions;
  final List<OrderAddressesPoint> addresses;
  final double rating;
  final List<String> ratingReviews;
  final bool isAccidentSelected;
  final bool isBreakdownSelected;
  final int selectedStatusIndex;
  final String complaintString;
  final List<String> indicateStatus;

  @override
  List<Object?> get props => [
        orderDetailStatus,
        details,
        rating,
        ratingReviews,
        isAccidentSelected,
        isBreakdownSelected,
        selectedStatusIndex,
        indicateStatus,
        complaintString,
        addresses,
        addressStatus,
        addressesDetail,
        addressPositionsStatus,
        addressPositions,
      ];

  OrderDetailsState copyWith({
    ApiStatus? orderDetailStatus,
    GetOrderDetailsResponseEntity? details,
    double? rating,
    String? complaintString,
    List<String>? ratingReviews,
    bool? isAccidentSelected,
    bool? isBreakdownSelected,
    int? selectedStatusIndex,
    List<String>? indicateStatus,
    List<OrderAddressesPoint>? addresses,
    ApiStatus? addressStatus,
    List<GetAddressesDetailEntity>? addressesDetail,
    ApiStatus? addressPositionsStatus,
    List<FetchAddressesPositionsEntity>? addressPositions,
  }) =>
      OrderDetailsState(
        orderDetailStatus: orderDetailStatus ?? ApiStatus.initial,
        details: details ?? this.details,
        rating: rating ?? this.rating,
        complaintString: complaintString ?? this.complaintString,
        ratingReviews: ratingReviews ?? this.ratingReviews,
        isAccidentSelected: isAccidentSelected ?? this.isAccidentSelected,
        isBreakdownSelected: isBreakdownSelected ?? this.isBreakdownSelected,
        selectedStatusIndex: selectedStatusIndex ?? this.selectedStatusIndex,
        indicateStatus: indicateStatus ?? this.indicateStatus,
        addresses: addresses ?? this.addresses,
        addressStatus: addressStatus ?? ApiStatus.initial,
        addressesDetail: addressesDetail ?? this.addressesDetail,
        addressPositionsStatus: addressPositionsStatus ?? ApiStatus.initial,
        addressPositions: addressPositions ?? this.addressPositions,
      );
}
