import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../router/app_routes.dart';
import '../../../../../services/api_status.dart';
import '../../../domain/entities/address_positions/fetch_address_positions_entity.dart';
import '../../../domain/entities/get_addresses_response_entity.dart';
import '../../../domain/entities/get_order_details_response_entity.dart';
import '../../../domain/entities/post_rating_review_request_entity.dart';
import '../../../domain/usecases/fetch_address_positions_usecase.dart';
import '../../../domain/usecases/get_addresses_data_uscase.dart';
import '../../../domain/usecases/get_order_details_usecase.dart';
import '../../../domain/usecases/post_rating_reviews_usecase.dart';
import '../../../domain/usecases/put_order_statuses_usecase.dart';

part 'order_details_event.dart';

part 'order_details_state.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  OrderDetailsBloc({
    required this.getOrderDetailsUseCase,
    required this.putOrderStatusesUseCase,
    required this.postRatingReviewsUseCase,
    required this.getAddressesUseCase,
    required this.fetchAddressesPositionsUseCase,
  }) : super(const OrderDetailsState()) {
    on<GetOrderDetailsEvent>(_getOrderDetails);
    on<PutOrderStatusEvent>(_putOrderStatus);
    on<GiveRatingEvent>(_giveRating);
    on<SelectRatingCauseItemsEvent>(_selectRatingCauseItem);
    on<PostRatingReviewsEvent>(_postRatingReviews);
    on<SelectAccidentEvent>(_selectAccident);
    on<SelectBreakdownEvent>(_selectBreakdown);
    on<SelectStatusEvent>(_selectStatus);
    // on<GetDetailAddressesEvent>(_getAddressesData);
    on<GetAddressesPositionsEvent>(_getAddressesPositions);
    on<ChangeComplaintEvent>(_changeComplaintEvent);
  }

  final GetOrderDetailsUseCase getOrderDetailsUseCase;
  final PutOrderStatusesUseCase putOrderStatusesUseCase;
  final PostRatingReviewsUseCase postRatingReviewsUseCase;
  final GetAddressesDetailUseCase getAddressesUseCase;
  final FetchAddressesPositionsUseCase fetchAddressesPositionsUseCase;

  Future<void> _getOrderDetails(
    GetOrderDetailsEvent event,
    Emitter<OrderDetailsState> emit,
  ) async {
    emit(state.copyWith(orderDetailStatus: ApiStatus.loading));
    final response = await getOrderDetailsUseCase(
      GetOrderDetailsParams(
        guid: event.guid,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(orderDetailStatus: ApiStatus.error)),
      (r) {
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
        final int indexStatus = statuses.indexOf(r?.indicationStatus ?? '');
        final bool isAccidentSelected = r?.indicationStatus == 'road_accident';
        final bool isBreakdownSelected = r?.indicationStatus == 'breaking';
        emit(
          state.copyWith(
            details: r,
            selectedStatusIndex: indexStatus,
            isAccidentSelected: isAccidentSelected,
            isBreakdownSelected: isBreakdownSelected,
            orderDetailStatus: ApiStatus.success,
          ),
        );
        add(GetAddressesPositionsEvent(guid: event.cargoId));
      },
    );
  }

  // Future<void> _getAddressesData(
  //   GetDetailAddressesEvent event,
  //   Emitter<OrderDetailsState> emit,
  // ) async {
  //   if (state.details?.addressIds?.isNotEmpty ?? false) {
  //     emit(state.copyWith(addressStatus: ApiStatus.loading));
  //     final response = await getAddressesUseCase(
  //       GetAddressesDetailParams(
  //         guids: state.details?.addressIds ?? [],
  //       ),
  //     );
  //     response.fold(
  //       (l) => emit(state.copyWith(addressStatus: ApiStatus.error)),
  //       (r) {
  //         emit(
  //           state.copyWith(
  //             addressesDetail: r.addresses,
  //             addressStatus: ApiStatus.success,
  //           ),
  //         );
  //         add(GetAddressesPositionsEvent(guid: event.guid));
  //       },
  //     );
  //   } else {
  //     add(GetAddressesPositionsEvent(guid: event.guid));
  //   }
  // }

  Future<void> _getAddressesPositions(
    GetAddressesPositionsEvent event,
    Emitter<OrderDetailsState> emit,
  ) async {
    emit(state.copyWith(addressStatus: ApiStatus.loading));
    final response = await fetchAddressesPositionsUseCase(
      FetchAddressesPositionsParams(
        guid: event.guid,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(addressStatus: ApiStatus.error)),
      (r) {
        emit(
          state.copyWith(
            addressPositions: r.addresses,
            addressStatus: ApiStatus.success,
          ),
        );
        _madeAddressesDetail(emit);
      },
    );
  }

  void _madeAddressesDetail(
    Emitter<OrderDetailsState> emit,
  ) {
    final List<FetchAddressesPositionsEntity> reversedAddressesPositions = state.addressPositions.reversed.toList();
    // state.addressPositions;

    final List<FetchAddressesPositionsEntity> removeFirstAndLast = reversedAddressesPositions.length < 2
        ? []
        : reversedAddressesPositions.sublist(
            1,
            reversedAddressesPositions.length - 1,
          );

    final List<OrderAddressesPoint> addresses = [
      OrderAddressesPoint(
        // addressType: reversedAddressesPositions.last.addressType,
        addressName: reversedAddressesPositions.first.addressType,
        cargoStatus: 'loading_status',
        lat: reversedAddressesPositions.first.lat,
        long: reversedAddressesPositions.first.long,
      ),
      ...List.generate(
        removeFirstAndLast.length,
        (index) => OrderAddressesPoint(
          // addressType: removeFirstAndLast[index].addressType,
          addressName: removeFirstAndLast[index].addressType,
          cargoStatus: 'unloading_status',
          lat: removeFirstAndLast[index].lat,
          long: removeFirstAndLast[index].long,
        ),
      ),
      OrderAddressesPoint(
        // addressType: reversedAddressesPositions.first.addressType,
        addressName: reversedAddressesPositions.last.addressType,
        cargoStatus: 'unloading_status',
        lat: reversedAddressesPositions.last.lat,
        long: reversedAddressesPositions.last.long,
      ),
    ];
    emit(state.copyWith(addresses: addresses));
  }

  Future<void> _putOrderStatus(
    PutOrderStatusEvent event,
    Emitter<OrderDetailsState> emit,
  ) async {
    emit(state.copyWith(orderDetailStatus: ApiStatus.loading));
    final response = await putOrderStatusesUseCase(
      PutOrderStatusesParams(
        orderId: event.orderId,
        statuses: [state.indicateStatus.last],
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(orderDetailStatus: ApiStatus.error)),
      (r) => emit(state.copyWith(orderDetailStatus: ApiStatus.success)),
    );
  }

  void _giveRating(
    GiveRatingEvent event,
    Emitter<OrderDetailsState> emit,
  ) {
    if ((state.rating < 4) != (event.rating < 4)) {
      emit(state.copyWith(ratingReviews: [], complaintString: ''));
    }

    emit(state.copyWith(rating: event.rating));
  }

  void _selectRatingCauseItem(
    SelectRatingCauseItemsEvent event,
    Emitter<OrderDetailsState> emit,
  ) {
    final updatedList = List<String>.from(state.ratingReviews);

    updatedList.contains(event.key) ? updatedList.remove(event.key) : updatedList.add(event.key);

    emit(state.copyWith(ratingReviews: updatedList));
  }

  Future<void> _postRatingReviews(
    PostRatingReviewsEvent event,
    Emitter<OrderDetailsState> emit,
  ) async {
    emit(state.copyWith(orderDetailStatus: ApiStatus.loading));
    print('mana comment: ${state.complaintString}');
    final response = await postRatingReviewsUseCase(
      PostRatingReviewsParams(
        requestEntity: RatingReviewsRequestEntity(
          companyId: state.details?.companyId ?? '',
          grade: state.rating,
          rewiv: state.complaintString,
          usersId: localSource.userId,
          reviewStatus: state.ratingReviews,
          usersId2: state.details?.usersId2,
          status: const ['client'],
        ),
      ),
    );


    response.fold(
      (l) => emit(state.copyWith(orderDetailStatus: ApiStatus.error)),
      (r) => emit(state.copyWith(orderDetailStatus: ApiStatus.success)),
    );
  }

  void _selectAccident(
    SelectAccidentEvent event,
    Emitter<OrderDetailsState> emit,
  ) =>
      emit(
        state.copyWith(
          isAccidentSelected: event.status,
          indicateStatus: ['road_accident'],
          isBreakdownSelected: false,
          selectedStatusIndex: -1,
        ),
      );

  void _selectBreakdown(
    SelectBreakdownEvent event,
    Emitter<OrderDetailsState> emit,
  ) =>
      emit(
        state.copyWith(
          isBreakdownSelected: event.status,
          indicateStatus: ['breaking'],
          isAccidentSelected: false,
          selectedStatusIndex: -1,
        ),
      );

  void _changeComplaintEvent(
    ChangeComplaintEvent event,
    Emitter<OrderDetailsState> emit,
  ) =>
      emit(state.copyWith(complaintString: event.complaintComment));

  void _selectStatus(
    SelectStatusEvent event,
    Emitter<OrderDetailsState> emit,
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
        selectedStatusIndex: event.index,
        indicateStatus: list,
        isAccidentSelected: false,
        isBreakdownSelected: false,
      ),
    );
  }
}
