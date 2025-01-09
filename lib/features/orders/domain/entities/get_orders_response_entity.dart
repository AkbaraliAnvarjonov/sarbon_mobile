import 'package:equatable/equatable.dart';

import '../../data/models/get_orders_response_model.dart';

class GetOrdersResponseEntity extends Equatable {
  const GetOrdersResponseEntity({
    required this.count,
    required this.orders,
  });

  final int count;
  final List<OrderItemEntity> orders;

  @override
  List<Object?> get props => [orders];
}

class OrderItemEntity {
  final String? addressId;
  final String? addressId2;
  final String? from;
  final String? to;
  final String? countryCodeFrom;
  final String? countryCodeTo;
  final List<String>? provisions;
  final OrderAddressDataEntity? addressDataEntity;
  final OrderAddressDataEntity? address2DataEntity;
  final OrderCurrencyDataEntity? currencyDataEntity;
  final OrderCompanyDataEntity? companyDataEntity;
  final VehicleDataEntity? vehicleDataEntity;
  final List<String>? statuses;
  final num? bidCash;
  final num? dimWithSpecial;
  final String? companyId;
  final String? clientName;
  final String? guid;
  final num? numberOfCars;
  final String? userId3;
  final num? volumeM3;
  final num? weight;
  final List<String>? whoCancellation;
  final num? rating;
  final String? indicateStatus;
  final String? cargoId;
  final bool? request;
  final String? cityName;
  final String? cityNameRu;
  final String? cityNameEn;
  final String? city2Name;
  final String? city2NameRu;
  final String? city2NameEn;
  final num? acceptedOffers;
  final String? distance;
  final String? carType;

  const OrderItemEntity({
    this.from,
    this.to,
    this.countryCodeFrom,
    this.countryCodeTo,
    this.addressId,
    this.provisions,
    this.addressId2,
    this.addressDataEntity,
    this.address2DataEntity,
    this.currencyDataEntity,
    this.companyDataEntity,
    this.vehicleDataEntity,
    this.statuses,
    this.bidCash,
    this.dimWithSpecial,
    this.companyId,
    this.clientName,
    this.guid,
    this.numberOfCars,
    this.volumeM3,
    this.weight,
    this.rating,
    this.indicateStatus,
    this.userId3,
    this.cargoId,
    this.request,
    this.cityName,
    this.cityNameRu,
    this.cityNameEn,
    this.city2Name,
    this.city2NameRu,
    this.city2NameEn,
    this.acceptedOffers,
    this.distance,
    this.whoCancellation,
    this.carType,
  });
}

class OrderAddressDataEntity {
  final String? addressId;
  final String? code;
  final String? guid;
  final String? name;
  final String? nameRu;
  final String? nameEn;
  final List<String>? type;

  const OrderAddressDataEntity({
    this.addressId,
    this.code,
    this.guid,
    this.name,
    this.nameRu,
    this.nameEn,
    this.type,
  });
}

class OrderCurrencyDataEntity {
  final String? code;
  final String? guid;
  final String? name;
  final String? photo;
  final String? shortName;

  const OrderCurrencyDataEntity({
    this.code,
    this.guid,
    this.name,
    this.photo,
    this.shortName,
  });
}

class OrderCompanyDataEntity {
  final String? aliasName;
  final List<String>? companyType;
  final String? fullName;
  final String? name;

  const OrderCompanyDataEntity({
    this.aliasName,
    this.companyType,
    this.fullName,
    this.name,
  });
}

class VehicleDataEntity {
  final String? name;
  final String? carNumber;

  const VehicleDataEntity({
    this.name,
    this.carNumber,
  });
}

extension GetOrdersResponseEntityX on GetOrdersResponseModel {
  GetOrdersResponseEntity toEntity() => GetOrdersResponseEntity(
        count: data?.data?.count ?? 0,
        orders: data?.data?.response
                ?.map(
                  (cargo) => OrderItemEntity(
                    from: cargo.cargoIdData?.from ?? '',
                    to: cargo.cargoIdData?.to ?? '',
                    countryCodeFrom: cargo.cargoIdData?.countryCodeFrom ?? '',
                    countryCodeTo: cargo.cargoIdData?.countryCodeTo ?? '',
                    addressId: cargo.addressId ?? '',
                    provisions: cargo.provisions ?? [],
                    addressId2: cargo.addressId2 ?? '',
                    rating: cargo.userId2Data?.rating ?? 0,
                    indicateStatus: cargo.indicateStatus?.firstOrNull ?? '',
                    userId3: cargo.usersId3 ?? '',
                    request: cargo.request ?? false,
                    city2Name: cargo.cityId2Data?.name ?? '',
                    city2NameRu: cargo.cityId2Data?.nameRu ?? '',
                    city2NameEn: cargo.cityId2Data?.nameEn ?? '',
                    cityName: cargo.cityIdData?.name ?? '',
                    cityNameRu: cargo.cityIdData?.nameRu ?? '',
                    cityNameEn: cargo.cityIdData?.nameEn ?? '',
                    acceptedOffers: cargo.cargoIdData?.acceptedOffers ?? 0,
                    distance: '${cargo.cargoIdData?.distance?.toInt()} км',
                    addressDataEntity: OrderAddressDataEntity(
                      addressId: cargo.addressIdData?.addressId ?? '',
                      code: cargo.addressIdData?.code ?? '',
                      guid: cargo.addressIdData?.guid ?? '',
                      name: cargo.addressIdData?.name ?? '',
                      nameRu: cargo.addressIdData?.nameRu ?? '',
                      nameEn: cargo.addressIdData?.nameEn ?? '',
                      type: cargo.addressIdData?.type ?? [],
                    ),
                    address2DataEntity: OrderAddressDataEntity(
                      addressId: cargo.addressId2Data?.addressId ?? '',
                      code: cargo.addressId2Data?.code ?? '',
                      guid: cargo.addressId2Data?.guid ?? '',
                      name: cargo.addressId2Data?.name ?? '',
                      nameRu: cargo.addressId2Data?.nameRu ?? '',
                      nameEn: cargo.addressId2Data?.nameEn ?? '',
                      type: cargo.addressId2Data?.type ?? [],
                    ),
                    currencyDataEntity: OrderCurrencyDataEntity(
                      code: cargo.currencyIdData?.code ?? '',
                      guid: cargo.currencyIdData?.guid ?? '',
                      name: cargo.currencyIdData?.name ?? '',
                      photo: cargo.currencyIdData?.photo ?? '',
                      shortName: cargo.currencyIdData?.shortName ?? '',
                    ),
                    vehicleDataEntity: VehicleDataEntity(
                      name: cargo.userId2Data?.carType ?? '',
                      carNumber: cargo.vehicleIdData?.carNumber ?? '',
                    ),
                    companyDataEntity: OrderCompanyDataEntity(
                      aliasName: cargo.companyIdData?.aliasName ?? '',
                      companyType: cargo.companyIdData?.companyType ?? [],
                      fullName: cargo.companyIdData?.fullName ?? '',
                      name: cargo.companyIdData?.name ?? '',
                    ),
                    statuses: cargo.statuses ?? [],
                    bidCash: cargo.cargoIdData?.bidCash ?? 0,
                    dimWithSpecial: cargo.dimWithSpecial ?? 0,
                    clientName: cargo.clientName ?? '',
                    guid: cargo.guid ?? '',
                    cargoId: cargo.cargoId ?? '',
                    numberOfCars: cargo.numberOfCars ?? 0,
                    volumeM3: cargo.cargoIdData?.volumeM3 ?? 0,
                    weight: cargo.cargoIdData?.weight ?? 0,
                    carType: cargo.cargoIdData?.carType ?? '',
                    whoCancellation: cargo.whoCancellation ?? [],
                  ),
                )
                .toList() ??
            [],
      );
}

String getIndicateStatusName(String status) {
  switch (status) {
    case 'no_status':
      return 'Нет статуса';
    case 'go_to_load':
      return 'Еду на загрузку';
    case 'wait_for_the_download':
      return 'Жду загрузку';
    case 'loading':
      return 'Загружаюсь';
    case 'go_to_unload':
      return 'Еду на разгрузку';
    case 'unloading':
      return 'Разгружаюсь';
    case 'unloaded':
      return 'Разгрузился';
    case 'breaking':
      return 'Поломка';
    case 'road_accident':
      return 'ДТП';
    default:
      return '';
  }
}
