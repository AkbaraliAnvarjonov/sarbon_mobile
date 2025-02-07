part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = ApiStatus.initial,
    this.putFavouriteStatus = ApiStatus.initial,
    this.tabIndex = 0,
    this.news = const [],
    this.addresses = const [],
    this.cargoIsLikedList = const [],
    this.cargosCount = 0,
    this.addressesCount = 0,
    this.searchedAddressesCount = 0,
    this.fromAddress = '',
    this.toAddress = '',
    this.dateTime,
    this.searchedCargoItemsRequestEntity,
    this.limit = 10,
    this.cargosPageNumber = 0,
    this.cargoItems = const [],
    this.cargoItemsWithoutFilter = const [],
    this.isTakeAllUnloads = false,
    this.isLoadAroundTheClock = false,
    this.isUpdate = false,
    this.typesCargo = const [],
    this.typesPayment = const [],
    this.selectedTypeCargo,
    this.selectedTypePayment,
    this.fetchCargoAndPaymentStatus = ApiStatus.initial,
    this.saveVolume = '',
    this.saveVolume2 = '',
    this.saveWeight = '',
    this.saveWeight2 = '',
    this.cargosWithoutFilterPageNumber = 0,
    this.cargosWithoutFilterCount = 0,
  });

  final ApiStatus status;
  final int tabIndex;
  final bool isUpdate;
  final ApiStatus putFavouriteStatus;
  final List<NewsItemEntity> news;
  final List<AddressItemEntity> addresses;
  final List<SearchedCargoItemEntity> cargoItems;
  final List<SearchedCargoItemEntity> cargoItemsWithoutFilter;
  final List<SearchedCargoItemEntity> cargoIsLikedList;
  final int addressesCount;
  final int searchedAddressesCount;
  final String fromAddress;
  final String toAddress;
  final DateTime? dateTime;
  final GetSearchedCargoItemsRequestEntity? searchedCargoItemsRequestEntity;
  final int cargosCount;
  final int cargosWithoutFilterCount;
  final int limit;
  final int cargosPageNumber;
  final int cargosWithoutFilterPageNumber;

  /// filter
  final bool isTakeAllUnloads;
  final bool isLoadAroundTheClock;
  final List<TypeCargoListEntity> typesCargo;
  final List<TypePaymentListEntity> typesPayment;
  final TypeCargoListEntity? selectedTypeCargo;
  final TypePaymentListEntity? selectedTypePayment;
  final ApiStatus fetchCargoAndPaymentStatus;
  final String saveVolume;
  final String saveVolume2;
  final String saveWeight;
  final String saveWeight2;

  @override
  List<Object?> get props => [
        cargoItemsWithoutFilter,
        status,
        putFavouriteStatus,
        tabIndex,
        isUpdate,
        cargosWithoutFilterPageNumber,
        news,
        cargosCount,
        cargosWithoutFilterCount,
        searchedAddressesCount,
        addresses,
        addressesCount,
        fromAddress,
        toAddress,
        dateTime,
        limit,
        searchedCargoItemsRequestEntity,
        cargosPageNumber,
        cargoItems,
        cargoIsLikedList,
        isTakeAllUnloads,
        isLoadAroundTheClock,
        typesCargo,
        typesPayment,
        selectedTypeCargo,
        selectedTypePayment,
        fetchCargoAndPaymentStatus,
        saveVolume,
        saveVolume2,
        saveWeight,
        saveWeight2,
      ];

  HomeState copyWith({
    ApiStatus? status,
    ApiStatus? putFavouriteStatus,
    int? tabIndex,
    bool? isUpdate,
    int? cargosWithoutFilterPageNumber,
    List<NewsItemEntity>? news,
    List<AddressItemEntity>? addresses,
    List<SearchedCargoItemEntity>? cargoItems,
    List<SearchedCargoItemEntity>? cargoItemsWithoutFilter,
    List<SearchedCargoItemEntity>? cargoIsLikedList,
    int? cargosCount,
    int? cargosWithoutFilterCount,
    int? addressesCount,
    int? searchedAddressesCount,
    String? fromAddress,
    String? toAddress,
    DateTime? dateTime,
    int? limit,
    GetSearchedCargoItemsRequestEntity? searchedCargoItemsRequestEntity,
    int? cargosPageNumber,
    bool? isTakeAllUnloads,
    bool? isLoadAroundTheClock,
    List<TypeCargoListEntity>? typesCargo,
    List<TypePaymentListEntity>? typesPayment,
    TypeCargoListEntity? selectedTypeCargo,
    TypePaymentListEntity? selectedTypePayment,
    ApiStatus? fetchCargoAndPaymentStatus,
    String? saveVolume,
    String? saveVolume2,
    String? saveWeight,
    String? saveWeight2,
    bool? isRemoveFilter,
    bool? isRemoveFromAddress,
    bool? isRemoveToAddress,
  }) =>
      HomeState(
        status: status ?? this.status,
        isUpdate: isUpdate ?? this.isUpdate,
        cargosWithoutFilterPageNumber: cargosWithoutFilterPageNumber ?? this.cargosWithoutFilterPageNumber,
        putFavouriteStatus: putFavouriteStatus ?? this.putFavouriteStatus,
        tabIndex: tabIndex ?? this.tabIndex,
        cargoItemsWithoutFilter: cargoItemsWithoutFilter ?? this.cargoItemsWithoutFilter,
        news: news ?? this.news,
        cargosCount: cargosCount ?? this.cargosCount,
        cargosWithoutFilterCount: cargosWithoutFilterCount ?? this.cargosWithoutFilterCount,
        cargoIsLikedList: cargoIsLikedList ?? this.cargoIsLikedList,
        addresses: addresses ?? this.addresses,
        addressesCount: addressesCount ?? this.addressesCount,
        searchedAddressesCount: searchedAddressesCount ?? this.searchedAddressesCount,
        fromAddress:
            ((isRemoveFilter ?? false) || (isRemoveFromAddress ?? false)) ? '' : fromAddress ?? this.fromAddress,
        toAddress: ((isRemoveFilter ?? false) || (isRemoveToAddress ?? false)) ? '' : toAddress ?? this.toAddress,
        dateTime: dateTime ?? this.dateTime,
        limit: limit ?? this.limit,
        searchedCargoItemsRequestEntity: searchedCargoItemsRequestEntity ?? this.searchedCargoItemsRequestEntity,
        cargosPageNumber: cargosPageNumber ?? this.cargosPageNumber,
        cargoItems: cargoItems ?? this.cargoItems,
        isTakeAllUnloads: isTakeAllUnloads ?? this.isTakeAllUnloads,
        isLoadAroundTheClock: isLoadAroundTheClock ?? this.isLoadAroundTheClock,
        typesCargo: typesCargo ?? this.typesCargo,
        typesPayment: typesPayment ?? this.typesPayment,
        selectedTypeCargo: (isRemoveFilter ?? false) ? null : selectedTypeCargo ?? this.selectedTypeCargo,
        selectedTypePayment: (isRemoveFilter ?? false) ? null : selectedTypePayment ?? this.selectedTypePayment,
        fetchCargoAndPaymentStatus: fetchCargoAndPaymentStatus ?? ApiStatus.initial,
        saveVolume: saveVolume ?? this.saveVolume,
        saveVolume2: saveVolume2 ?? this.saveVolume2,
        saveWeight: saveWeight ?? this.saveWeight,
        saveWeight2: saveWeight2 ?? this.saveWeight2,
      );

  bool get isFilterEmpty =>
      selectedTypeCargo == null &&
      selectedTypePayment == null &&
      saveVolume.isEmpty &&
      saveVolume2.isEmpty &&
      saveWeight.isEmpty &&
      saveWeight2.isEmpty &&
      (!isTakeAllUnloads || !isLoadAroundTheClock) &&
      toAddress == '' &&
      fromAddress == '';
}
