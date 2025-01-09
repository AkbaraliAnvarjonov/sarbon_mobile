import 'package:equatable/equatable.dart';

import '../../../../data/models/notification/get_order_by_notification/get_addresses_by_notification.dart';

class GetDetailAddressesByNotificationEntity extends Equatable {
  final List<GetAddressesListDetailEntity> addresses;

  const GetDetailAddressesByNotificationEntity({
    required this.addresses,
  });

  @override
  List<Object?> get props => [
        addresses,
      ];
}

class GetAddressesListDetailEntity extends Equatable {
  final String addressName;
  final String addressType;
  final String cargoStatus;

  const GetAddressesListDetailEntity({
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

extension GetAddressesListResponseEntityX on GetDetailAddressesByNotification {
  GetDetailAddressesByNotificationEntity toEntity() =>
      GetDetailAddressesByNotificationEntity(
        addresses: data?.data?.data?.response
                ?.map(
                  (e) => GetAddressesListDetailEntity(
                    addressName: e.name ?? '',
                    addressType: e.type?.first ?? '',
                    cargoStatus: 'выгрузка',
                  ),
                )
                .toList() ??
            [],
      );
}
