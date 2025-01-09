part of 'update_archive_announcement_bloc.dart';

class UpdateArchiveAnnouncementState extends Equatable {
  const UpdateArchiveAnnouncementState({
    this.typeCarsList = const [],
    this.getCarTypesStatus = ApiStatus.initial,
    this.selectedCarType,
    this.imageFile,
    this.addressesList = const [],
    this.currencyList = const [],
    this.selectedAddress,
    this.selectedCurrency,
    this.getAddressesStatus = ApiStatus.initial,
    this.getCurrencyTypesStatus = ApiStatus.initial,
    this.updateAnnouncementStatus = ApiStatus.initial,
  });

  final List<TypeCarsListEntity> typeCarsList;
  final List<AddressesListEntity> addressesList;
  final List<TypeCurrencyListEntity> currencyList;
  final TypeCarsListEntity? selectedCarType;
  final AddressesListEntity? selectedAddress;
  final TypeCurrencyListEntity? selectedCurrency;
  final ApiStatus getCarTypesStatus;
  final ApiStatus getAddressesStatus;
  final ApiStatus getCurrencyTypesStatus;
  final ApiStatus updateAnnouncementStatus;
  final File? imageFile;

  UpdateArchiveAnnouncementState copyWith({
    List<TypeCarsListEntity>? typeCarsList,
    ApiStatus? getCarTypesStatus,
    TypeCarsListEntity? selectedCarType,
    File? imageFile,
    List<AddressesListEntity>? addressesList,
    List<TypeCurrencyListEntity>? currencyList,
    AddressesListEntity? selectedAddress,
    TypeCurrencyListEntity? selectedCurrency,
    ApiStatus? getAddressesStatus,
    ApiStatus? getCurrencyTypesStatus,
    ApiStatus? updateAnnouncementStatus,
  }) =>
      UpdateArchiveAnnouncementState(
        typeCarsList: typeCarsList ?? this.typeCarsList,
        getCarTypesStatus: getCarTypesStatus ?? this.getCarTypesStatus,
        selectedCarType: selectedCarType ?? this.selectedCarType,
        imageFile: imageFile ?? this.imageFile,
        addressesList: addressesList ?? this.addressesList,
        currencyList: currencyList ?? this.currencyList,
        selectedAddress: selectedAddress ?? this.selectedAddress,
        selectedCurrency: selectedCurrency ?? this.selectedCurrency,
        getAddressesStatus: getAddressesStatus ?? this.getAddressesStatus,
        getCurrencyTypesStatus:
            getCurrencyTypesStatus ?? this.getCurrencyTypesStatus,
        updateAnnouncementStatus:
            updateAnnouncementStatus ?? this.updateAnnouncementStatus,
      );

  @override
  List<Object?> get props => [
        typeCarsList,
        getCarTypesStatus,
        selectedCarType,
        imageFile,
        addressesList,
        currencyList,
        selectedAddress,
        selectedCurrency,
        getAddressesStatus,
        getCurrencyTypesStatus,
        updateAnnouncementStatus,
      ];
}
