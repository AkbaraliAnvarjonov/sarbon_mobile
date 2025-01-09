part of 'add_car_bloc.dart';

abstract class AddCarEvent extends Equatable {
  const AddCarEvent();
}

class InitialEvent extends AddCarEvent {
  const InitialEvent();

  @override
  List<Object?> get props => [];
}

class SelectCargoTypeEvent extends AddCarEvent {
  const SelectCargoTypeEvent(this.cargoType);

  final CargoTypeItem cargoType;

  @override
  List<Object?> get props => [cargoType];
}

class SelectTrailerTypeEvent extends AddCarEvent {
  const SelectTrailerTypeEvent(this.trailerType);

  final TrailerTypeItem trailerType;

  @override
  List<Object?> get props => [trailerType];
}

class SelectLoadTypeEvent extends AddCarEvent {
  const SelectLoadTypeEvent(this.loadType);

  final LoadTypeItem loadType;

  @override
  List<Object?> get props => [loadType];
}

class SelectEcoTypeEvent extends AddCarEvent {
  const SelectEcoTypeEvent(this.ecoType);

  final EcoStandartType ecoType;

  @override
  List<Object?> get props => [ecoType];
}

class WriteLoadWeightEvent extends AddCarEvent {
  const WriteLoadWeightEvent(this.loadWeight);

  final String loadWeight;

  @override
  List<Object?> get props => [loadWeight];
}

class WriteVehicleNumberEvent extends AddCarEvent {
  const WriteVehicleNumberEvent(this.vehicleNumber);

  final String vehicleNumber;

  @override
  List<Object?> get props => [vehicleNumber];
}

class SelectVehicleImageEvent extends AddCarEvent {
  const SelectVehicleImageEvent({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class SelectTechnicalPassportFrontImageEvent extends AddCarEvent {
  const SelectTechnicalPassportFrontImageEvent({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class SelectTechnicalPassportBackImageEvent extends AddCarEvent {
  const SelectTechnicalPassportBackImageEvent({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class SelectTrailerPassportFrontImage1Event extends AddCarEvent {
  const SelectTrailerPassportFrontImage1Event({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class SelectTrailerPassportBackImage1Event extends AddCarEvent {
  const SelectTrailerPassportBackImage1Event({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class SelectTrailerPassportFrontImage2Event extends AddCarEvent {
  const SelectTrailerPassportFrontImage2Event({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class SelectTrailerPassportBackImage2Event extends AddCarEvent {
  const SelectTrailerPassportBackImage2Event({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class SelectAdrFrontImageEvent extends AddCarEvent {
  const SelectAdrFrontImageEvent({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class SelectAdrBackImageEvent extends AddCarEvent {
  const SelectAdrBackImageEvent({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class WriteLoadCapacityEvent extends AddCarEvent {
  const WriteLoadCapacityEvent(this.loadCapacity);

  final String loadCapacity;

  @override
  List<Object?> get props => [loadCapacity];
}

class ChangeHydroliftStatusEvent extends AddCarEvent {
  const ChangeHydroliftStatusEvent();

  @override
  List<Object?> get props => [];
}

class ChangeKonikiStatusEvent extends AddCarEvent {
  const ChangeKonikiStatusEvent();

  @override
  List<Object?> get props => [];
}

class ChangeBodyDimensionsStatusEvent extends AddCarEvent {
  const ChangeBodyDimensionsStatusEvent();

  @override
  List<Object?> get props => [];
}

class SelectFuelEvent extends AddCarEvent {
  final TrailerTypeItem fuel;

  const SelectFuelEvent(this.fuel);

  @override
  List<Object?> get props => [
        fuel,
      ];
}

class ChangeCarCountryEvent extends AddCarEvent {
  final String countryCode;

  const ChangeCarCountryEvent(this.countryCode);

  @override
  List<Object?> get props => [
        countryCode,
      ];
}

class ChangePage extends AddCarEvent {
  final int pageNumber;

  const ChangePage({required this.pageNumber});

  @override
  List<Object?> get props => [];
}

class AddCarButtonPressedEvent extends AddCarEvent {
  const AddCarButtonPressedEvent({
    required this.vehicleImage,
    required this.techPassportBack,
    required this.techPassportFront,
    required this.techPassportTrailerFront1,
    required this.techPassportTrailerFront2,
    required this.techPassportTrailerBack1,
    required this.techPassportTrailerBack2,
    required this.adrPictureFront,
    required this.adrPictureBack,
    required this.ruNumber,
    required this.kzNumber,
    required this.trNumber,
  });

  final String? vehicleImage;
  final String? techPassportBack;
  final String? techPassportFront;
  final String? techPassportTrailerFront1;
  final String? techPassportTrailerFront2;
  final String? techPassportTrailerBack1;
  final String? techPassportTrailerBack2;
  final String? adrPictureFront;
  final String? adrPictureBack;
  final String? ruNumber;
  final String? kzNumber;
  final String? trNumber;

  @override
  List<Object?> get props => [
        vehicleImage,
        techPassportBack,
        techPassportFront,
        techPassportTrailerFront1,
        techPassportTrailerFront2,
        techPassportTrailerBack1,
        techPassportTrailerBack2,
        adrPictureFront,
        adrPictureBack,
        ruNumber,
        kzNumber,
        trNumber,
      ];
}

class ChangeStatusEvent extends AddCarEvent {
  const ChangeStatusEvent(
    this.status,
  );

  final ApiStatus status;

  @override
  List<Object?> get props => [];
}

