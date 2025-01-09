import 'package:equatable/equatable.dart';

import '../../data/models/get_order_details_response_model.dart';

class GetOrderDetailsResponseEntity extends Equatable {
  final String? addressId;
  final String? addressId2;
  final String? from;
  final String? to;
  final String? countryCodeFrom;
  final String? countryCodeTo;
  final String? carType;
  final String? paymentType;
  final String? currencyId;
  final String? usersId2;
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
  final List<String>? provisions;
  final String? bodyTypeId;
  final String? cargoTypeId;
  final String? comment;
  final String? date;
  final String? guid;
  final String? loadTime;
  final bool? asSoonAsA;
  final bool? asSoonAsB;
  final num? loadCapacity;
  final String? loadLocation;
  final String? measurementId;
  final num? numberOfCars;
  final num? acceptedOffers;
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
  final num? driverCash;
  final String? shortName;
  final String? requirements;
  final String? driverComment;
  final num? conditions;
  final String? currencyCode;
  final List<String>? addressIds;
  final List<String>? permission;
  final String? cityName;
  final String? cityNameRu;
  final String? cityNameEn;
  final String? city2Name;
  final String? city2NameRu;
  final String? city2NameEn;
  final String? distance;
  final String? file1;
  final String? file2;
  final String? file3;
  final String? file4;
  final String? file5;

  const GetOrderDetailsResponseEntity({
    this.addressId,
    this.provisions,
    this.addressId2,
    this.currencyId,
    this.from,
    this.to,
    this.countryCodeFrom,
    this.countryCodeTo,
    this.carType,
    this.paymentType,
    this.usersId2,
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
    this.date,
    this.guid,
    this.loadTime,
    this.loadCapacity,
    this.loadLocation,
    this.measurementId,
    this.numberOfCars,
    this.acceptedOffers,
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
    this.driverCash,
    this.shortName,
    this.requirements,
    this.driverComment,
    this.conditions,
    this.currencyCode,
    this.addressIds,
    this.permission,
    this.cityName,
    this.cityNameRu,
    this.cityNameEn,
    this.city2Name,
    this.city2NameRu,
    this.city2NameEn,
    this.distance,
    this.file1,
    this.file2,
    this.file3,
    this.file4,
    this.file5,
    this.asSoonAsA,
    this.asSoonAsB,
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
        acceptedOffers,
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
        driverCash,
        shortName,
        requirements,
        driverComment,
        currencyCode,
        addressIds,
        permission,
        cityName,
        city2Name,
        distance,
        file1,
        file2,
        file3,
        file4,
        file5,
        carType,
        provisions,
        usersId2,
      ];
}

class OrderAddressDetailsEntity {
  String? addressId;
  String? code;
  String? guid;
  String? name;
  String? nameRu;
  String? nameEn;
  List<String>? type;

  OrderAddressDetailsEntity({
    this.addressId,
    this.code,
    this.guid,
    this.name,
    this.nameRu,
    this.nameEn,
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

extension GetOrderDetailsResponseEntityX on GetOrderDetailsResponseModel {
  GetOrderDetailsResponseEntity? toEntity() {
    final OrderDetails? cargo = data?.data?.response?.isNotEmpty ?? false ? data?.data?.response?.first : null;
    print('object mana: ${cargo?.currencyId}');

    return data?.data?.response?.isNotEmpty ?? false
        ? GetOrderDetailsResponseEntity(
            from: cargo?.cargoIdData?.from ?? '',
            to: cargo?.cargoIdData?.to ?? '',
            countryCodeFrom: cargo?.cargoIdData?.countryCodeFrom ?? '',
            countryCodeTo: cargo?.cargoIdData?.countryCodeTo ?? '',
            carType: cargo?.cargoIdData?.carType ?? '',
            asSoonAsA:  cargo?.cargoIdData?.asSoonAsA ?? false,
            asSoonAsB: cargo?.cargoIdData?.asSoonAsB ?? false,
            paymentType: cargo?.cargoIdData?.paymentType ?? '',
            currencyId: cargo?.currencyId ?? '',
            addressId: cargo?.addressId ?? '',
            provisions: cargo?.provisions ?? [],
            addressId2: cargo?.addressId2 ?? '',
            indicationStatus: cargo?.indicateStatus?.firstOrNull ?? '',
            statuses: cargo?.cargoIdData?.orderStatus ?? [],
            cmr: cargo?.cmr ?? false,
            t1: cargo?.t1 ?? false,
            tir: cargo?.tir ?? false,
            driverCash: cargo?.offers ?? 0,
            shortName: cargo?.shortName ?? '',
            requirements: cargo?.paymentType?.firstOrNull ?? '',
            driverComment: cargo?.comment ?? '',
            conditions: cargo?.offers ?? 0,
            currencyCode: cargo?.currencyIdData?.code ?? '',
            addressIds: cargo?.addressIds ?? [],
            permission: _permissionView(cargo?.permission ?? []),
            cityName: cargo?.cityIdData?.name ?? '',
            cityNameRu: cargo?.cityIdData?.nameRu ?? '',
            cityNameEn: cargo?.cityIdData?.nameEn ?? '',
            city2Name: cargo?.cityId2Data?.name ?? '',
            city2NameRu: cargo?.cityId2Data?.nameRu ?? '',
            city2NameEn: cargo?.cityId2Data?.nameEn ?? '',
            file1: cargo?.file1 ?? '',
            file2: cargo?.file2 ?? '',
            file3: cargo?.file3 ?? '',
            file4: cargo?.file4 ?? '',
            file5: cargo?.file5 ?? '',
            distance: '${cargo?.cargoIdData?.distance?.toInt() ?? 0} км',
            addressDataEntity: OrderAddressDetailsEntity(
              addressId: cargo?.addressIdData?.addressId ?? '',
              code: cargo?.addressIdData?.code ?? '',
              guid: cargo?.addressIdData?.guid ?? '',
              name: cargo?.addressIdData?.name ?? '',
              nameRu: cargo?.addressIdData?.nameRu ?? '',
              nameEn: cargo?.addressIdData?.nameEn ?? '',
              type: cargo?.addressIdData?.type ?? [],
            ),
            address2DataEntity: OrderAddressDetailsEntity(
              addressId: cargo?.addressId2Data?.addressId ?? '',
              code: cargo?.addressId2Data?.code ?? '',
              guid: cargo?.addressId2Data?.guid ?? '',
              name: cargo?.addressId2Data?.name ?? '',
              nameRu: cargo?.addressId2Data?.nameRu ?? '',
              nameEn: cargo?.addressId2Data?.nameEn ?? '',
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
              bankDetails: cargo?.companyIdData?.bankDetails ?? '',
              buildingAddress: cargo?.companyIdData?.buildingAddress ?? '',
              companyDirection: cargo?.companyIdData?.companyDirection ?? [],
              companyType: cargo?.companyIdData?.companyType ?? [],
              email: cargo?.companyIdData?.email ?? '',
              fullName: cargo?.companyIdData?.fullName ?? '',
              guid: cargo?.companyIdData?.guid ?? '',
              name: cargo?.companyIdData?.name ?? '',
              phoneNumber: cargo?.phone ?? '',
              tin: cargo?.companyIdData?.tin ?? '',
              rating: cargo?.userId2Data?.rating ?? 0,
              rateInterest: cargo?.prePaymentPercentage ?? 0,
              rateInterestAfterCompletion: cargo?.paymentUnloading ?? 0,
              paymentType: cargo?.paymentType?.firstOrNull ?? '',
            ),
            cargoTypeDetailsData: OrderTypeDetailsData(
              name: cargo?.cargoIdData?.productType ?? '',
              guid: cargo?.cargoTypeIdData?.guid ?? '',
            ),
            bidCash: cargo?.cargoIdData?.bidCash ?? 0,
            dimWithSpecial: cargo?.dimWithSpecial ?? 0,
            // bargainType: cargo?.bargainType ?? [],
            bodyTypeId: cargo?.bodyTypeId ?? '',
            cargoTypeId: cargo?.cargoTypeId ?? '',
            comment: cargo?.cargoIdData?.comment ?? '',
            date: cargo?.cargoIdData?.date ?? '',
            guid: cargo?.guid ?? '',
            loadTime: cargo?.cargoIdData?.loadTime ?? '',
            loadCapacity: cargo?.loadCapacity ?? 0,
            loadLocation: cargo?.loadLocation ?? '',
            measurementId: cargo?.measurementId ?? '',
            numberOfCars: cargo?.cargoIdData?.numberOfCars ?? 0,
            acceptedOffers: cargo?.cargoIdData?.acceptedOffers ?? 0,
            // status: cargo?.status ?? [],
            unloadLocation: cargo?.unloadLocation ?? '',
            usersId: cargo?.usersId ?? '',
            usersId2: cargo?.usersId2 ?? '',
            usersId3: cargo?.usersId3 ?? '',
            volumeM3: cargo?.cargoIdData?.volumeM3 ?? 0,
            weight: cargo?.cargoIdData?.weight ?? 0,
            prePaymentPercentage: cargo?.prePaymentPercentage ?? 0,
            // paymentAfterLoading: cargo?.paymentAfterLoading ?? 0,
            hasAdditionalLoad: cargo?.loadAroundTheClock ?? false,
          )
        : null;
  }
}

class OrderAddressesPoint {
  final String addressName;

  // final String addressType;
  final String cargoStatus;
  final double lat;
  final double long;

  const OrderAddressesPoint({
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
