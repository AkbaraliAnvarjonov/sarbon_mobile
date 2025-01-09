import 'package:equatable/equatable.dart';

import '../../../../data/models/notification/get_order_by_notification/fetch_address_position_notification_response.dart';

class FetchAddressesPositionsNotificationEntity extends Equatable {
  final List<FetchListPositionsEntity> addresses;

  const FetchAddressesPositionsNotificationEntity({
    required this.addresses,
  });

  @override
  List<Object?> get props => [
        addresses,
      ];
}

class FetchListPositionsEntity extends Equatable {
  final String addressType;
  final double lat;
  final double long;

  const FetchListPositionsEntity({
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

extension FetchAddressesPositionsListEntityX
    on FetchAddressPositionNotificationResponse {
  FetchAddressesPositionsNotificationEntity toEntity() =>
      FetchAddressesPositionsNotificationEntity(
        addresses: data?.data?.response
                ?.map(
                  (e) => FetchListPositionsEntity(
                    addressType: e.name ?? '',
                    lat: (e.lat ?? 0).toDouble(),
                    long: (e.long ?? 0).toDouble(),
                  ),
                )
                .toList() ??
            [],
      );
}
