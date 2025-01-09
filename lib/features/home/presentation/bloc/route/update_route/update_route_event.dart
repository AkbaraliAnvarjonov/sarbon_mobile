part of 'update_route_bloc.dart';

abstract class UpdateRouteEvent extends Equatable {
  const UpdateRouteEvent();
}

class SelectInitialAddressesEvent extends UpdateRouteEvent {
  const SelectInitialAddressesEvent({
    required this.address,
  });

  final AddressForRouteEntity address;

  @override
  List<Object?> get props => [address];
}

class SelectFinalAddressesEvent extends UpdateRouteEvent {
  const SelectFinalAddressesEvent({
    required this.address,
  });

  final AddressForRouteEntity address;

  @override
  List<Object?> get props => [address];
}

class SelectDateEvent extends UpdateRouteEvent {
  const SelectDateEvent({
    required this.date,
    this.selectedDate,
  });

  final String date;
  final DateTime? selectedDate;

  @override
  List<Object?> get props => [date, selectedDate];
}

class FetchAddressesForUpdateRouteEvent extends UpdateRouteEvent {
  const FetchAddressesForUpdateRouteEvent();

  @override
  List<Object?> get props => [];
}

class PutRouteEvent extends UpdateRouteEvent {
  const PutRouteEvent({
    required this.capacity,
    required this.volume,
    required this.guid,
  });

  final String guid;
  final String capacity;
  final String volume;

  @override
  List<Object?> get props => [
        capacity,
        volume,
        guid,
      ];
}

class FetchVehicleTypesEvent extends UpdateRouteEvent {
  const FetchVehicleTypesEvent();

  @override
  List<Object?> get props => [];
}

class SelectVehicleTypesEvent extends UpdateRouteEvent {
  const SelectVehicleTypesEvent({
    required this.vehicleType,
  });

  final VehicleTypeItemEntity? vehicleType;

  @override
  List<Object?> get props => [vehicleType];
}
