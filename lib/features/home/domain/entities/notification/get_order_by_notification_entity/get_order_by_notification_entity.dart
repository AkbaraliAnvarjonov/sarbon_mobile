import 'package:equatable/equatable.dart';

import '../../../../data/models/notification/get_order_by_notification/get_order_by_notification.dart';

class GetOrderByNotificationEntity extends Equatable {
  final String? addressId;
  final String? addressId2;
  final OrderAddressDetailsEntity? addressDataEntity;
  final OrderAddressDetailsEntity? address2DataEntity;
  final OrderCurrencyDetailsEntity? currencyDataEntity;
  final OrderCompanyDetailsEntity? companyDataEntity;
  final OrderVehicleDetailsEntity? vehicleDataEntity;
  final OrderTypeDetailsData? cargoTypeDetailsData;
  final List<String>? statuses;
  final num? bidCash;
  final num? dimWithSpecial;
  final String? companyId;
  final List<String>? bargainType;
  final String? bodyTypeId;
  final String? cargoTypeId;
  final String? comment;
  final List<String>? conditions;
  final String? date;
  final String? guid;
  final String? cargoId;
  final String? loadTime;
  final num? loadCapacity;
  final String? loadLocation;
  final String? measurementId;
  final int? numberOfCars;
  final List<String>? status;
  final String? unloadLocation;
  final String? usersId;
  final String? usersId3;
  final num? volumeM3;
  final num? weight;
  final num? prePaymentPercentage;
  final num? paymentAfterLoading;
  final bool? hasAdditionalLoad;
  final String? indicationStatus;
  final bool? cmr;
  final bool? t1;
  final bool? tir;
  final String? provisions;
  final String? distance;
  final List<String>? permission;

  const GetOrderByNotificationEntity({
    this.addressId,
    this.addressId2,
    this.addressDataEntity,
    this.address2DataEntity,
    this.currencyDataEntity,
    this.companyDataEntity,
    this.vehicleDataEntity,
    this.cargoTypeDetailsData,
    this.statuses,
    this.bidCash,
    this.dimWithSpecial,
    this.companyId,
    this.bargainType,
    this.bodyTypeId,
    this.cargoTypeId,
    this.comment,
    this.conditions,
    this.date,
    this.guid,
    this.cargoId,
    this.loadTime,
    this.loadCapacity,
    this.loadLocation,
    this.measurementId,
    this.numberOfCars,
    this.status,
    this.unloadLocation,
    this.usersId,
    this.usersId3,
    this.volumeM3,
    this.weight,
    this.prePaymentPercentage,
    this.paymentAfterLoading,
    this.hasAdditionalLoad,
    this.indicationStatus,
    this.cmr,
    this.t1,
    this.tir,
    this.provisions,
    this.distance,
    this.permission,
  });

  @override
  List<Object?> get props => [
        addressId,
        addressId2,
        addressDataEntity,
        address2DataEntity,
        currencyDataEntity,
        companyDataEntity,
        vehicleDataEntity,
        cargoTypeDetailsData,
        statuses,
        cargoId,
        bidCash,
        dimWithSpecial,
        companyId,
        bargainType,
        bodyTypeId,
        cargoTypeId,
        comment,
        conditions,
        date,
        guid,
        loadTime,
        loadCapacity,
        loadLocation,
        measurementId,
        numberOfCars,
        status,
        unloadLocation,
        usersId,
        usersId3,
        volumeM3,
        weight,
        prePaymentPercentage,
        paymentAfterLoading,
        hasAdditionalLoad,
        indicationStatus,
        cmr,
        t1,
        tir,
        provisions,
        distance,
        permission,
      ];
}

class OrderAddressDetailsEntity {
  String? addressId;
  String? code;
  String? guid;
  String? name;
  List<String>? type;

  OrderAddressDetailsEntity({
    this.addressId,
    this.code,
    this.guid,
    this.name,
    this.type,
  });
}

class OrderCurrencyDetailsEntity {
  String? code;
  String? guid;
  String? name;
  String? photo;
  String? shortName;

  OrderCurrencyDetailsEntity({
    this.code,
    this.guid,
    this.name,
    this.photo,
    this.shortName,
  });
}

class OrderCompanyDetailsEntity {
  String? addressId;
  String? aliasName;
  String? bankDetails;
  String? buildingAddress;
  List<String>? companyDirection;
  List<String>? companyType;
  String? email;
  String? fullName;
  String? guid;
  String? name;
  String? phoneNumber;
  String? photoUrl;
  String? tin;
  num? rating;
  num? rateInterest;
  num? rateInterestAfterCompletion;
  String? paymentType;

  OrderCompanyDetailsEntity({
    this.addressId,
    this.aliasName,
    this.bankDetails,
    this.buildingAddress,
    this.companyDirection,
    this.companyType,
    this.email,
    this.fullName,
    this.guid,
    this.name,
    this.phoneNumber,
    this.photoUrl,
    this.tin,
    this.rating,
    this.rateInterest,
    this.rateInterestAfterCompletion,
    this.paymentType,
  });
}

class OrderVehicleDetailsEntity {
  List<String>? cargoIds;
  String? guid;
  String? name;

  // String? vehicleDetailsType;

  OrderVehicleDetailsEntity({
    this.cargoIds,
    this.guid,
    this.name,
    // this.vehicleDetailsType,
  });
}

class OrderTypeDetailsData {
  String? guid;
  String? name;

  OrderTypeDetailsData({
    this.guid,
    this.name,
  });
}

extension GetOrderDetailsResponseEntityX
    on GetOrderByNotificationResponseModel {
  GetOrderByNotificationEntity? toEntity() {
    final OrderDetails? cargo = data?.data?.response?.isNotEmpty ?? false
        ? data?.data?.response?.first
        : null;
    return data?.data?.response?.isNotEmpty ?? false
        ? GetOrderByNotificationEntity(
            addressId: cargo?.addressId ?? '',
            addressId2: cargo?.addressId2 ?? '',
            indicationStatus: cargo?.indicateStatus?.firstOrNull ?? '',
            statuses: cargo?.statuses ?? [],
            cmr: cargo?.cmr ?? false,
            t1: cargo?.t1 ?? false,
            tir: cargo?.tir ?? false,
            provisions: cargo?.provisions?.firstOrNull ?? '',
            distance: '${cargo?.distance ?? ''} км',
            permission: _permissionView(cargo?.permission ?? []),
            addressDataEntity: OrderAddressDetailsEntity(
              addressId: cargo?.addressIdData?.addressId ?? '',
              code: cargo?.addressIdData?.code ?? '',
              guid: cargo?.addressIdData?.guid ?? '',
              name: cargo?.addressIdData?.name ?? '',
              type: cargo?.addressIdData?.type ?? [],
            ),
            address2DataEntity: OrderAddressDetailsEntity(
              addressId: cargo?.addressId2Data?.addressId ?? '',
              code: cargo?.addressId2Data?.code ?? '',
              guid: cargo?.addressId2Data?.guid ?? '',
              name: cargo?.addressId2Data?.name ?? '',
              type: cargo?.addressId2Data?.type ?? [],
            ),
            currencyDataEntity: OrderCurrencyDetailsEntity(
              code: cargo?.currencyIdData?.code ?? '',
              guid: cargo?.currencyIdData?.guid ?? '',
              name: cargo?.currencyIdData?.name ?? '',
              photo: cargo?.currencyIdData?.photo ?? '',
              shortName: cargo?.currencyIdData?.shortName ?? '',
            ),
            vehicleDataEntity: OrderVehicleDetailsEntity(
              // cargoIds: cargo?.vehicleTypeIdData?.cargoIds ?? [],
              guid: cargo?.vehicleTypeIdData?.guid ?? '',
              name: cargo?.vehicleTypeIdData?.name ?? '',
              // vehicleDetailsType:
              //     cargo?.vehicleTypeIdData?.vehicleDetailsType ?? '',
            ),
            companyId: cargo?.companyId,
            companyDataEntity: OrderCompanyDetailsEntity(
              addressId: cargo?.companyIdData?.addressId ?? '',
              aliasName: cargo?.companyIdData?.aliasName ?? '',
              bankDetails: cargo?.companyIdData?.bankDetails ?? '',
              buildingAddress: cargo?.companyIdData?.buildingAddress ?? '',
              companyDirection: cargo?.companyIdData?.companyDirection ?? [],
              companyType: cargo?.companyIdData?.companyType ?? [],
              email: cargo?.companyIdData?.email ?? '',
              fullName: cargo?.companyIdData?.fullName ?? '',
              guid: cargo?.companyIdData?.guid ?? '',
              name: cargo?.companyIdData?.name ?? '',
              phoneNumber: cargo?.companyIdData?.phoneNumber ?? '',
              photoUrl: cargo?.companyIdData?.photoUrl ?? '',
              tin: cargo?.companyIdData?.tin ?? '',
              rating: cargo?.usersId3Data?.rating ?? 0,
              rateInterest: cargo?.prePaymentPercentage ?? 0,
              rateInterestAfterCompletion: cargo?.paymentUnloading ?? 0,
              paymentType: cargo?.mapIdData?.paymentType ?? '',
            ),
            cargoTypeDetailsData: OrderTypeDetailsData(
              name: cargo?.cargoTypeIdData?.name ?? '',
              guid: cargo?.cargoTypeIdData?.guid ?? '',
            ),
            bidCash: cargo?.bidCash ?? 0,
            dimWithSpecial: cargo?.dimWithSpecial ?? 0,
            // bargainType: cargo?.bargainType ?? [],
            bodyTypeId: cargo?.bodyTypeId ?? '',
            cargoTypeId: cargo?.cargoTypeId ?? '',
            comment: cargo?.comment ?? '',
            // conditions: cargo?.conditions ?? [],
            date: cargo?.date ?? '',
            guid: cargo?.guid ?? '',
            cargoId: cargo?.cargoId ?? '',
            loadTime: cargo?.loadTime ?? '',
            loadCapacity: cargo?.loadCapacity ?? 0,
            loadLocation: cargo?.loadLocation ?? '',
            measurementId: cargo?.measurementId ?? '',
            numberOfCars: cargo?.numberOfCars ?? 0,
            // status: cargo?.status ?? [],
            unloadLocation: cargo?.unloadLocation ?? '',
            usersId: cargo?.usersId ?? '',
            usersId3: cargo?.usersId3 ?? '',
            volumeM3: cargo?.volumeM3 ?? 0,
            weight: cargo?.weight ?? 0,
            prePaymentPercentage: cargo?.prePaymentPercentage ?? 0,
            // paymentAfterLoading: cargo?.paymentAfterLoading ?? 0,
            hasAdditionalLoad: cargo?.loadAroundTheClock ?? false,
          )
        : null;
  }
}

class OrderAddressesByNotificationPoint {
  final String addressName;

  // final String addressType;
  final String cargoStatus;
  final double lat;
  final double long;

  const OrderAddressesByNotificationPoint({
    required this.addressName,
    // required this.addressType,
    required this.cargoStatus,
    required this.lat,
    required this.long,
  });
}

List<String> _permissionView(List<String> adr) {
  if (adr.isEmpty) return [];
  switch (adr.first) {
    case 'adr_1':
      return ['ADR 1'];
    case 'adr_2':
      return ['ADR 2'];
    case 'adr_3':
      return ['ADR 3'];
    case 'adr_4':
      return ['ADR 4'];
    case 'adr_5':
      return ['ADR 5'];
    case 'adr_6':
      return ['ADR 6'];
    case 'adr_7':
      return ['ADR 7'];
    case 'adr_8':
      return ['ADR 8'];
    case 'adr_9':
      return ['ADR 9'];
  }
  return [];
}