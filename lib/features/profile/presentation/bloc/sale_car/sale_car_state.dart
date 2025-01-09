part of 'sale_car_bloc.dart';

class SaleCarState extends Equatable {
  const SaleCarState({
    this.hasFocus = false,
    this.searchSavedList = const [],
    this.isUpdateState = false,
    this.recommendationCarsList = const [],
    this.recommendationCarsStatus = ApiStatus.initial,
    this.carsSaleSearchStatus = ApiStatus.initial,
  });

  final bool hasFocus;
  final List<String> searchSavedList;
  final bool isUpdateState;
  final List<RecommendationCarsListEntity> recommendationCarsList;
  final ApiStatus recommendationCarsStatus;
  final ApiStatus carsSaleSearchStatus;

  SaleCarState copyWith({
    bool? hasFocus,
    List<String>? searchSavedList,
    bool? isUpdateState,
    List<RecommendationCarsListEntity>? recommendationCarsList,
    ApiStatus? recommendationCarsStatus,
    ApiStatus? carsSaleSearchStatus,
  }) =>
      SaleCarState(
        hasFocus: hasFocus ?? this.hasFocus,
        searchSavedList: searchSavedList ?? this.searchSavedList,
        isUpdateState: isUpdateState ?? this.isUpdateState,
        recommendationCarsList:
            recommendationCarsList ?? this.recommendationCarsList,
        recommendationCarsStatus:
            recommendationCarsStatus ?? this.recommendationCarsStatus,
        carsSaleSearchStatus: carsSaleSearchStatus ?? this.carsSaleSearchStatus,
      );

  @override
  List<Object?> get props => [
        hasFocus,
        searchSavedList,
        isUpdateState,
        recommendationCarsList,
        recommendationCarsStatus,
        carsSaleSearchStatus,
      ];
}
