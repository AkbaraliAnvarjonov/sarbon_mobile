part of 'edit_car_bloc.dart';

abstract class EditCarEvent extends Equatable {
  const EditCarEvent();
}

class UpdateCarEvent extends EditCarEvent {
  const UpdateCarEvent({required this.request});

  final CreateUpdateCarRequestModel request;

  @override
  List<Object?> get props => [request];
}

class DeleteCarEvent extends EditCarEvent {
  const DeleteCarEvent({required this.carId});

  final String carId;

  @override
  List<Object?> get props => [carId];
}

class FetchCargoTypesEvent extends EditCarEvent {
  const FetchCargoTypesEvent();

  @override
  List<Object?> get props => [];
}

class FetchTrailerTypesEvent extends EditCarEvent {
  const FetchTrailerTypesEvent();

  @override
  List<Object?> get props => [];
}

class FetchLoadTypesEvent extends EditCarEvent {
  const FetchLoadTypesEvent();

  @override
  List<Object?> get props => [];
}

class SelectCargoTypeEvent extends EditCarEvent {
  const SelectCargoTypeEvent(this.cargoType);

  final CargoTypeItem cargoType;

  @override
  List<Object?> get props => [cargoType];
}

class SelectTrailerTypeEvent extends EditCarEvent {
  const SelectTrailerTypeEvent(this.trailerType);

  final TrailerTypeItem trailerType;

  @override
  List<Object?> get props => [trailerType];
}

class SelectLoadTypeEvent extends EditCarEvent {
  const SelectLoadTypeEvent(this.loadType);

  final LoadTypeItem loadType;

  @override
  List<Object?> get props => [loadType];
}

class ChangeHydroLiftStatusEvent extends EditCarEvent {
  const ChangeHydroLiftStatusEvent({this.value});

  final bool? value;

  @override
  List<Object?> get props => [value];
}

class ChangeKonikyStatusEvent extends EditCarEvent {
  const ChangeKonikyStatusEvent({this.value});

  final bool? value;

  @override
  List<Object?> get props => [value];
}

class ChangeBodyDimensionsStatusEvent extends EditCarEvent {
  const ChangeBodyDimensionsStatusEvent({this.value});

  final bool? value;

  @override
  List<Object?> get props => [value];
}

class ChangeActiveInActiveStatusEvent extends EditCarEvent {
  const ChangeActiveInActiveStatusEvent({required this.carStatus});

  final String carStatus;

  @override
  List<Object?> get props => [carStatus];
}

class SelectVehicleImageEvent extends EditCarEvent {
  const SelectVehicleImageEvent({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class SelectTechnicalPassportFrontImageEvent extends EditCarEvent {
  const SelectTechnicalPassportFrontImageEvent({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class SelectTechnicalPassportBackImageEvent extends EditCarEvent {
  const SelectTechnicalPassportBackImageEvent({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class SelectTrailerPassportFrontImage1Event extends EditCarEvent {
  const SelectTrailerPassportFrontImage1Event({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class SelectTrailerPassportBackImage1Event extends EditCarEvent {
  const SelectTrailerPassportBackImage1Event({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class SelectTrailerPassportFrontImage2Event extends EditCarEvent {
  const SelectTrailerPassportFrontImage2Event({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class SelectTrailerPassportBackImage2Event extends EditCarEvent {
  const SelectTrailerPassportBackImage2Event({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class SelectAdrFrontImageEvent extends EditCarEvent {
  const SelectAdrFrontImageEvent({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class SelectAdrBackImageEvent extends EditCarEvent {
  const SelectAdrBackImageEvent({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class ChangeStatusEvent extends EditCarEvent {
  const ChangeStatusEvent();

  @override
  List<Object?> get props => [];
}
