import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../router/app_routes.dart';
import '../../../../../services/api_status.dart';
import '../../../domain/entities/cars_sale/cars_sale_search_entity.dart';
import '../../../domain/entities/cars_sale/recommendation_cars_entity.dart';
import '../../../domain/usecases/sale_cars/cars_sale_search_usecase.dart';
import '../../../domain/usecases/sale_cars/recommendation_cars_uscase.dart';

part 'sale_car_event.dart';

part 'sale_car_state.dart';

class SaleCarBloc extends Bloc<SaleCarEvent, SaleCarState> {
  SaleCarBloc({
    required this.getRecommendationCarsUseCase,
    required this.getCarsSaleSearchUseCase,
  }) : super(const SaleCarState()) {
    on<FocusChangedEvent>(_onFocusChange);
    on<SetSearchSavedListEvent>(_searchSavedList);
    on<DeleteItemSearchSavedListEvent>(_deleteItemSearchSavedList);
    on<GetSimilarSearchedListEvent>(_getSimilarSearchedList);
    on<InsertItemSearchSavedListEvent>(_insertItemSearchSavedList);
    on<GetRecommendationCarsEvent>(_recommendationCars);
    on<GetCarsSaleSearchEvent>(_getCarsSaleSearch);
  }

  final GetRecommendationCarsUseCase getRecommendationCarsUseCase;
  final GetCarsSaleSearchUseCase getCarsSaleSearchUseCase;

  void _onFocusChange(FocusChangedEvent event, Emitter<SaleCarState> emit) {
    emit(state.copyWith(hasFocus: event.hasFocus));
  }

  Future<void> _searchSavedList(
    SetSearchSavedListEvent event,
    Emitter<SaleCarState> emit,
  ) async {
    emit(state.copyWith(searchSavedList: localSource.searchSavedList));
  }

  Future<void> _insertItemSearchSavedList(
    InsertItemSearchSavedListEvent event,
    Emitter<SaleCarState> emit,
  ) async {
    final List<String> searchSavedList = [
      ...localSource.searchSavedList,
    ];
    if (!searchSavedList.contains(event.searchValue)) {
      searchSavedList.add(event.searchValue);
    }
    await localSource.setSearchSavedList(searchSavedList);
    emit(
      state.copyWith(
        searchSavedList: searchSavedList,
      ),
    );
  }

  Future<void> _deleteItemSearchSavedList(
    DeleteItemSearchSavedListEvent event,
    Emitter<SaleCarState> emit,
  ) async {
    final List<String> searchSavedList = state.searchSavedList;
    searchSavedList.removeAt(event.index);
    await localSource.setSearchSavedList(searchSavedList);
    emit(
      state.copyWith(
        searchSavedList: searchSavedList,
        isUpdateState: !state.isUpdateState,
      ),
    );
  }

  void _getSimilarSearchedList(
    GetSimilarSearchedListEvent event,
    Emitter<SaleCarState> emit,
  ) {
    final List<String> searchSavedList = localSource.searchSavedList;
    final List<String> similarSearchedList = searchSavedList
        .where(
          (String element) => element.toLowerCase().contains(
                event.searchValue.toLowerCase(),
              ),
        )
        .toList();
    emit(
      state.copyWith(
        searchSavedList: similarSearchedList,
      ),
    );
  }

  Future<void> _recommendationCars(
    GetRecommendationCarsEvent event,
    Emitter<SaleCarState> emit,
  ) async {
    emit(state.copyWith(recommendationCarsStatus: ApiStatus.loading));
    final result = await getRecommendationCarsUseCase(
      const RecommendationCarsParams(
        limit: 20,
        offset: 0,
      ),
    );
    result.fold(
      (failure) {
        emit(state.copyWith(recommendationCarsStatus: ApiStatus.error));
      },
      (recommendationCars) {
        emit(
          state.copyWith(
            recommendationCarsList: recommendationCars.recommendationCarsList,
            recommendationCarsStatus: ApiStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _getCarsSaleSearch(
    GetCarsSaleSearchEvent event,
    Emitter<SaleCarState> emit,
  ) async {
    emit(state.copyWith(carsSaleSearchStatus: ApiStatus.loading));
    final result = await getCarsSaleSearchUseCase(
      CarsSaleSearchParams(
        limit: 20,
        offset: 0,
        search: event.searchValue,
      ),
    );
    result.fold(
      (failure) {
        emit(state.copyWith(carsSaleSearchStatus: ApiStatus.error));
      },
      (carsSaleSearch) {
        emit(state.copyWith(carsSaleSearchStatus: ApiStatus.success));
      },
    );
  }
}
