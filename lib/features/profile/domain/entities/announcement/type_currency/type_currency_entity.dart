import 'package:equatable/equatable.dart';

import '../../../../data/models/announcement/type_currency/type_currency_response.dart';

class TypeCurrencyEntity extends Equatable {
  final List<TypeCurrencyListEntity> currencyList;

  const TypeCurrencyEntity({
    required this.currencyList,
  });

  @override
  List<Object?> get props => [
        currencyList,
      ];
}

class TypeCurrencyListEntity extends Equatable {
  final String typeName;
  final String typeId;

  const TypeCurrencyListEntity({
    required this.typeName,
    required this.typeId,
  });

  @override
  List<Object?> get props => [
        typeName,
        typeId,
      ];
}

extension TypeCurrencyEntityX on TypeCurrencyResponse {
  TypeCurrencyEntity toEntity() => TypeCurrencyEntity(
        currencyList: data?.data?.response
                ?.map(
                  (typeCar) => TypeCurrencyListEntity(
                    typeName: typeCar.name ?? '',
                    typeId: typeCar.guid ?? '',
                  ),
                )
                .toList() ??
            [],
      );
}
