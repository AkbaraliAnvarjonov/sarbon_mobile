part of 'update_route_bloc.dart';

class UpdateRouteState extends Equatable {
  const UpdateRouteState({
    this.fromAddress,
    this.toAddress,
    this.dateTime,
    this.addresses = const [],
    this.getAddressesStatus = ApiStatus.initial,
    this.updateRouteStatus = ApiStatus.initial,
    this.selectedDate,
    this.vehicleTypes = const [],
    this.selectedVehicleType,
  });

  final AddressForRouteEntity? fromAddress;
  final AddressForRouteEntity? toAddress;
  final String? dateTime;
  final DateTime? selectedDate;
  final List<AddressItemEntity> addresses;
  final ApiStatus getAddressesStatus;
  final ApiStatus updateRouteStatus;
  final List<VehicleTypeItemEntity> vehicleTypes;
  final VehicleTypeItemEntity? selectedVehicleType;

  UpdateRouteState copyWith({
    AddressForRouteEntity? fromAddress,
    AddressForRouteEntity? toAddress,
    String? dateTime,
    List<AddressItemEntity>? addresses,
    ApiStatus? getAddressesStatus,
    ApiStatus? updateRouteStatus,
    DateTime? selectedDate,
    List<VehicleTypeItemEntity>? vehicleTypes,
    VehicleTypeItemEntity? selectedVehicleType,
  }) =>
      UpdateRouteState(
        fromAddress: fromAddress ?? this.fromAddress,
        toAddress: toAddress ?? this.toAddress,
        dateTime: dateTime ?? this.dateTime,
        addresses: addresses ?? this.addresses,
        getAddressesStatus: getAddressesStatus ?? this.getAddressesStatus,
        updateRouteStatus: updateRouteStatus ?? this.updateRouteStatus,
        selectedDate: selectedDate ?? this.selectedDate,
        vehicleTypes: vehicleTypes ?? this.vehicleTypes,
        selectedVehicleType: selectedVehicleType ?? this.selectedVehicleType,
      );

  @override
  List<Object?> get props => [
        fromAddress,
        toAddress,
        dateTime,
        addresses,
        getAddressesStatus,
        updateRouteStatus,
        selectedDate,
        vehicleTypes,
        selectedVehicleType,
      ];
}
