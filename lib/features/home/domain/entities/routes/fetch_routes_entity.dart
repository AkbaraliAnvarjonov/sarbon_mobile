import 'package:equatable/equatable.dart';

import '../../../data/models/route/fetch_routes/fetch_routes_response.dart';

class FetchRoutesEntity extends Equatable {
  final List<RouteEntity> routes;

  const FetchRoutesEntity({required this.routes});

  @override
  List<Object?> get props => [routes];
}

class RouteEntity extends Equatable {
  final String guid;
  final String date;
  final String capacity;
  final String volume;
  final String carNumber;
  final String vehicleId;
  final AddressForRouteEntity fromAddress;
  final AddressForRouteEntity toAddress;

  const RouteEntity({
    required this.guid,
    required this.date,
    required this.capacity,
    required this.volume,
    required this.fromAddress,
    required this.toAddress,
    required this.carNumber,
    required this.vehicleId,
  });

  @override
  List<Object?> get props => [
        guid,
        date,
        capacity,
        volume,
        fromAddress,
        toAddress,
        carNumber,
        vehicleId,
      ];
}

class AddressForRouteEntity extends Equatable {
  final String addressId;
  final String addressName;
  final String addressNameRu;
  final String addressNameEn;
  final String cityId;
  final String cityName;
  final String cityNameRu;
  final String cityNameEn;

  const AddressForRouteEntity({
    required this.addressId,
    required this.addressName,
    required this.addressNameEn,
    required this.addressNameRu,
    required this.cityId,
    required this.cityName,
    required this.cityNameEn,
    required this.cityNameRu,
  });

  @override
  List<Object?> get props => [
        addressId,
        addressName,
        addressNameRu,
        addressNameEn,
        cityId,
        cityName,
        cityNameRu,
        cityNameEn,
      ];
}

extension FetchRoutesEntityX on FetchRoutesResponse {
  FetchRoutesEntity toEntity() => FetchRoutesEntity(
        routes: data?.data?.response
                ?.map(
                  (e) => RouteEntity(
                    guid: e.guid ?? '',
                    date: e.date ?? '',
                    capacity: (e.capacity ?? 0).toString(),
                    volume: (e.volume ?? 0).toString(),
                    carNumber: e.vehicleIdData?.carNumber ?? '',
                    vehicleId: e.vehicleIdData?.guid ?? '',
                    toAddress: AddressForRouteEntity(
                      addressId: e.addressId2Data?.guid ?? '',
                      addressName: e.addressId2Data?.name ?? '',
                      addressNameRu: e.addressId2Data?.nameRu ?? '',
                      addressNameEn: e.addressId2Data?.nameEn ?? '',
                      cityName: e.cityId2Data?.name ?? '',
                      cityNameRu: e.cityId2Data?.nameRu ?? '',
                      cityNameEn: e.cityId2Data?.nameEn ?? '',
                      cityId: e.cityId2Data?.guid ?? '',
                    ),
                    fromAddress: AddressForRouteEntity(
                      addressId: e.addressIdData?.guid ?? '',
                      addressName: e.addressIdData?.name ?? '',
                      addressNameRu: e.addressIdData?.nameRu ?? '',
                      addressNameEn: e.addressIdData?.nameEn ?? '',
                      cityName: e.cityIdData?.name ?? '',
                      cityNameRu: e.cityIdData?.nameRu ?? '',
                      cityNameEn: e.cityIdData?.nameEn ?? '',
                      cityId: e.cityIdData?.guid ?? '',
                    ),
                  ),
                )
                .toList() ??
            [],
      );
}
