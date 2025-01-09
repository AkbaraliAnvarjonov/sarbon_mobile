import 'package:equatable/equatable.dart';

import '../../../data/models/types_cargo/types_cargo_response.dart';

class TypesCargoEntity extends Equatable {
  const TypesCargoEntity({
    required this.data,
  });

  final List<TypeCargoListEntity> data;

  @override
  List<Object?> get props => [data];
}

class TypeCargoListEntity extends Equatable {
  const TypeCargoListEntity({
    required this.guid,
    required this.name,
  });

  final String guid;
  final String name;

  @override
  List<Object?> get props => [guid, name];
}

extension TypesCargoEntityX on TypesCargoResponse {
  TypesCargoEntity toEntity() => TypesCargoEntity(
        data: data?.data?.response
                ?.map(
                  (address) => TypeCargoListEntity(
                    guid: address.guid ?? '',
                    name: address.name ?? '',
                  ),
                )
                .toList() ??
            [],
      );
}
