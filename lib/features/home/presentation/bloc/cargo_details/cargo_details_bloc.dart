import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../router/app_routes.dart';
import '../../../../../services/api_status.dart';
import '../../../../orders/domain/usecases/get_orders_usecase.dart';
import '../../../data/models/favourites/put_favourite_request_home.dart';
import '../../../domain/entities/cargo_details/address_position_cargo_entity.dart';
import '../../../domain/entities/cargo_details/get_cargo_details_response_entity.dart';
import '../../../domain/usecases/address_position_cargo_usecase.dart';
import '../../../domain/usecases/get_addresses_point_usecase.dart';
import '../../../domain/usecases/get_cargo_details_usecase.dart';
import '../../../domain/usecases/put_favourite_cargo_home_usecase.dart';

part 'cargo_details_event.dart';

part 'cargo_details_state.dart';

class CargoDetailsBloc extends Bloc<CargoDetailsEvent, CargoDetailsState> {
  CargoDetailsBloc({
    required this.getCargoDetailsUseCase,
    required this.getAddressesUseCase,
    required this.fetchAddressesPositionsByCargoUseCase,
    required this.putFavouriteCargoUseCase,
    required this.getOrdersUseCase,
  }) : super(const CargoDetailsState()) {
    on<GetCargoDetailsEvent>(_getCargoDetails);
    on<DeleteLikeCargoEvent>(_deleteLikeCargo);
    on<PushLikeCargoEvent>(_pushLikeCargo);
    on<GetCargoAddressesPointEvent>(_getAddressesPositions);
    on<GetDriverOrdersEvent>(_getDriverOrdersEvent);
  }

  final GetCargoDetailsUseCase getCargoDetailsUseCase;
  final GetOrdersUseCase getOrdersUseCase;
  final PutFavouriteCargoHomeUseCase putFavouriteCargoUseCase;
  final GetCargoAddressesPointUseCase getAddressesUseCase;
  final FetchAddressesPositionsByCargoUseCase fetchAddressesPositionsByCargoUseCase;

  Future<void> _getDriverOrdersEvent(
    GetDriverOrdersEvent event,
    Emitter<CargoDetailsState> emit,
  ) async {
    emit(state.copyWith(signedOrdersStatus: ApiStatus.loading));
    final response = await getOrdersUseCase(
      const GetOrdersParams(
        ordersType: ['performed'],
        limit: 5,
        offset: 0,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(signedOrdersStatus: ApiStatus.error)),
      (r) => emit(
        state.copyWith(
          finishedOrdersCount: r.count,
          signedOrdersStatus: ApiStatus.success,
        ),
      ),
    );
  }

  Future<void> _getCargoDetails(
    GetCargoDetailsEvent event,
    Emitter<CargoDetailsState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final response = await getCargoDetailsUseCase(
      GetCargoDetailsParams(
        guid: event.guid,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(status: ApiStatus.error)),
      (r) {
        emit(
          state.copyWith(
            details: r,
            status: ApiStatus.success,
          ),
        );
        add(GetCargoAddressesPointEvent(guid: event.guid));
      },
    );
  }

  Future<void> _getAddressesPositions(
    GetCargoAddressesPointEvent event,
    Emitter<CargoDetailsState> emit,
  ) async {
    emit(state.copyWith(cargoPointStatus: ApiStatus.loading));
    final response = await fetchAddressesPositionsByCargoUseCase(
      FetchAddressesPositionsParams(
        guid: event.guid,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(cargoPointStatus: ApiStatus.error)),
      (r) {
        final List<FetchListPositionsEntity> addresses = [];
        for (final item in r.addresses) {
          if (item.type == 'shipper') {
            addresses.insert(0, item); // Add the item at the beginning of the list
          } else {
            addresses.add(item); // Add the item normally
          }
        }
        emit(
          state.copyWith(
            addressPositions: addresses,
            cargoPointStatus: ApiStatus.success,
          ),
        );
        _madeAddressesDetail(emit);
      },
    );
  }

  void _madeAddressesDetail(
    Emitter<CargoDetailsState> emit,
  ) {
    final List<FetchListPositionsEntity> reversedAddressesPositions = state.addressPositions.reversed.toList();

    final List<FetchListPositionsEntity> removeFirstAndLast = reversedAddressesPositions.length > 2
        ? reversedAddressesPositions.sublist(1, reversedAddressesPositions.length - 1)
        : [];

    final List<CargoAddressesPoint> addresses = [
      CargoAddressesPoint(
        // addressType: reversedAddressesPositions.last.addressType,
        addressName: reversedAddressesPositions.firstOrNull?.addressType ?? '',
        cargoStatus: 'loading_status',
      ),
      ...List.generate(
        removeFirstAndLast.length,
        (index) => CargoAddressesPoint(
          // addressType: removeFirstAndLast[index].addressType,
          addressName: removeFirstAndLast[index].addressType,
          cargoStatus: 'unloading_status',
        ),
      ),
      CargoAddressesPoint(
        // addressType: reversedAddressesPositions.first.addressType,
        addressName: reversedAddressesPositions.lastOrNull?.addressType ?? '',
        cargoStatus: 'unloading_status',
      ),
    ];
    emit(state.copyWith(addresses: addresses));
  }

  Future<void> _deleteLikeCargo(
    DeleteLikeCargoEvent event,
    Emitter<CargoDetailsState> emit,
  ) async {
    final List<String> favouriteCargoesGuids = [
      ...localSource.favouriteCargoes,
    ];

    final Set<String> setFavourite = favouriteCargoesGuids.toSet();
    setFavourite.remove(event.cargoId);
    await localSource.setFavouriteCargoes(setFavourite.toList());
    final result = state.details!;
    result.isLiked = false;
    emit(state.copyWith(details: result));
    await putFavouriteCargoUseCase(
      PutFavouriteRequestHome(
        data: Data(
          guid: localSource.userId,
          cargoIds: setFavourite.toList(),
        ),
      ),
    );
  }

  Future<void> _pushLikeCargo(
    PushLikeCargoEvent event,
    Emitter<CargoDetailsState> emit,
  ) async {
    final List<String> favouriteCargoesGuids = [
      ...localSource.favouriteCargoes,
    ];

    final Set<String> setFavourite = favouriteCargoesGuids.toSet();
    setFavourite.add(event.cargoId);

    await localSource.setFavouriteCargoes(setFavourite.toList());
    final result = state.details!;
    result.isLiked = true;
    emit(state.copyWith(details: result));
    await putFavouriteCargoUseCase(
      PutFavouriteRequestHome(
        data: Data(
          guid: localSource.userId,
          cargoIds: setFavourite.toList(),
        ),
      ),
    );
  }
}
