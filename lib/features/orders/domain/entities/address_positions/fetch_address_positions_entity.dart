import 'package:equatable/equatable.dart';

import '../../../data/models/address_position/fetch_address_position_response.dart';

class FetchAddressesPositionsListEntity extends Equatable {
final List<FetchAddressesPositionsEntity> addresses;

  const FetchAddressesPositionsListEntity({
    required this.addresses,
  });

  @override
  List<Object?> get props => [
        addresses,
      ];
}

class FetchAddressesPositionsEntity extends Equatable {
  final String addressType;
  final double lat;
  final double long;

  const FetchAddressesPositionsEntity({
    required this.addressType,
    required this.lat,
    required this.long,
  });

  @override
  List<Object?> get props => [
        addressType,
        lat,
        long,
      ];
}

extension FetchAddressesPositionsListEntityX on FetchAddressPositionResponse {
  FetchAddressesPositionsListEntity toEntity() =>
      FetchAddressesPositionsListEntity(
        addresses: data?.data?.response
                ?.map(
                  (e) => FetchAddressesPositionsEntity(
                    addressType: e.name ?? '',
                    lat: (e.lat ?? 0).toDouble(),
                    long: (e.long ?? 0).toDouble(),
                  ),
                )
                .toList() ??
            [],
      );
}
