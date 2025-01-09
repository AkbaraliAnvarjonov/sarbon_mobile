import 'package:equatable/equatable.dart';

import '../../../../data/models/announcement/type_car/type_cars_response.dart';

class TypeCarsEntity extends Equatable {
  final List<TypeCarsListEntity> typeCarsList;

  const TypeCarsEntity({
    required this.typeCarsList,
  });

  @override
  List<Object?> get props => [
        typeCarsList,
      ];
}

class TypeCarsListEntity extends Equatable {
  final String typeName;
  final String typeId;

  const TypeCarsListEntity({
    required this.typeName,
    required this.typeId,
  });

  @override
  List<Object?> get props => [
        typeName,
        typeId,
      ];
}

extension TypeCarsEntityX on TypeCarsResponse {
  TypeCarsEntity toEntity() => TypeCarsEntity(
        typeCarsList: data?.data?.response
                ?.map(
                  (typeCar) => TypeCarsListEntity(
                    typeName: typeCar.name ?? '',
                    typeId: typeCar.guid ?? '',
                  ),
                )
                .toList() ??
            [],
      );
}
