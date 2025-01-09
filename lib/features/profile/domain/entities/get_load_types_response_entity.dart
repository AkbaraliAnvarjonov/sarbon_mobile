import 'package:equatable/equatable.dart';

import '../../data/models/get_load_types_response_model.dart';

class GetLoadTypesResponseEntity extends Equatable {
  const GetLoadTypesResponseEntity({
    required this.count,
    required this.loadTypes,
  });

  final int count;
  final List<LoadTypeItem> loadTypes;

  @override
  List<Object?> get props => [loadTypes];
}

class LoadTypeItem {
  List<String>? cargoIds;
  String? guid;
  String? name;
  List<String>? vehicleIds;

  LoadTypeItem({
    this.cargoIds,
    this.guid,
    this.name,
    this.vehicleIds,
  });
}

extension GetLoadTypesResponseEntityX on GetLoadTypesResponseModel {
  GetLoadTypesResponseEntity toEntity() => GetLoadTypesResponseEntity(
        count: data?.data?.count ?? 0,
        loadTypes: data?.data?.response
                ?.map(
                  (load) => LoadTypeItem(
                    guid: load.guid ?? '',
                    name: load.name ?? '',
                    // cargoIds: load.cargoIds ?? [],
                    // vehicleIds: load.vehicleIds ?? [],
                  ),
                )
                .toList() ??
            [],
      );
}
