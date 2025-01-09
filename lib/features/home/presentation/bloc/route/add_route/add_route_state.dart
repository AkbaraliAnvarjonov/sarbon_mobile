part of 'add_route_bloc.dart';

class AddRouteState extends Equatable {
  const AddRouteState({
    this.fromAddress,
    this.toAddress,
    this.dateTime,
    this.addresses = const [],
    this.getAddressesStatus = ApiStatus.initial,
    this.createRouteStatus = ApiStatus.initial,
    this.vehicleTypes = const [],
    this.selectedVehicleType,
  });

  final SearchItem? fromAddress;
  final SearchItem? toAddress;
  final DateTime? dateTime;
  final List<AddressItemEntity> addresses;
  final ApiStatus getAddressesStatus;
  final ApiStatus createRouteStatus;
  final List<VehicleTypeItemEntity> vehicleTypes;
  final VehicleTypeItemEntity? selectedVehicleType;

  AddRouteState copyWith({
    SearchItem? fromAddress,
    SearchItem? toAddress,
    DateTime? dateTime,
    List<AddressItemEntity>? addresses,
    ApiStatus? getAddressesStatus,
    ApiStatus? createRouteStatus,
    List<VehicleTypeItemEntity>? vehicleTypes,
    VehicleTypeItemEntity? selectedVehicleType,
  }) =>
      AddRouteState(
        fromAddress: fromAddress ?? this.fromAddress,
        toAddress: toAddress ?? this.toAddress,
        dateTime: dateTime ?? this.dateTime,
        addresses: addresses ?? this.addresses,
        getAddressesStatus: getAddressesStatus ?? this.getAddressesStatus,
        createRouteStatus: createRouteStatus ?? this.createRouteStatus,
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
        createRouteStatus,
        vehicleTypes,
        selectedVehicleType,
      ];
}
