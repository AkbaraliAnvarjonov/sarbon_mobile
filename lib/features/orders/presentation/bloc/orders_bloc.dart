import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../router/app_routes.dart';
import '../../../../services/api_status.dart';
import '../../data/data_source/remote/orders_remote_data_source.dart';
import '../../domain/entities/get_orders_response_entity.dart';
import '../../domain/entities/post_rating_review_request_entity.dart';
import '../../domain/usecases/get_orders_usecase.dart';
import '../../domain/usecases/post_rating_reviews_usecase.dart';
import '../../domain/usecases/put_new_order_status_usecase.dart';
import '../../domain/usecases/put_order_statuses_usecase.dart';
import '../../domain/usecases/put_order_usecase.dart';

part 'orders_event.dart';

part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc({
    required this.getOrdersUseCase,
    required this.putOrderUseCase,
    required this.putOrderStatusesUseCase,
    required this.postRatingReviewsUseCase,
    required this.putNewOrderStatusesUseCase,
    required this.ordersRemoteDataSource,
  }) : super(const OrdersState()) {
    on<OrdersTabChangedEvent>(_tabIndexChanged);
    on<SendDealOrderEvent>(_sendAgreedOrder);
    on<SendFinishedOrderEvent>(_sendFinishedOrder);
    on<PutCancelOrderEvent>(_cancelOrder);
    on<FetchSignedOrdersEvent>(_getFinishedOrders);
    on<FetchArchivedOrdersEvent>(_getArchiveOrders);
    on<FetchCancelledOrdersEvent>(_getCancelledOrders);
    on<FetchNewOrdersEvent>(_getNewOrders);
    on<FetchNewOrdersPaginationEvent>(_fetchNewOrdersPagination);
    on<FetchSignedOrdersPaginationEvent>(_fetchSignedOrdersPagination);
    on<FetchArchivedOrdersPaginationEvent>(_fetchArchiveOrdersPagination);
    on<FetchCancelledOrdersPaginationEvent>(_fetchCancelledOrdersPagination);

    /// Show status events
    on<PutOrderStatusEvent>(_putOrderStatus);
    on<GiveRatingEvent>(_giveRating);
    on<SelectRatingCauseItemsEvent>(_selectRatingCauseItem);
    on<PostRatingReviewsEvent>(_postRatingReviews);
    on<SelectAccidentEvent>(_selectAccident);
    on<SelectBreakdownEvent>(_selectBreakdown);
    on<SelectStatusEvent>(_selectStatus);
    on<ChangeOnTapedIndexEvent>(_onTapTrackIndex);
  }

  final GetOrdersUseCase getOrdersUseCase;
  final PutOrderUseCase putOrderUseCase;
  final PutOrderStatusesUseCase putOrderStatusesUseCase;
  final PostRatingReviewsUseCase postRatingReviewsUseCase;
  final PutNewOrderStatusesUseCase putNewOrderStatusesUseCase;
  final OrdersRemoteDataSource ordersRemoteDataSource;

  void _tabIndexChanged(
    OrdersTabChangedEvent event,
    Emitter<OrdersState> emit,
  ) {
    emit(state.copyWith(tabIndex: event.tabIndex));
  }

  Future<void> _getNewOrders(
    FetchNewOrdersEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(state.copyWith(newOrdersStatus: ApiStatus.loading));
    print('kirdi');
    print(state.newOrdersStatus);
    final response = await getOrdersUseCase(
      GetOrdersParams(
        ordersType: ['new'],
        limit: state.limit,
        offset: 0,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(newOrdersStatus: ApiStatus.error)),
      (r) => emit(
        state.copyWith(
          newOrders: r.orders,
          newOrdersCount: r.count,
          newOrdersStatus: ApiStatus.success,
          newOrderPageNumber: 5,
        ),
      ),
    );
  }

  Future<void> _getFinishedOrders(
    FetchSignedOrdersEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(state.copyWith(signedOrdersStatus: ApiStatus.loading));
    final response = await getOrdersUseCase(
      GetOrdersParams(
        ordersType: ['performed'],
        limit: state.limit,
        offset: 0,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(signedOrdersStatus: ApiStatus.error)),
      (r) => emit(
        state.copyWith(
          finishedOrders: r.orders,
          finishedOrdersCount: r.count,
          signedOrdersStatus: ApiStatus.success,
          signedOrderPageNumber: 5,
        ),
      ),
    );
  }

  Future<void> _getArchiveOrders(
    FetchArchivedOrdersEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(state.copyWith(archivedOrdersStatus: ApiStatus.loading));
    final response = await getOrdersUseCase(
      GetOrdersParams(
        ordersType: ['archive'],
        limit: state.limit,
        offset: 0,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(archivedOrdersStatus: ApiStatus.error)),
      (r) => emit(
        state.copyWith(
          archivedOrders: r.orders,
          archivedOrdersCount: r.count,
          archivedOrdersStatus: ApiStatus.success,
          archivedOrderPageNumber: 5,
        ),
      ),
    );
  }

  Future<void> _getCancelledOrders(
    FetchCancelledOrdersEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(state.copyWith(cancelledOrdersStatus: ApiStatus.loading));
    final response = await getOrdersUseCase(
      GetOrdersParams(
        ordersType: ['cancellation'],
        limit: state.limit,
        offset: 0,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(cancelledOrdersStatus: ApiStatus.error)),
      (r) => emit(
        state.copyWith(
          cancelledOrders: r.orders,
          cancelledOrdersCount: r.count,
          cancelledOrdersStatus: ApiStatus.success,
          cancelledOrderPageNumber: 5,
        ),
      ),
    );
  }

  /// Pagination functions

  Future<void> _fetchNewOrdersPagination(
    FetchNewOrdersPaginationEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(state.copyWith(newOrdersStatus: ApiStatus.paginationLoading));
    final response = await getOrdersUseCase(
      GetOrdersParams(
        ordersType: ['new'],
        limit: state.limit,
        offset: state.newOrderPageNumber,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(newOrdersStatus: ApiStatus.error)),
      (r) {
        final List<OrderItemEntity> orders = [
          ...state.newOrders,
          ...r.orders,
        ];
        emit(
          state.copyWith(
            newOrders: orders,
            newOrderPageNumber: state.newOrderPageNumber + state.limit,
            newOrdersStatus: ApiStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _fetchSignedOrdersPagination(
    FetchSignedOrdersPaginationEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(state.copyWith(signedOrdersStatus: ApiStatus.paginationLoading));
    final response = await getOrdersUseCase(
      GetOrdersParams(
        ordersType: ['performed'],
        limit: state.limit,
        offset: state.signedOrderPageNumber,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(signedOrdersStatus: ApiStatus.error)),
      (r) {
        final List<OrderItemEntity> orders = [
          ...state.finishedOrders,
          ...r.orders,
        ];
        emit(
          state.copyWith(
            finishedOrders: orders,
            signedOrderPageNumber: state.signedOrderPageNumber + state.limit,
            signedOrdersStatus: ApiStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _fetchArchiveOrdersPagination(
    FetchArchivedOrdersPaginationEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(state.copyWith(archivedOrdersStatus: ApiStatus.paginationLoading));
    final response = await getOrdersUseCase(
      GetOrdersParams(
        ordersType: ['archive'],
        limit: state.limit,
        offset: state.archivedOrderPageNumber,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(archivedOrdersStatus: ApiStatus.error)),
      (r) {
        final List<OrderItemEntity> orders = [
          ...state.archivedOrders,
          ...r.orders,
        ];
        emit(
          state.copyWith(
            archivedOrders: orders,
            archivedOrderPageNumber: state.archivedOrderPageNumber + state.limit,
            archivedOrdersStatus: ApiStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _fetchCancelledOrdersPagination(
    FetchCancelledOrdersPaginationEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(state.copyWith(cancelledOrdersStatus: ApiStatus.paginationLoading));
    final response = await getOrdersUseCase(
      GetOrdersParams(
        ordersType: ['cancellation'],
        limit: state.limit,
        offset: state.cancelledOrderPageNumber,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(cancelledOrdersStatus: ApiStatus.error)),
      (r) {
        final List<OrderItemEntity> orders = [
          ...state.cancelledOrders,
          ...r.orders,
        ];
        emit(
          state.copyWith(
            cancelledOrders: orders,
            cancelledOrderPageNumber: state.cancelledOrderPageNumber + state.limit,
            cancelledOrdersStatus: ApiStatus.success,
          ),
        );
      },
    );
  }

  ///---------------------------------------------------------------------------

  Future<void> _sendAgreedOrder(
    SendDealOrderEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    if (event.provisions.firstOrNull == 'performed') {
      await putNewOrderStatusesUseCase(
        PutNewOrderStatusesParams(
          orderId: event.cargoId,
          acceptedOffers: event.acceptedOffers,
        ),
      );
    }
    final response = await putOrderUseCase(
      PutOrderParams(
        status: event.provisions,
        orderId: event.orderId,
        carType: event.carType,
      ),
    );
    unawaited(ordersRemoteDataSource.acceptUser(provisions: 'empty'));
    await response.fold(
      (l) async {
        emit(state.copyWith(status: ApiStatus.error));
      },
      (r) async {
        add(const FetchSignedOrdersEvent());

        add(const FetchNewOrdersEvent());
        add(const OrdersTabChangedEvent(tabIndex: 1));
        if (!state.status.isError) {
          emit(state.copyWith(status: ApiStatus.success));
        }
      },
    );
  }

  Future<void> _sendFinishedOrder(
    SendFinishedOrderEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final response = await putOrderUseCase(
      PutOrderParams(
        status: ['archive'],
        orderId: event.orderId,
        carType: event.carType,
      ),
    );
    await response.fold(
      (l) async {
        emit(state.copyWith(status: ApiStatus.error));
      },
      (r) async {
        add(const FetchArchivedOrdersEvent());
        add(const FetchSignedOrdersEvent());
        add(const OrdersTabChangedEvent(tabIndex: 2));
        if (!state.status.isError) {
          emit(state.copyWith(status: ApiStatus.success));
        }
      },
    );
  }

  Future<void> _cancelOrder(
    PutCancelOrderEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final response = await putOrderUseCase(
      PutOrderParams(
        status: ['cancellation'],
        whoCancellation: ['driver'],
        orderId: event.orderId,
        carType: event.carType,
      ),
    );
    unawaited(ordersRemoteDataSource.acceptUser(provisions: 'empty'));
    await response.fold(
      (l) async {
        emit(state.copyWith(status: ApiStatus.error));
      },
      (r) async {
        add(const FetchCancelledOrdersEvent());
        add(const FetchNewOrdersEvent());
        add(const OrdersTabChangedEvent(tabIndex: 3));
        if (!state.status.isError) {
          emit(state.copyWith(status: ApiStatus.success));
        }
      },
    );
  }

  /// Show status functions

  Future<void> _putOrderStatus(
    PutOrderStatusEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(state.copyWith(orderStatusAndRatingStatus: ApiStatus.loading));
    final response = await putOrderStatusesUseCase(
      PutOrderStatusesParams(
        orderId: event.orderId,
        statuses: [state.indicateStatus[state.onTapedIndex]?.last ?? ''],
      ),
    );
    response.fold(
      (l) => emit(
        state.copyWith(orderStatusAndRatingStatus: ApiStatus.error),
      ),
      (r) => emit(
        state.copyWith(orderStatusAndRatingStatus: ApiStatus.success),
      ),
    );
  }

  void _giveRating(
    GiveRatingEvent event,
    Emitter<OrdersState> emit,
  ) =>
      emit(state.copyWith(rating: event.rating));

  void _selectRatingCauseItem(
    SelectRatingCauseItemsEvent event,
    Emitter<OrdersState> emit,
  ) {
    final List<String> list = [
      ...state.ratingReviews,
    ];
    switch (event.index) {
      case 0:
        if (event.status) {
          if (!state.ratingReviews.contains('good_customer')) {
            list.add('good_customer');
          }
        } else {
          if (state.ratingReviews.contains('good_customer')) {
            list.remove('good_customer');
          }
        }
        return emit(
          state.copyWith(
            goodClient: {'good_customer': event.status},
            ratingReviews: list,
          ),
        );
      case 1:
        if (event.status) {
          if (!state.ratingReviews.contains('money_on_time')) {
            list.add('money_on_time');
          }
        } else {
          if (state.ratingReviews.contains('money_on_time')) {
            list.remove('money_on_time');
          }
        }
        return emit(
          state.copyWith(
            paymentOnTime: {'money_on_time': event.status},
            ratingReviews: list,
          ),
        );
      case 2:
        if (event.status) {
          if (!state.ratingReviews.contains('client_did_not_pay')) {
            list.add('client_did_not_pay');
          }
        } else {
          if (state.ratingReviews.contains('client_did_not_pay')) {
            list.remove('client_did_not_pay');
          }
        }
        return emit(
          state.copyWith(
            clientDidNotPay: {'client_did_not_pay': event.status},
            ratingReviews: list,
          ),
        );
    }
  }

  Future<void> _postRatingReviews(
    PostRatingReviewsEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(state.copyWith(orderStatusAndRatingStatus: ApiStatus.loading));
    final response = await postRatingReviewsUseCase(
      PostRatingReviewsParams(
        requestEntity: RatingReviewsRequestEntity(
          companyId: event.companyId,
          grade: state.rating,
          rewiv: event.comment,
          usersId: localSource.userId,
          reviewStatus: state.ratingReviews,
          usersId2: event.usersId3,
          status: const ['client'],
        ),
      ),
    );

    response.fold(
      (l) => emit(
        state.copyWith(orderStatusAndRatingStatus: ApiStatus.error),
      ),
      (r) => emit(
        state.copyWith(orderStatusAndRatingStatus: ApiStatus.success),
      ),
    );
  }

  void _selectAccident(
    SelectAccidentEvent event,
    Emitter<OrdersState> emit,
  ) =>
      emit(
        state.copyWith(
          isAccidentSelected: {event.index: event.status},
          indicateStatus: {
            state.onTapedIndex: ['road_accident'],
          },
          isBreakdownSelected: {event.index: false},
          selectedStatusIndex: {event.index: -1},
        ),
      );

  void _selectBreakdown(
    SelectBreakdownEvent event,
    Emitter<OrdersState> emit,
  ) =>
      emit(
        state.copyWith(
          isBreakdownSelected: {event.index: event.status},
          indicateStatus: {
            state.onTapedIndex: ['breaking'],
          },
          isAccidentSelected: {event.index: false},
          selectedStatusIndex: {event.index: -1},
        ),
      );

  void _selectStatus(
    SelectStatusEvent event,
    Emitter<OrdersState> emit,
  ) {
    final List<String> statuses = [
      'no_status',
      'go_to_load',
      'wait_for_the_download',
      'loading',
      'go_to_unload',
      'unloading',
      'unloaded',
      'complete_the_order',
    ];
    final List<String> list = [];
    for (int i = 0; i < event.index + 1; i++) {
      list.add(statuses[i]);
    }
    emit(
      state.copyWith(
        selectedStatusIndex: {event.itemIndex: event.index},
        indicateStatus: {state.onTapedIndex: list},
        isAccidentSelected: {event.itemIndex: false},
        isBreakdownSelected: {event.itemIndex: false},
      ),
    );
  }

  void _onTapTrackIndex(
    ChangeOnTapedIndexEvent event,
    Emitter<OrdersState> emit,
  ) {
    final List<String> statuses = [
      'no_status',
      'go_to_load',
      'wait_for_the_download',
      'loading',
      'go_to_unload',
      'unloading',
      'unloaded',
    ];
    final int indexStatus = statuses.indexOf(state.finishedOrders[event.index].indicateStatus ?? '');
    final bool isAccidentSelected = state.finishedOrders[event.index].indicateStatus == 'road_accident';
    final bool isBreakdownSelected = state.finishedOrders[event.index].indicateStatus == 'breaking';
    emit(
      state.copyWith(
        onTapedIndex: event.index,
        selectedStatusIndex: {event.index: indexStatus},
        isAccidentSelected: {event.index: isAccidentSelected},
        isBreakdownSelected: {event.index: isBreakdownSelected},
      ),
    );
  }
}
