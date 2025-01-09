import 'package:equatable/equatable.dart';

import '../../../data/models/opposite_offer/get_vehicle_types_response_model.dart';

class GetVehicleTypesResponseEntity extends Equatable {
  const GetVehicleTypesResponseEntity({
    required this.count,
    required this.vehicleTypes,
  });

  final int count;
  final List<VehicleTypeItemEntity> vehicleTypes;

  @override
  List<Object?> get props => [vehicleTypes];
}

class VehicleTypeItemEntity {
  String? guid;
  String? name;
  String? carNumber;

  VehicleTypeItemEntity({
    this.guid,
    this.name,
    this.carNumber,
  });
}

extension GetVehicleTypesResponseEntityX on GetVehicleTypesResponseModel {
  GetVehicleTypesResponseEntity toEntity() => GetVehicleTypesResponseEntity(
        count: data?.data?.count ?? 0,
        vehicleTypes: data?.data?.response
                ?.map(
                  (vehicle) => VehicleTypeItemEntity(
                    guid: vehicle.guid ?? '',
                    name:
                        '${vehicle.brandIdData?.shortName ?? ''} ${vehicle.trailerTypeIdData?.name ?? ''}',
                    carNumber: vehicle.carNumber ?? '',
                  ),
                )
                .toList() ??
            [],
      );
}
