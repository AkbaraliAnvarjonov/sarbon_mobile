part of 'order_for_notification_bloc.dart';

class OrderForNotificationState extends Equatable {
  const OrderForNotificationState({
    this.getOrderDetailsStatus = ApiStatus.initial,
    this.addressStatus = ApiStatus.initial,
    this.getOrderDetails,
    this.addressesDetail = const [],
    this.addresses = const [],
    this.finallyAddresses = const [],
    this.putOrderStatus = ApiStatus.initial,
  });

  final ApiStatus getOrderDetailsStatus;
  final ApiStatus addressStatus;
  final ApiStatus putOrderStatus;
  final GetOrderByNotificationEntity? getOrderDetails;
  final List<GetAddressesListDetailEntity> addressesDetail;
  final List<FetchListPositionsEntity> addresses;
  final List<OrderAddressesByNotificationPoint> finallyAddresses;

  OrderForNotificationState copyWith({
    ApiStatus? getOrderDetailsStatus,
    ApiStatus? addressStatus,
    GetOrderByNotificationEntity? getOrderDetails,
    List<GetAddressesListDetailEntity>? addressesDetail,
    List<FetchListPositionsEntity>? addresses,
    List<OrderAddressesByNotificationPoint>? finallyAddresses,
    ApiStatus? putOrderStatus,
  }) =>
      OrderForNotificationState(
        getOrderDetailsStatus:
            getOrderDetailsStatus ?? this.getOrderDetailsStatus,
        addressStatus: addressStatus ?? this.addressStatus,
        getOrderDetails: getOrderDetails ?? this.getOrderDetails,
        addressesDetail: addressesDetail ?? this.addressesDetail,
        addresses: addresses ?? this.addresses,
        finallyAddresses: finallyAddresses ?? this.finallyAddresses,
        putOrderStatus: putOrderStatus ?? ApiStatus.initial,
      );

  @override
  List<Object?> get props => [
        getOrderDetailsStatus,
        addressStatus,
        getOrderDetails,
        addresses,
        addressesDetail,
        finallyAddresses,
        putOrderStatus,
      ];
}
