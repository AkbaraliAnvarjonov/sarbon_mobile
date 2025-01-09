import 'package:equatable/equatable.dart';

import '../../../../../core/extension/extension.dart';
import '../../../data/models/cargo_details/cargo_point_addresses_response.dart';

class CargoAddressesPointEntity extends Equatable {
  final List<GetCargoAddressesPointEntity> addresses;

  const CargoAddressesPointEntity({
    required this.addresses,
  });

  @override
  List<Object?> get props => [
        addresses,
      ];
}

class GetCargoAddressesPointEntity extends Equatable {
  final String addressName;
  final String addressType;
  final String cargoStatus;

  const GetCargoAddressesPointEntity({
    required this.addressName,
    required this.addressType,
    required this.cargoStatus,
  });

  @override
  List<Object?> get props => [
        addressName,
        addressType,
        cargoStatus,
      ];
}

extension CargoAddressesPointEntityX on CargoPointAddressesResponse {
  CargoAddressesPointEntity toEntity() => CargoAddressesPointEntity(
        addresses: data?.data?.data?.response
                ?.map(
                  (e) => GetCargoAddressesPointEntity(
                    addressName: e.name ?? '',
                    addressType: e.type?.first ?? '',
                    cargoStatus: 'unloading_status',
                  ),
                )
                .toList() ??
            [],
      );
}
