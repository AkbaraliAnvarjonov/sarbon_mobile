part of 'add_route_bloc.dart';

abstract class AddRouteEvent extends Equatable {
  const AddRouteEvent();
}

class SelectInitialAddressesEvent extends AddRouteEvent {
  const SelectInitialAddressesEvent({
    required this.address,
  });

  final SearchItem address;

  @override
  List<Object?> get props => [address];
}

class SelectFinalAddressesEvent extends AddRouteEvent {
  const SelectFinalAddressesEvent({
    required this.address,
  });

  final SearchItem address;

  @override
  List<Object?> get props => [address];
}

class SelectDateEvent extends AddRouteEvent {
  const SelectDateEvent({
    required this.date,
  });

  final DateTime date;

  @override
  List<Object?> get props => [date];
}

class FetchAddressesEvent extends AddRouteEvent {
  const FetchAddressesEvent();

  @override
  List<Object?> get props => [];
}

class CreateRouteEvent extends AddRouteEvent {
  const CreateRouteEvent({
    required this.capacity,
    required this.volume,
  });

  final String capacity;
  final String volume;

  @override
  List<Object?> get props => [
        capacity,
        volume,
      ];
}

class FetchVehicleTypesEvent extends AddRouteEvent {
  const FetchVehicleTypesEvent();

  @override
  List<Object?> get props => [];
}

class SelectVehicleTypesEvent extends AddRouteEvent {
  const SelectVehicleTypesEvent({
    required this.vehicleType,
  });

  final VehicleTypeItemEntity? vehicleType;

  @override
  List<Object?> get props => [vehicleType];
}
