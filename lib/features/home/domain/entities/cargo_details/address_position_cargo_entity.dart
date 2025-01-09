import 'package:equatable/equatable.dart';

import '../../../data/models/address_position/addres_positions_cargo.dart';

class FetchAddressesPositionsCargoEntity extends Equatable {
  final List<FetchListPositionsEntity> addresses;

  const FetchAddressesPositionsCargoEntity({
    required this.addresses,
  });

  @override
  List<Object?> get props => [
        addresses,
      ];
}

class FetchListPositionsEntity extends Equatable {
  final String addressType;
  final String type;
  final double lat;
  final double long;

  const FetchListPositionsEntity({
    required this.addressType,
    required this.type,
    required this.lat,
    required this.long,
  });

  @override
  List<Object?> get props => [
        addressType,
        lat,
        long,
        type,
      ];
}

extension FetchAddressesPositionsListEntityX on FetchAddressPositionCargoResponse {
  FetchAddressesPositionsCargoEntity toEntity() => FetchAddressesPositionsCargoEntity(
        addresses: data?.data?.response
                ?.map(
                  (e) => FetchListPositionsEntity(
                    addressType: e.name ?? '',
                    type: e.type ?? '',
                    lat: (e.lat ?? 0).toDouble(),
                    long: (e.long ?? 0).toDouble(),
                  ),
                )
                .toList() ??
            [],
      );
}
