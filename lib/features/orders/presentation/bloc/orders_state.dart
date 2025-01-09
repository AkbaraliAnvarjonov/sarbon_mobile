part of 'orders_bloc.dart';

class OrdersState extends Equatable {
  const OrdersState({
    this.status = ApiStatus.initial,
    this.newOrders = const [],
    this.finishedOrders = const [],
    this.archivedOrders = const [],
    this.cancelledOrders = const [],
    this.newOrdersCount = 0,
    this.finishedOrdersCount = 0,
    this.archivedOrdersCount = 0,
    this.cancelledOrdersCount = 0,
    this.tabIndex = 0,
    this.limit = 5,
    this.rating = 0,
    this.goodClient = const {'good_customer': false},
    this.paymentOnTime = const {'money_on_time': false},
    this.clientDidNotPay = const {'client_did_not_pay': false},
    this.ratingReviews = const [],
    this.isAccidentSelected = const {},
    this.isBreakdownSelected = const {},
    this.selectedStatusIndex = const {},
    this.indicateStatus = const {},
    this.orderStatusAndRatingStatus = ApiStatus.initial,
    this.onTapedIndex = -1,
    this.isUpdateState = false,
    this.newOrdersStatus = ApiStatus.initial,
    this.signedOrdersStatus = ApiStatus.initial,
    this.archivedOrdersStatus = ApiStatus.initial,
    this.cancelledOrdersStatus = ApiStatus.initial,
    this.newOrderPageNumber = 0,
    this.signedOrderPageNumber = 0,
    this.archivedOrderPageNumber = 0,
    this.cancelledOrderPageNumber = 0,
  });

  final ApiStatus status;
  final int tabIndex;
  final int limit;
  final int onTapedIndex;
  final int newOrderPageNumber;
  final int signedOrderPageNumber;
  final int archivedOrderPageNumber;
  final int cancelledOrderPageNumber;

  /// Orders list with types
  final List<OrderItemEntity> newOrders;
  final List<OrderItemEntity> finishedOrders;
  final List<OrderItemEntity> archivedOrders;
  final List<OrderItemEntity> cancelledOrders;

  /// Count of orders list
  final int newOrdersCount;
  final int finishedOrdersCount;
  final int archivedOrdersCount;
  final int cancelledOrdersCount;

  /// Show status
  final ApiStatus orderStatusAndRatingStatus;
  final double rating;
  final Map<String, bool> goodClient;
  final Map<String, bool> paymentOnTime;
  final Map<String, bool> clientDidNotPay;
  final List<String> ratingReviews;
  final Map<int, bool> isAccidentSelected;
  final Map<int, bool> isBreakdownSelected;
  final Map<int, int> selectedStatusIndex;
  final Map<int, List<String>> indicateStatus;
  final bool isUpdateState;
  final ApiStatus newOrdersStatus;
  final ApiStatus signedOrdersStatus;
  final ApiStatus archivedOrdersStatus;
  final ApiStatus cancelledOrdersStatus;

  @override
  List<Object?> get props => [
        status,
        tabIndex,
        limit,
        newOrders,
        finishedOrders,
        archivedOrders,
        cancelledOrders,
        newOrdersCount,
        finishedOrdersCount,
        archivedOrdersCount,
        cancelledOrdersCount,
        rating,
        goodClient,
        paymentOnTime,
        clientDidNotPay,
        ratingReviews,
        isAccidentSelected,
        isBreakdownSelected,
        selectedStatusIndex,
        indicateStatus,
        orderStatusAndRatingStatus,
        onTapedIndex,
        isUpdateState,
        newOrdersStatus,
        signedOrdersStatus,
        archivedOrdersStatus,
        cancelledOrdersStatus,
        newOrderPageNumber,
        signedOrderPageNumber,
        archivedOrderPageNumber,
        cancelledOrderPageNumber,
      ];

  OrdersState copyWith({
    ApiStatus? status,
    int? tabIndex,
    int? limit,
    List<OrderItemEntity>? newOrders,
    List<OrderItemEntity>? finishedOrders,
    List<OrderItemEntity>? archivedOrders,
    List<OrderItemEntity>? cancelledOrders,
    int? newOrdersCount,
    int? finishedOrdersCount,
    int? archivedOrdersCount,
    int? cancelledOrdersCount,
    double? rating,
    Map<String, bool>? goodClient,
    Map<String, bool>? paymentOnTime,
    Map<String, bool>? clientDidNotPay,
    List<String>? ratingReviews,
    Map<int, bool>? isAccidentSelected,
    Map<int, bool>? isBreakdownSelected,
    Map<int, int>? selectedStatusIndex,
    Map<int, List<String>>? indicateStatus,
    ApiStatus? orderStatusAndRatingStatus,
    int? onTapedIndex,
    bool? isUpdateState,
    ApiStatus? newOrdersStatus,
    ApiStatus? signedOrdersStatus,
    ApiStatus? archivedOrdersStatus,
    ApiStatus? cancelledOrdersStatus,
    int? newOrderPageNumber,
    int? signedOrderPageNumber,
    int? archivedOrderPageNumber,
    int? cancelledOrderPageNumber,
  }) =>
      OrdersState(
        status: status ?? this.status,
        tabIndex: tabIndex ?? this.tabIndex,
        limit: limit ?? this.limit,
        newOrders: newOrders ?? this.newOrders,
        finishedOrders: finishedOrders ?? this.finishedOrders,
        archivedOrders: archivedOrders ?? this.archivedOrders,
        cancelledOrders: cancelledOrders ?? this.cancelledOrders,
        newOrdersCount: newOrdersCount ?? this.newOrdersCount,
        finishedOrdersCount: finishedOrdersCount ?? this.finishedOrdersCount,
        archivedOrdersCount: archivedOrdersCount ?? this.archivedOrdersCount,
        cancelledOrdersCount: cancelledOrdersCount ?? this.cancelledOrdersCount,
        rating: rating ?? this.rating,
        goodClient: goodClient ?? this.goodClient,
        paymentOnTime: paymentOnTime ?? this.paymentOnTime,
        clientDidNotPay: clientDidNotPay ?? this.clientDidNotPay,
        ratingReviews: ratingReviews ?? this.ratingReviews,
        isAccidentSelected: isAccidentSelected ?? this.isAccidentSelected,
        isBreakdownSelected: isBreakdownSelected ?? this.isBreakdownSelected,
        selectedStatusIndex: selectedStatusIndex ?? this.selectedStatusIndex,
        indicateStatus: indicateStatus ?? this.indicateStatus,
        orderStatusAndRatingStatus:
            orderStatusAndRatingStatus ?? ApiStatus.initial,
        onTapedIndex: onTapedIndex ?? this.onTapedIndex,
        isUpdateState: isUpdateState ?? !this.isUpdateState,
        newOrdersStatus: newOrdersStatus ?? ApiStatus.initial,
        signedOrdersStatus: signedOrdersStatus ?? ApiStatus.initial,
        archivedOrdersStatus: archivedOrdersStatus ?? ApiStatus.initial,
        cancelledOrdersStatus: cancelledOrdersStatus ?? ApiStatus.initial,
        newOrderPageNumber: newOrderPageNumber ?? this.newOrderPageNumber,
        signedOrderPageNumber:
            signedOrderPageNumber ?? this.signedOrderPageNumber,
        archivedOrderPageNumber:
            archivedOrderPageNumber ?? this.archivedOrderPageNumber,
        cancelledOrderPageNumber:
            cancelledOrderPageNumber ?? this.cancelledOrderPageNumber,
      );
}
