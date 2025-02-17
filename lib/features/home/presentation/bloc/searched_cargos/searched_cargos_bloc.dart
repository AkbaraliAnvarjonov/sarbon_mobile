import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../../router/app_routes.dart';
import '../../../../../services/api_status.dart';
import '../../../data/models/apply_filter/apply_filter_request.dart';
import '../../../data/models/favourites/put_favourite_request_home.dart';
import '../../../domain/entities/search/get_searched_cargo_items_request_entity.dart';
import '../../../domain/entities/search/get_searched_cargo_items_response_entity.dart';
import '../../../domain/entities/types_cargo/types_cargo_entity.dart';
import '../../../domain/entities/types_payment/types_payment_entity.dart';
import '../../../domain/usecases/filter/apply_filter_usecase.dart';
import '../../../domain/usecases/filter/fetch_type_cargo_usecase.dart';
import '../../../domain/usecases/filter/fetch_type_payment_usecase.dart';
import '../../../domain/usecases/get_searched_cargo_items_usecase.dart';
import '../../../domain/usecases/put_favourite_cargo_home_usecase.dart';

part 'searched_cargos_event.dart';

part 'searched_cargos_state.dart';

class SearchedCargosBloc extends Bloc<SearchedCargosEvent, SearchedCargosState> {
  SearchedCargosBloc({
    required this.getSearchedCargoItemsUseCase,
    required this.putFavouriteCargoUseCase,
    required this.fetchTypeCargoUseCase,
    required this.fetchTypePaymentUseCase,
    required this.fetchCargoFromFilterUseCase,
  }) : super(const SearchedCargosState()) {
    on<GetSearchedResultEvent>(_getSearchedResults);
    on<DeleteLikeCargoEvent>(_deleteLikeCargo);
    on<PushLikeCargoEvent>(_pushLikeCargo);
    on<ChangeTypeOfCargoEvent>(_changeTakeAllUnloads);
    on<FetchCargoTypesEvent>(_fetchTypeCargo);
    on<FetchPaymentTypesEvent>(_fetchTypePayment);
    on<SelectedCargoTypeEvent>(_selectTypeCargo);
    on<SelectedPaymentTypeEvent>(_selectTypePayment);
    on<ApplyFilterEvent>(_fetchCargoFromFilterResults);
    on<ChangeVolumeEvent>(_changeVolume);
    on<ChangeWeightEvent>(_changeWeight);
  }

  final GetSearchedCargoItemsUseCase getSearchedCargoItemsUseCase;
  final PutFavouriteCargoHomeUseCase putFavouriteCargoUseCase;
  final FetchTypeCargoUseCase fetchTypeCargoUseCase;
  final FetchTypePaymentUseCase fetchTypePaymentUseCase;
  final FetchCargoFromFilterUseCase fetchCargoFromFilterUseCase;

  Future<void> _getSearchedResults(
    GetSearchedResultEvent event,
    Emitter<SearchedCargosState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final response = await getSearchedCargoItemsUseCase(
      GetSearchedCargoItemsParams(
        requestEntity: event.requestEntity,
        limit: state.limit,
        offset: state.offset,
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
            cargoItemsCount: r.count,
            status: ApiStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _deleteLikeCargo(
    DeleteLikeCargoEvent event,
    Emitter<SearchedCargosState> emit,
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
    Emitter<SearchedCargosState> emit,
  ) async {
    final List<SearchedCargoItemEntity> newFavouriteCargoes = [
      ...state.cargoIsLikedList,
    ];
    newFavouriteCargoes.add(event.cargo);
    final Set<String> setFavourite = {
      ...newFavouriteCargoes.map((e) => e.guid ?? ''),
      ...localSource.favouriteCargoes,
    };
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

  Future<void> _fetchCargoFromFilterResults(
    ApplyFilterEvent event,
    Emitter<SearchedCargosState> emit,
  ) async {
    emit(state.copyWith(applyFilterStatus: ApiStatus.loading));
    final response = await fetchCargoFromFilterUseCase(
      FetchCargoFromFilterParams(
        request: event.request,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(applyFilterStatus: ApiStatus.error)),
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
            cargoItemsCount: r.count,
            applyFilterStatus: ApiStatus.success,
          ),
        );
      },
    );
  }

  /// Filter events

  Future<void> _fetchTypeCargo(
    FetchCargoTypesEvent event,
    Emitter<SearchedCargosState> emit,
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
      },
    );
  }

  Future<void> _fetchTypePayment(
    FetchPaymentTypesEvent event,
    Emitter<SearchedCargosState> emit,
  ) async {
    emit(state.copyWith(fetchCargoAndPaymentStatus: ApiStatus.loading));
    final response = await fetchTypePaymentUseCase(NoParams());
    response.fold(
      (l) => emit(state.copyWith(fetchCargoAndPaymentStatus: ApiStatus.error)),
      (r) {
        emit(
          state.copyWith(
            typesPayment: r.data,
            fetchCargoAndPaymentStatus: ApiStatus.success,
          ),
        );
      },
    );
  }

  void _selectTypeCargo(
    SelectedCargoTypeEvent event,
    Emitter<SearchedCargosState> emit,
  ) {
    emit(state.copyWith(selectedTypeCargo: event.selectedTypeCargo));
  }

  void _selectTypePayment(
    SelectedPaymentTypeEvent event,
    Emitter<SearchedCargosState> emit,
  ) {
    emit(state.copyWith(selectedTypePayment: event.selectedTypePayment));
  }

  void _changeTakeAllUnloads(
    ChangeTypeOfCargoEvent event,
    Emitter<SearchedCargosState> emit,
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
    Emitter<SearchedCargosState> emit,
  ) {
    emit(
      state.copyWith(
        saveVolume: event.volume,
      ),
    );
  }

  void _changeWeight(
    ChangeWeightEvent event,
    Emitter<SearchedCargosState> emit,
  ) {
    emit(
      state.copyWith(
        saveWeight: event.weight,
      ),
    );
  }
}
