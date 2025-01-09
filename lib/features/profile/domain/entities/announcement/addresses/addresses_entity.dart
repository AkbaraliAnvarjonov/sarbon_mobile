import 'package:equatable/equatable.dart';

import '../../../../data/models/announcement/addresses/get_addresses_response.dart';

class AddressesEntity extends Equatable {
  final List<AddressesListEntity> addressesList;

  const AddressesEntity({
    required this.addressesList,
  });

  @override
  List<Object?> get props => [
        addressesList,
      ];
}

class AddressesListEntity extends Equatable {
  final String addressName;
  final String addressId;
  final String guid;
  final String cityName;

  const AddressesListEntity({
    required this.addressName,
    required this.addressId,
    required this.guid,
    required this.cityName,
  });

  @override
  List<Object?> get props => [
        addressName,
        addressId,
        guid,
        cityName,
      ];
}

extension AddressesEntityX on GetAddressesResponse {
  AddressesEntity toEntity() => AddressesEntity(
        addressesList: data?.data?.response
                ?.map(
                  (typeCar) => AddressesListEntity(
                    cityName: typeCar.name ?? '',
                    addressId: typeCar.addressId ?? '',
                    guid: typeCar.guid ?? '',
                    addressName: typeCar.addressIdData?.name ?? '',
                  ),
                )
                .toList() ??
            [],
      );
}
