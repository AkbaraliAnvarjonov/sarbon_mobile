part of 'edit_car_bloc.dart';

class EditCarState extends Equatable {
  const EditCarState({
    this.fetchCargoTypesStatus = ApiStatus.initial,
    this.fetchTrailerTypesStatus = ApiStatus.initial,
    this.fetchLoadTypesStatus = ApiStatus.initial,
    this.updateCarStatus = ApiStatus.initial,
    this.cargoTypes = const [],
    this.trailerTypes = const [],
    this.loadTypes = const [],
    this.selectedCargoType,
    this.selectedTrailerType,
    this.selectedLoadType,
    this.hydroLift = false,
    this.koniky = false,
    this.bodyDimensions = false,
    this.carStatus = '',
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
  });

  final ApiStatus fetchCargoTypesStatus;
  final ApiStatus fetchTrailerTypesStatus;
  final ApiStatus fetchLoadTypesStatus;
  final ApiStatus updateCarStatus;
  final List<CargoTypeItem> cargoTypes;
  final List<TrailerTypeItem> trailerTypes;
  final List<LoadTypeItem> loadTypes;
  final CargoTypeItem? selectedCargoType;
  final TrailerTypeItem? selectedTrailerType;
  final LoadTypeItem? selectedLoadType;
  final bool hydroLift;
  final bool koniky;
  final bool bodyDimensions;
  final String carStatus;
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

  EditCarState copyWith({
    ApiStatus? fetchCargoTypesStatus,
    ApiStatus? fetchTrailerTypesStatus,
    ApiStatus? fetchLoadTypesStatus,
    ApiStatus? updateCarStatus,
    List<CargoTypeItem>? cargoTypes,
    List<TrailerTypeItem>? trailerTypes,
    List<LoadTypeItem>? loadTypes,
    CargoTypeItem? selectedCargoType,
    TrailerTypeItem? selectedTrailerType,
    LoadTypeItem? selectedLoadType,
    bool? hydroLift,
    bool? koniky,
    String? carStatus,
    bool? bodyDimensions,
    String? vehicleNumber,
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
      EditCarState(
        fetchCargoTypesStatus: fetchCargoTypesStatus ?? ApiStatus.initial,
        fetchTrailerTypesStatus: fetchTrailerTypesStatus ?? ApiStatus.initial,
        fetchLoadTypesStatus: fetchLoadTypesStatus ?? ApiStatus.initial,
        updateCarStatus: updateCarStatus ?? ApiStatus.initial,
        cargoTypes: cargoTypes ?? this.cargoTypes,
        trailerTypes: trailerTypes ?? this.trailerTypes,
        loadTypes: loadTypes ?? this.loadTypes,
        selectedCargoType: selectedCargoType ?? this.selectedCargoType,
        selectedTrailerType: selectedTrailerType ?? this.selectedTrailerType,
        selectedLoadType: selectedLoadType ?? this.selectedLoadType,
        hydroLift: hydroLift ?? this.hydroLift,
        koniky: koniky ?? this.koniky,
        carStatus: carStatus ?? this.carStatus,
        vehicleNumber: vehicleNumber ?? this.vehicleNumber,
        bodyDimensions: bodyDimensions ?? this.bodyDimensions,
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

  @override
  List<Object?> get props => [
        fetchCargoTypesStatus,
        cargoTypes,
        trailerTypes,
        loadTypes,
        selectedCargoType,
        selectedTrailerType,
        selectedLoadType,
        hydroLift,
        koniky,
        carStatus,
        bodyDimensions,
        updateCarStatus,
        vehicleFile,
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
      ];
}
