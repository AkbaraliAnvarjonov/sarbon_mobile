import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../services/api_status.dart';
import '../../../../domain/entities/notification/get_order_by_notification_entity/fetch_address_positions_notification_entity.dart';
import '../../../../domain/entities/notification/get_order_by_notification_entity/get_addresses_notification_entity.dart';
import '../../../../domain/entities/notification/get_order_by_notification_entity/get_order_by_notification_entity.dart';
import '../../../../domain/usecases/fetch_address_positions_notification_usecase.dart';
import '../../../../domain/usecases/get_addresses_by_notification_uscase.dart';
import '../../../../domain/usecases/get_order_details_notification_usecase.dart';
import '../../../../domain/usecases/put_order_by_notification_usecase.dart';

part 'order_for_notification_event.dart';

part 'order_for_notification_state.dart';

class OrderForNotificationBloc
    extends Bloc<OrderForNotificationEvent, OrderForNotificationState> {
  OrderForNotificationBloc({
    required this.getOrderByNotificationUseCase,
    required this.getAddressesUseCase,
    required this.fetchAddressesPositionsUseCase,
    required this.putOrderUseCase,
  }) : super(const OrderForNotificationState()) {
    on<GetOrderDetailsByNotificationEvent>(_getOrderDetails);
    // on<GetDetailAddressesByNotificationEvent>(_getAddressesData);
    on<GetAddressesPositionsEvent>(_getAddressesPositions);
    on<SendDealOrderEvent>(_sendAgreedOrder);
    on<CancelOrderEvent>(_cancelOrder);
  }

  final GetOrderByNotificationUseCase getOrderByNotificationUseCase;
  final GetAddressesByNotificationUseCase getAddressesUseCase;
  final FetchAddressesPositionsByNotificationUseCase
      fetchAddressesPositionsUseCase;
  final PutOrderByNotificationUseCase putOrderUseCase;

  Future<void> _getOrderDetails(
    GetOrderDetailsByNotificationEvent event,
    Emitter<OrderForNotificationState> emit,
  ) async {
    emit(state.copyWith(getOrderDetailsStatus: ApiStatus.loading));
    final response = await getOrderByNotificationUseCase(
      GetOrderDetailsParams(
        guid: event.guid,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(getOrderDetailsStatus: ApiStatus.error)),
      (r) {
        emit(
          state.copyWith(
            getOrderDetails: r,
            getOrderDetailsStatus: ApiStatus.success,
          ),
        );
        add(GetAddressesPositionsEvent(guid: event.guid));
      },
    );
  }

  // Future<void> _getAddressesData(
  //   GetDetailAddressesByNotificationEvent event,
  //   Emitter<OrderForNotificationState> emit,
  // ) async {
  //   emit(state.copyWith(addressStatus: ApiStatus.loading));
  //   final response = await getAddressesUseCase(
  //     GetAddressesDetailParams(
  //       guid: event.guid,
  //     ),
  //   );
  //   response.fold(
  //     (l) => emit(state.copyWith(addressStatus: ApiStatus.error)),
  //     (r) {
  //       emit(
  //         state.copyWith(
  //           addressesDetail: r.addresses,
  //           addressStatus: ApiStatus.success,
  //         ),
  //       );
  //       add(GetAddressesPositionsEvent(guid: event.guid));
  //     },
  //   );
  // }

  Future<void> _getAddressesPositions(
    GetAddressesPositionsEvent event,
    Emitter<OrderForNotificationState> emit,
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
            addresses: r.addresses,
            addressStatus: ApiStatus.success,
          ),
        );
        _madeAddressesDetail(emit);
      },
    );
  }

  void _madeAddressesDetail(
    Emitter<OrderForNotificationState> emit,
  ) {
    final List<FetchListPositionsEntity> reversedAddressesPositions =
        state.addresses.reversed.toList();
        // state.addresses;

    final List<FetchListPositionsEntity> removeFirstAndLast =
        reversedAddressesPositions.sublist(
      1,
      reversedAddressesPositions.length - 1,
    );

    final List<OrderAddressesByNotificationPoint> addresses = [
      OrderAddressesByNotificationPoint(
        // addressType: reversedAddressesPositions.last.addressType,
        addressName: reversedAddressesPositions.first.addressType,
        cargoStatus: 'loading_status',
        lat: reversedAddressesPositions.first.lat,
        long: reversedAddressesPositions.first.long,
      ),
      ...List.generate(
        removeFirstAndLast.length,
        (index) => OrderAddressesByNotificationPoint(
          // addressType: removeFirstAndLast[index].addressType,
          addressName: removeFirstAndLast[index].addressType,
          cargoStatus: 'unloading_status',
          lat: removeFirstAndLast[index].lat,
          long: removeFirstAndLast[index].long,
        ),
      ),
      OrderAddressesByNotificationPoint(
        // addressType: reversedAddressesPositions.first.addressType,
        addressName: reversedAddressesPositions.last.addressType,
        cargoStatus: 'unloading_status',
        lat: reversedAddressesPositions.last.lat,
        long: reversedAddressesPositions.last.long,
      ),
    ];
    emit(state.copyWith(finallyAddresses: addresses));
  }

  Future<void> _sendAgreedOrder(
    SendDealOrderEvent event,
    Emitter<OrderForNotificationState> emit,
  ) async {
    emit(state.copyWith(putOrderStatus: ApiStatus.loading));
    final response = await putOrderUseCase(
      PutOrderParams(
        status: ['performed'],
        orderId: event.orderId,
      ),
    );
    await response.fold(
      (l) async {
        emit(state.copyWith(putOrderStatus: ApiStatus.error));
      },
      (r) async {
        emit(state.copyWith(putOrderStatus: ApiStatus.success));
      },
    );
  }

  Future<void> _cancelOrder(
    CancelOrderEvent event,
    Emitter<OrderForNotificationState> emit,
  ) async {
    emit(state.copyWith(putOrderStatus: ApiStatus.loading));
    final response = await putOrderUseCase(
      PutOrderParams(
        status: ['cancellation'],
        orderId: event.orderId,
      ),
    );
    await response.fold(
      (l) async {
        emit(state.copyWith(putOrderStatus: ApiStatus.error));
      },
      (r) async {
        emit(state.copyWith(putOrderStatus: ApiStatus.success));
      },
    );
  }
}
