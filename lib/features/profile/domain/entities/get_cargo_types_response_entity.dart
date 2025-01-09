import 'package:equatable/equatable.dart';

import '../../data/models/get_cargo_types_response_model.dart';

class GetCargoTypesResponseEntity extends Equatable {
  const GetCargoTypesResponseEntity({
    required this.count,
    required this.cargoTypes,
  });

  final int count;
  final List<CargoTypeItem> cargoTypes;

  @override
  List<Object?> get props => [cargoTypes];
}

class CargoTypeItem {
  String? guid;
  String? name;

  CargoTypeItem({
    this.guid,
    this.name,
  });
}

extension GetCargoTypesResponseEntityX on GetCargoTypesResponseModel {
  GetCargoTypesResponseEntity toEntity() => GetCargoTypesResponseEntity(
        count: data?.data?.count ?? 0,
        cargoTypes: data?.data?.response
                ?.map(
                  (cargo) => CargoTypeItem(
                    guid: cargo.guid ?? '',
                    name: cargo.name ?? '',
                  ),
                )
                .toList() ??
            [],
      );
}
