part of 'add_car_bloc.dart';

class AddCarState extends Equatable {
  const AddCarState({
    this.status = ApiStatus.initial,
    this.vehicleStatus = ApiStatus.initial,
    this.pageStatus = ApiStatus.initial,
    this.cargoTypes,
    this.trailerTypes,
    this.fuelTypes,
    this.loadTypes,
    this.selectedCargoType,
    this.selectedTrailerType,
    this.ecoStandartType,
    this.selectedFuelType,
    this.selectedLoadType,
    this.loadWeight = 0,
    this.loadCapacity = 0,
    this.pageNumber = 0,
    this.hydrolift = false,
    this.koniki = false,
    this.bodyDimensions = false,
    this.vehicleNumber = '',
    this.vehicleFile,
    this.technicalPassportFileFront,
    this.technicalPassportFileBack,
    this.trailerPassportFileFront1,
    this.trailerPassportFileFront2,
    this.trailerPassportFileBack1,
    this.trailerPassportFileBack2,
    this.adrFrontFile,
    this.adrBackFile,
    this.countryCode = '',
  });

  final ApiStatus status;
  final ApiStatus vehicleStatus;
  final ApiStatus pageStatus;
  final List<CargoTypeItem>? cargoTypes;
  final List<TrailerTypeItem>? trailerTypes;
  final List<TrailerTypeItem>? fuelTypes;
  final List<LoadTypeItem>? loadTypes;
  final CargoTypeItem? selectedCargoType;
  final TrailerTypeItem? selectedTrailerType;
  final TrailerTypeItem? selectedFuelType;
  final LoadTypeItem? selectedLoadType;
  final EcoStandartType? ecoStandartType;
  final num loadWeight;
  final num loadCapacity;
  final bool hydrolift;
  final bool koniki;
  final bool bodyDimensions;
  final String vehicleNumber;
  final File? vehicleFile;
  final File? technicalPassportFileBack;
  final File? technicalPassportFileFront;
  final File? trailerPassportFileBack1;
  final File? trailerPassportFileFront1;
  final File? trailerPassportFileBack2;
  final File? trailerPassportFileFront2;
  final File? adrFrontFile;
  final File? adrBackFile;
  final int pageNumber;
  final String countryCode;

  @override
  List<Object?> get props => [
        status,
        pageStatus,
        cargoTypes,
        trailerTypes,
        ecoStandartType,
        fuelTypes,
        loadTypes,
        selectedCargoType,
        selectedTrailerType,
        selectedFuelType,
        selectedLoadType,
        loadWeight,
        loadCapacity,
        hydrolift,
        koniki,
        bodyDimensions,
        vehicleNumber,
        vehicleFile,
        technicalPassportFileFront,
        technicalPassportFileBack,
        trailerPassportFileFront1,
        trailerPassportFileFront2,
        trailerPassportFileBack1,
        trailerPassportFileBack2,
        adrFrontFile,
        adrBackFile,
        pageNumber,
        countryCode,
        vehicleStatus,
      ];

  AddCarState copyWith({
    ApiStatus? status,
    ApiStatus? vehicleStatus,
    ApiStatus? pageStatus,
    List<CargoTypeItem>? cargoTypes,
    List<TrailerTypeItem>? trailerTypes,
    List<TrailerTypeItem>? fuelTypes,
    List<LoadTypeItem>? loadTypes,
    EcoStandartType? ecoStandartType,
    CargoTypeItem? selectedCargoType,
    TrailerTypeItem? selectedTrailerType,
    TrailerTypeItem? selectedFuelType,
    LoadTypeItem? selectedLoadType,
    num? loadWeight,
    num? loadCapacity,
    int? pageNumber,
    bool? hydrolift,
    bool? koniki,
    bool? bodyDimensions,
    String? vehicleNumber,
    String? countryCode,
    File? vehicleFile,
    File? adrFrontFile,
    File? adrBackFile,
    File? technicalPassportFileBack,
    File? technicalPassportFileFront,
    File? trailerPassportFileBack1,
    File? trailerPassportFileFront1,
    File? trailerPassportFileBack2,
    File? trailerPassportFileFront2,
  }) =>
      AddCarState(
        status: status ?? this.status,
        vehicleStatus: vehicleStatus ?? this.vehicleStatus,
        pageStatus: pageStatus ?? this.pageStatus,
        countryCode: countryCode ?? this.countryCode,
        pageNumber: pageNumber ?? this.pageNumber,
        cargoTypes: cargoTypes ?? this.cargoTypes,
        ecoStandartType: ecoStandartType ?? this.ecoStandartType,
        trailerTypes: trailerTypes ?? this.trailerTypes,
        fuelTypes: fuelTypes ?? this.fuelTypes,
        loadTypes: loadTypes ?? this.loadTypes,
        selectedCargoType: selectedCargoType ?? this.selectedCargoType,
        selectedTrailerType: selectedTrailerType ?? this.selectedTrailerType,
        selectedFuelType: selectedFuelType ?? this.selectedFuelType,
        selectedLoadType: selectedLoadType ?? this.selectedLoadType,
        loadWeight: loadWeight ?? this.loadWeight,
        loadCapacity: loadCapacity ?? this.loadCapacity,
        hydrolift: hydrolift ?? this.hydrolift,
        koniki: koniki ?? this.koniki,
        bodyDimensions: bodyDimensions ?? this.bodyDimensions,
        vehicleNumber: vehicleNumber ?? this.vehicleNumber,
        vehicleFile: vehicleFile ?? this.vehicleFile,
        adrFrontFile: adrFrontFile ?? this.adrFrontFile,
        adrBackFile: adrBackFile ?? this.adrBackFile,
        technicalPassportFileBack: technicalPassportFileBack ?? this.technicalPassportFileBack,
        technicalPassportFileFront: technicalPassportFileFront ?? this.technicalPassportFileFront,
        trailerPassportFileBack1: trailerPassportFileBack1 ?? this.trailerPassportFileBack1,
        trailerPassportFileFront1: trailerPassportFileFront1 ?? this.trailerPassportFileFront1,
        trailerPassportFileBack2: trailerPassportFileBack2 ?? this.trailerPassportFileBack2,
        trailerPassportFileFront2: trailerPassportFileFront2 ?? this.trailerPassportFileFront2,
      );
}
