part of 'searched_cargos_bloc.dart';

class SearchedCargosState extends Equatable {
  const SearchedCargosState({
    this.status = ApiStatus.initial,
    this.putFavouriteStatus = ApiStatus.initial,
    this.cargoItems = const [],
    this.cargoIsLikedList = const [],
    this.cargoItemsCount = 0,
    this.limit = 10,
    this.offset = 0,
    this.isTakeAllUnloads = false,
    this.isLoadAroundTheClock = false,
    this.typesCargo = const [],
    this.typesPayment = const [],
    this.selectedTypeCargo,
    this.selectedTypePayment,
    this.fetchCargoAndPaymentStatus = ApiStatus.initial,
    this.applyFilterStatus = ApiStatus.initial,
    this.saveVolume = '',
    this.saveWeight = '',
  });

  final ApiStatus status;
  final ApiStatus putFavouriteStatus;
  final List<SearchedCargoItemEntity> cargoItems;
  final List<SearchedCargoItemEntity> cargoIsLikedList;
  final int cargoItemsCount;
  final int limit;
  final int offset;

  /// Filter items
  final bool isTakeAllUnloads;
  final bool isLoadAroundTheClock;
  final List<TypeCargoListEntity> typesCargo;
  final List<TypePaymentListEntity> typesPayment;
  final TypeCargoListEntity? selectedTypeCargo;
  final TypePaymentListEntity? selectedTypePayment;
  final ApiStatus fetchCargoAndPaymentStatus;
  final ApiStatus applyFilterStatus;
  final String saveVolume;
  final String saveWeight;

  @override
  List<Object?> get props => [
        status,
        cargoItems,
        cargoItemsCount,
        limit,
        offset,
        putFavouriteStatus,
        cargoIsLikedList,
        isTakeAllUnloads,
        isLoadAroundTheClock,
        typesCargo,
        typesPayment,
        selectedTypeCargo,
        selectedTypePayment,
        fetchCargoAndPaymentStatus,
        applyFilterStatus,
        saveVolume,
        saveWeight,
      ];

  SearchedCargosState copyWith({
    ApiStatus? status,
    List<SearchedCargoItemEntity>? cargoItems,
    int? cargoItemsCount,
    int? limit,
    int? offset,
    ApiStatus? putFavouriteStatus,
    List<SearchedCargoItemEntity>? cargoIsLikedList,
    bool? isTakeAllUnloads,
    bool? isLoadAroundTheClock,
    List<TypeCargoListEntity>? typesCargo,
    List<TypePaymentListEntity>? typesPayment,
    TypeCargoListEntity? selectedTypeCargo,
    TypePaymentListEntity? selectedTypePayment,
    ApiStatus? fetchCargoAndPaymentStatus,
    ApiStatus? applyFilterStatus,
    String? saveVolume,
    String? saveWeight,
  }) =>
      SearchedCargosState(
        status: status ?? ApiStatus.initial,
        cargoItems: cargoItems ?? this.cargoItems,
        cargoItemsCount: cargoItemsCount ?? this.cargoItemsCount,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        putFavouriteStatus: putFavouriteStatus ?? ApiStatus.initial,
        cargoIsLikedList: cargoIsLikedList ?? this.cargoIsLikedList,
        isTakeAllUnloads: isTakeAllUnloads ?? this.isTakeAllUnloads,
        isLoadAroundTheClock: isLoadAroundTheClock ?? this.isLoadAroundTheClock,
        typesCargo: typesCargo ?? this.typesCargo,
        typesPayment: typesPayment ?? this.typesPayment,
        selectedTypeCargo: selectedTypeCargo ?? this.selectedTypeCargo,
        selectedTypePayment: selectedTypePayment ?? this.selectedTypePayment,
        fetchCargoAndPaymentStatus:
            fetchCargoAndPaymentStatus ?? ApiStatus.initial,
        applyFilterStatus: applyFilterStatus ?? ApiStatus.initial,
        saveVolume: saveVolume ?? this.saveVolume,
        saveWeight: saveWeight ?? this.saveWeight,
      );
}
