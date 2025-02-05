import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../router/app_routes.dart';
import '../../../../services/api_status.dart';
import '../../../profile/domain/usecases/get_user_cars_usecase.dart';
import '../../data/models/apply_filter/apply_filter_request.dart';
import '../../data/models/favourites/put_favourite_request_home.dart';
import '../../domain/entities/news/get_news_response_entity.dart';
import '../../domain/entities/search/get_addresses_response_entity.dart';
import '../../domain/entities/search/get_searched_cargo_items_request_entity.dart';
import '../../domain/entities/search/get_searched_cargo_items_response_entity.dart';
import '../../domain/entities/types_cargo/types_cargo_entity.dart';
import '../../domain/entities/types_payment/types_payment_entity.dart';
import '../../domain/usecases/filter/apply_filter_usecase.dart';
import '../../domain/usecases/filter/fetch_type_cargo_usecase.dart';
import '../../domain/usecases/filter/fetch_type_payment_usecase.dart';
import '../../domain/usecases/get_addresses_usecase.dart';
import '../../domain/usecases/get_all_cargos_use_case.dart';
import '../../domain/usecases/get_all_cargos_without_filter_usecase.dart';
import '../../domain/usecases/get_all_news_usecase.dart';
import '../../domain/usecases/put_favourite_cargo_home_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.getAllNewsUseCase,
    required this.getAddressesUseCase,
    required this.getAllCargosUseCase,
    required this.putFavouriteCargoUseCase,
    required this.fetchTypeCargoUseCase,
    required this.fetchTypePaymentUseCase,
    required this.fetchCargoFromFilterUseCase,
    required this.getAllCargosWithoutFilterUseCase,
    required this.getUserCarsUseCase,
  }) : super(const HomeState()) {
    on<InitialEvent>(_initial);
    on<SelectInitialAddressesEvent>(_selectInitialAddress);
    on<SelectFinalAddressesEvent>(_selectFinalAddress);
    on<SelectDateEvent>(_selectDate);
    // on<GetActiveCarsEvent>(_getMyCars);
    on<DeleteLikeCargoEvent>(_deleteLikeCargo);
    on<PushLikeCargoEvent>(_pushLikeCargo);
    on<SearchButtonPressedEvent>(_searchButtonPressed);
    on<FetchCargosPaginationEvent>(_fetchCargosPagination);
    on<FetchCargosWithoutFilterPaginationEvent>(_fetchCargosWithoutFilterPaginationEvent);
    on<GetAllCargosEvent>(_getAllCargos);
    on<GetAllCargosWithoutFilterEvent>(_getAllCargosWithoutFilter);

    on<RemoveFilterEvent>(_removeFilter);
    on<HomeRefresh>(_homeRefresh);

    ///filter
    on<ChangeTypeOfCargoEvent>(_changeTakeAllUnloads);
    on<FetchCargoTypesEvent>(_fetchTypeCargo);
    on<FetchPaymentTypesEvent>(_fetchTypePayment);
    on<SelectedCargoTypeEvent>(_selectTypeCargo);
    on<SelectedPaymentTypeEvent>(_selectTypePayment);
    on<ApplyFilterEvent>(_fetchCargoFromFilterResults);
    on<ChangeVolumeEvent>(_changeVolume);
    on<ChangeWeightEvent>(_changeWeight);
    on<HomeEventClearFromAddress>(_homeClearFromAddress);
    on<HomeEventClearToAddress>(_homeClearToAddress);
    on<GetVehicleType>(_getActiveCars);
  }

  final GetAllNewsUseCase getAllNewsUseCase;
  final GetAddressesUseCase getAddressesUseCase;
  final GetAllCargosUseCase getAllCargosUseCase;
  final PutFavouriteCargoHomeUseCase putFavouriteCargoUseCase;
  final FetchTypeCargoUseCase fetchTypeCargoUseCase;
  final FetchTypePaymentUseCase fetchTypePaymentUseCase;
  final FetchCargoFromFilterUseCase fetchCargoFromFilterUseCase;
  final GetAllCargosWithoutFilterUseCase getAllCargosWithoutFilterUseCase;
  final GetUserCarsUseCase getUserCarsUseCase;

  Future<void> _initial(
    InitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    await Future.wait([
      _getAddresses(emit),
    ]);

    if (!state.status.isError) {
      emit(state.copyWith(status: ApiStatus.success));
    }
  }

  Future<void> _fetchCargosPagination(
    FetchCargosPaginationEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.paginationLoading));
    final response = await getAllCargosUseCase(
      GetAllCargoItemsParams(
        limit: state.limit,
        offset: state.cargosPageNumber,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(status: ApiStatus.error)),
      (r) {
        final List<SearchedCargoItemEntity> cargos = [
          ...state.cargoItems,
          ...r.searchedCargos,
        ];
        emit(
          state.copyWith(
            cargoItems: cargos,
            cargosPageNumber: state.cargosPageNumber + state.limit,
            status: ApiStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _fetchCargosWithoutFilterPaginationEvent(
    FetchCargosWithoutFilterPaginationEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.paginationLoading));
    final response = await getAllCargosWithoutFilterUseCase(
      GetAllCargoItemsParams(
        limit: state.limit,
        offset: state.cargosWithoutFilterPageNumber,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(status: ApiStatus.error)),
      (r) {
        final List<SearchedCargoItemEntity> cargos = [
          ...state.cargoItemsWithoutFilter,
          ...r.searchedCargos,
        ];
        emit(
          state.copyWith(
            cargosWithoutFilterCount: r.count,
            cargoItemsWithoutFilter: cargos,
            cargosWithoutFilterPageNumber: state.cargosWithoutFilterPageNumber + state.limit,
            status: ApiStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _getAddresses(
    Emitter<HomeState> emit,
  ) async {
    final response = await getAddressesUseCase(
      const GetAddressesParams(
        limit: 300,
        offset: 0,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(status: ApiStatus.error)),
      (r) {
        emit(
          state.copyWith(
            addresses: r.addresses,
            addressesCount: r.count,
          ),
        );
      },
    );
  }

  void _selectInitialAddress(
    SelectInitialAddressesEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(fromAddress: event.address));
  }

  void _selectFinalAddress(
    SelectFinalAddressesEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(toAddress: event.address));
  }

  void _selectDate(
    SelectDateEvent event,
    Emitter<HomeState> emit,
  ) =>
      emit(state.copyWith(dateTime: event.date));

  void _searchButtonPressed(
    SearchButtonPressedEvent event,
    Emitter<HomeState> emit,
  ) {
    DateTime newDateTime = state.dateTime?.subtract(const Duration(days: 1)) ?? DateTime.now();
    newDateTime = DateTime(
      newDateTime.year,
      newDateTime.month,
      newDateTime.day + 1,
      23,
      59,
      59,
      263,
    );
    // final String newDateTimeString = newDateTime.toUtc().toIso8601String();
    final GetSearchedCargoItemsRequestEntity searchRequestEntityModel = GetSearchedCargoItemsRequestEntity(
      addressId: [state.fromAddress],
      addressId2: [state.toAddress],
      loadTime: state.dateTime?.day != DateTime.now().subtract(const Duration(days: 3)).day
          ? LoadTimeEntity(
              gte: state.dateTime?.subtract(const Duration(days: 1)).formatDateTime,
              lt: newDateTime.formatDateTime,
            )
          : null,
      orderStatus: const ['active'],
    );
    emit(
      state.copyWith(
        searchedCargoItemsRequestEntity: searchRequestEntityModel,
        fromAddress: '',
        toAddress: '',
      ),
    );
  }

  Future<void> _getAllCargosWithoutFilter(
    GetAllCargosWithoutFilterEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final response = await getAllCargosWithoutFilterUseCase(
      GetAllCargoItemsParams(
        limit: state.limit,
        offset: 0,
      ),
    );
    response.fold(
      (failure) => emit(
        state.copyWith(status: ApiStatus.error),
      ),
      (cargoItems) {
        final List<SearchedCargoItemEntity> newFavouriteCargoes = [];
        for (final item in cargoItems.searchedCargos) {
          if (item.isLiked ?? false) {
            newFavouriteCargoes.add(item);
          }
        }
        emit(
          state.copyWith(
            status: ApiStatus.success,
            cargoItems: cargoItems.searchedCargos,
            cargosWithoutFilterCount: cargoItems.count,
            cargoIsLikedList: newFavouriteCargoes,
            cargosWithoutFilterPageNumber: state.cargosWithoutFilterPageNumber + state.limit,
          ),
        );
      },
    );
  }

  Future<void> _getAllCargos(
    GetAllCargosEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final response = await getAllCargosUseCase(
      GetAllCargoItemsParams(
        limit: state.limit,
        offset: 0,
      ),
    );
    response.fold(
      (failure) => emit(
        state.copyWith(status: ApiStatus.error),
      ),
      (cargoItems) {
        final List<SearchedCargoItemEntity> newFavouriteCargoes = [];
        for (final item in cargoItems.searchedCargos) {
          if (item.isLiked ?? false) {
            newFavouriteCargoes.add(item);
          }
        }
        if (cargoItems.count == 0 || (cargoItems.count == 1 && localSource.vehicleId.isNotEmpty)) {
          add(const FetchCargosWithoutFilterPaginationEvent());
        }
        emit(
          state.copyWith(
            status: ApiStatus.success,
            cargoItems: cargoItems.searchedCargos,
            cargosCount: cargoItems.count,
            cargoIsLikedList: newFavouriteCargoes,
            cargosPageNumber: state.cargosPageNumber + state.limit,
          ),
        );
      },
    );
  }

  Future<void> _deleteLikeCargo(
    DeleteLikeCargoEvent event,
    Emitter<HomeState> emit,
  ) async {
    final List<SearchedCargoItemEntity> newFavouriteCargoes = [
      ...state.cargoIsLikedList,
    ];
    final List<String> favouriteCargoesGuids = [
      ...newFavouriteCargoes.map((e) => e.guid ?? ''),
      ...localSource.favouriteCargoes,
    ];

    final Set<String> setFavourite = favouriteCargoesGuids.toSet();
    setFavourite.remove(event.cargo.guid);
    await localSource.setFavouriteCargoes(setFavourite.toList());

    emit(state.copyWith(putFavouriteStatus: ApiStatus.loading));
    final response = await putFavouriteCargoUseCase(
      PutFavouriteRequestHome(
        data: Data(
          guid: localSource.userId,
          cargoIds: setFavourite.toList(),
        ),
      ),
    );
    response.fold(
      (failure) {
        emit(state.copyWith(putFavouriteStatus: ApiStatus.error));
      },
      (favouriteCargoes) {
        emit(
          state.copyWith(
            putFavouriteStatus: ApiStatus.success,
            cargoIsLikedList: newFavouriteCargoes,
          ),
        );
      },
    );
  }

  Future<void> _pushLikeCargo(
    PushLikeCargoEvent event,
    Emitter<HomeState> emit,
  ) async {
    final List<SearchedCargoItemEntity> newFavouriteCargoes = [
      ...state.cargoIsLikedList,
    ];
    newFavouriteCargoes.add(event.cargo);
    final Set<String> setFavourite = {
      ...newFavouriteCargoes.map((e) => e.guid ?? ''),
      ...localSource.favouriteCargoes,
    };
    await localSource.setFavouriteCargoes(setFavourite.toList());
    emit(state.copyWith(putFavouriteStatus: ApiStatus.loading));
    final response = await putFavouriteCargoUseCase(
      PutFavouriteRequestHome(
        data: Data(
          guid: localSource.userId,
          cargoIds: setFavourite.toList(),
        ),
      ),
    );
    response.fold(
      (failure) {
        emit(state.copyWith(putFavouriteStatus: ApiStatus.error));
      },
      (favouriteCargoes) {
        emit(
          state.copyWith(
            putFavouriteStatus: ApiStatus.success,
            cargoIsLikedList: newFavouriteCargoes,
          ),
        );
      },
    );
  }

  /// Filter events

  Future<void> _fetchCargoFromFilterResults(
    ApplyFilterEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final response = await fetchCargoFromFilterUseCase(
      FetchCargoFromFilterParams(
        request: event.request,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(status: ApiStatus.error)),
      (r) {
        final List<SearchedCargoItemEntity> newFavouriteCargoes = [];
        for (final item in r.searchedCargos) {
          if (item.isLiked ?? false) {
            newFavouriteCargoes.add(item);
          }
        }
        emit(
          state.copyWith(
            cargoItems: r.searchedCargos,
            cargoIsLikedList: newFavouriteCargoes,
            cargosCount: r.count,
            limit: 0,
            status: ApiStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _fetchTypeCargo(
    FetchCargoTypesEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (state.typesCargo.isNotEmpty && state.typesPayment.isNotEmpty) return;
    emit(state.copyWith(fetchCargoAndPaymentStatus: ApiStatus.loading));
    final response = await fetchTypeCargoUseCase(NoParams());
    response.fold(
      (l) => emit(state.copyWith(fetchCargoAndPaymentStatus: ApiStatus.error)),
      (r) {
        emit(
          state.copyWith(
            typesCargo: r.data,
            fetchCargoAndPaymentStatus: ApiStatus.success,
          ),
        );
        add(const FetchPaymentTypesEvent());
      },
    );
  }

  Future<void> _fetchTypePayment(
    FetchPaymentTypesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(fetchCargoAndPaymentStatus: ApiStatus.loading));
    final response = await fetchTypePaymentUseCase(NoParams());
    response.fold(
      (l) => emit(state.copyWith(fetchCargoAndPaymentStatus: ApiStatus.error)),
      (r) {
        emit(
          state.copyWith(
            typesPayment: r.data.sublist(0, 2),
            fetchCargoAndPaymentStatus: ApiStatus.success,
          ),
        );
      },
    );
  }

  void _selectTypeCargo(
    SelectedCargoTypeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(selectedTypeCargo: event.selectedTypeCargo));
  }

  void _selectTypePayment(
    SelectedPaymentTypeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(selectedTypePayment: event.selectedTypePayment));
  }

  void _changeTakeAllUnloads(
    ChangeTypeOfCargoEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        isTakeAllUnloads: event.isTakeAllUnloads,
        isLoadAroundTheClock: event.isLoadAroundTheClock,
      ),
    );
  }

  void _changeVolume(
    ChangeVolumeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        saveVolume: event.volume,
      ),
    );
  }

  void _changeWeight(
    ChangeWeightEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        saveWeight: event.weight,
      ),
    );
  }

  void _removeFilter(
    RemoveFilterEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        saveVolume: '',
        saveWeight: '',
        isTakeAllUnloads: false,
        isLoadAroundTheClock: false,
        isRemoveFilter: true,
        limit: 10,
        cargosCount: 0,
        cargosWithoutFilterCount: 0,
        cargoItems: [],
      ),
    );
    add(const GetAllCargosEvent());
  }

  void _homeClearFromAddress(
    HomeEventClearFromAddress event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        isRemoveFromAddress: true,
      ),
    );
  }

  void _homeClearToAddress(
    HomeEventClearToAddress event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        isRemoveToAddress: true,
      ),
    );
  }

  Future<void> _homeRefresh(
    HomeRefresh event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ApiStatus.loading,
        limit: 10,
        cargosPageNumber: 0,
        cargosCount: 0,
        cargosWithoutFilterCount: 0,
        cargosWithoutFilterPageNumber: 0,
        cargoItems: [],
        cargoItemsWithoutFilter: [],
      ),
    );
    add(const GetAllCargosEvent());
    // final response = await getAllCargosUseCase(
    //   GetAllCargoItemsParams(
    //     limit: state.limit,
    //     offset: 0,
    //   ),
    // );
    // response.fold(
    //   (failure) => emit(
    //     state.copyWith(status: ApiStatus.error),
    //   ),
    //   (cargoItems) {
    //     final List<SearchedCargoItemEntity> newFavouriteCargoes = [];
    //     for (final item in cargoItems.searchedCargos) {
    //       if (item.isLiked ?? false) {
    //         newFavouriteCargoes.add(item);
    //       }
    //     }
    //     if (cargoItems.count == 0) {
    //       add(const FetchCargosWithoutFilterPaginationEvent());
    //     }
    //     emit(
    //       state.copyWith(
    //         status: ApiStatus.success,
    //         cargoItems: cargoItems.searchedCargos,
    //         cargosCount: cargoItems.count,
    //         cargoIsLikedList: newFavouriteCargoes,
    //         cargosPageNumber: state.cargosPageNumber + state.limit,
    //       ),
    //     );
    //   },
    // );
  }

  Future<void> _getActiveCars(
    GetVehicleType event,
    Emitter<HomeState> emit,
  ) async {
    final response = await getUserCarsUseCase(
      GetUserCarsParams(
        limit: state.limit,
        offset: 0,
        userId: localSource.userId,
        status: ['active'],
      ),
    );
    if (response.isRight) {
      await localSource.setVehicleId(response.right.userCars.firstOrNull?.vehicleTypeId ?? '');
      emit(
        state.copyWith(
          isUpdate: !state.isUpdate,
        ),
      );
    }
  }
}
