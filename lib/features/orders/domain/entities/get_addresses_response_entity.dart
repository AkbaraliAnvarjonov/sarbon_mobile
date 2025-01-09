import 'package:equatable/equatable.dart';

import '../../data/models/get_addresses_response.dart';

class GetDetailAddressesListResponseEntity extends Equatable {
  final List<GetAddressesDetailEntity> addresses;

  const GetDetailAddressesListResponseEntity({
    required this.addresses,
  });

  @override
  List<Object?> get props => [
        addresses,
      ];
}

class GetAddressesDetailEntity extends Equatable {
  final String addressName;
  final String addressType;
  final String cargoStatus;

  const GetAddressesDetailEntity({
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

extension GetAddressesListResponseEntityX on GetDetailAddressesResponse {
  GetDetailAddressesListResponseEntity toEntity() => GetDetailAddressesListResponseEntity(
        addresses: data?.data?.data?.response
            ?.map(
              (e) => GetAddressesDetailEntity(
                addressName: e.name ?? '',
                addressType: e.type?.first ?? '',
                cargoStatus: 'выгрузка',
              ),
            )
            .toList() ?? [],
      );
}
