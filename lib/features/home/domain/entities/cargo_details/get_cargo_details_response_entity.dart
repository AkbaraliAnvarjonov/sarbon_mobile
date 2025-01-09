import 'package:equatable/equatable.dart';

import '../../../data/models/cargo_details/get_cargo_details_response_model.dart';

class GetCargoDetailsResponseEntity extends Equatable {
  final String? addressId;
  final String? addressId2;
  final String? countryCodeFrom;
  final String? countryCodeTo;
  final AddressDetailsEntity? addressDataEntity;
  final AddressDetailsEntity? address2DataEntity;
  final CurrencyDetailsEntity? currencyDataEntity;
  final CargoCompanyDetailsEntity? companyDataEntity;
  final VehicleDetailsEntity? vehicleDataEntity;
  final CargoTypeDetailsData? cargoTypeDetailsData;
  final List<String>? statuses;
  final num? bidCash;
  final String? paymentType;
  final num? dimWithSpecial;
  final String? companyId;
  final List<String>? bargainType;
  final String? bodyTypeId;
  final String? cargoTypeId;
  final String? comment;
  final List<String>? conditions;
  final String? date;
  final String? guid;
  final String? loadTime;
  final bool? asSoonAsA;
  final bool? asSoonAsB;
  final num? loadCapacity;
  final String? loadLocation;
  final String? measurementId;
  final int? numberOfCars;
  final List<String>? status;
  final String? unloadLocation;
  final String? usersId;
  final num? volumeM3;
  final num? weight;
  final num? prePaymentPercentage;
  final num? paymentAfterLoading;
  final bool? hasAdditionalLoad;
  final bool? cmr;
  final bool? t1;
  final bool? tir;
  final List<String>? addressIds;
  final List<String>? permission;
  final String? cityName;
  final String? cityNameRu;
  final String? cityNameEn;
  final String? city2Name;
  final String? city2NameRu;
  final String? city2NameEn;
  final String? distance;
  final String? firmId;
  final bool? noHaggling;

  const GetCargoDetailsResponseEntity({
    this.addressId,
    this.addressId2,
    this.firmId,
    this.asSoonAsA,
    this.asSoonAsB,
    this.countryCodeFrom,
    this.countryCodeTo,
    this.addressDataEntity,
    this.address2DataEntity,
    this.currencyDataEntity,
    this.companyDataEntity,
    this.vehicleDataEntity,
    this.cargoTypeDetailsData,
    this.statuses,
    this.bidCash,
    this.paymentType,
    this.dimWithSpecial,
    this.companyId,
    this.bargainType,
    this.bodyTypeId,
    this.cargoTypeId,
    this.comment,
    this.conditions,
    this.date,
    this.guid,
    this.loadTime,
    this.loadCapacity,
    this.loadLocation,
    this.measurementId,
    this.numberOfCars,
    this.status,
    this.unloadLocation,
    this.usersId,
    this.volumeM3,
    this.weight,
    this.prePaymentPercentage,
    this.paymentAfterLoading,
    this.hasAdditionalLoad,
    this.cmr,
    this.t1,
    this.tir,
    this.addressIds,
    this.permission,
    this.cityName,
    this.cityNameRu,
    this.cityNameEn,
    this.city2Name,
    this.city2NameRu,
    this.city2NameEn,
    this.distance,
    this.noHaggling,
  });

  @override
  List<Object?> get props => [
        addressId,
        addressId2,
        countryCodeFrom,
        countryCodeTo,
        addressDataEntity,
        address2DataEntity,
        currencyDataEntity,
        companyDataEntity,
        vehicleDataEntity,
        cargoTypeDetailsData,
        statuses,
        bidCash,
        paymentType,
        firmId,
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
        volumeM3,
        weight,
        prePaymentPercentage,
        paymentAfterLoading,
        hasAdditionalLoad,
        cmr,
        t1,
        tir,
        addressIds,
        permission,
        cityName,
        cityNameRu,
        cityNameEn,
        city2Name,
        city2NameRu,
        city2NameEn,
        distance,
        noHaggling,
      ];
}

class AddressDetailsEntity {
  String? addressId;
  String? code;
  String? guid;
  String? name;
  String? nameRu;
  String? nameEn;
  List<String>? type;

  AddressDetailsEntity({
    this.addressId,
    this.code,
    this.guid,
    this.name,
    this.nameRu,
    this.nameEn,
    this.type,
  });
}

class CurrencyDetailsEntity {
  String? code;
  String? guid;
  String? name;
  String? photo;
  String? shortName;

  CurrencyDetailsEntity({
    this.code,
    this.guid,
    this.name,
    this.photo,
    this.shortName,
  });
}

class CargoCompanyDetailsEntity {
  String? addressId;
  String? aliasName;
  String? bankDetails;
  String? buildingAddress;
  List<String>? companyDirection;
  String? companyType;
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

  CargoCompanyDetailsEntity({
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

class VehicleDetailsEntity {
  List<String>? cargoIds;
  String? guid;
  String? name;
  String? vehicleDetailsType;

  VehicleDetailsEntity({
    this.cargoIds,
    this.guid,
    this.name,
    this.vehicleDetailsType,
  });
}

class CargoTypeDetailsData {
  String? guid;
  String? name;

  CargoTypeDetailsData({
    this.guid,
    this.name,
  });
}

extension GetCargoDetailsResponseEntityX on GetCargoDetailsResponseModel {
  GetCargoDetailsResponseEntity? toEntity() {
    final CargoDetails? cargo = data?.data?.response?.isNotEmpty ?? false ? data?.data?.response?.first : null;
    return data?.data?.response?.isNotEmpty ?? false
        ? GetCargoDetailsResponseEntity(
            addressId: cargo?.addressId ?? '',
            addressId2: cargo?.addressId2 ?? '',
            firmId: cargo?.firmId ?? '',
            asSoonAsA: cargo?.asSoonAsA ?? false,
            asSoonAsB: cargo?.asSoonAsB ?? false,
            countryCodeTo: cargo?.countryCodeTo ?? '',
            countryCodeFrom: cargo?.countryCodeFrom ?? '',
            cmr: cargo?.cmr ?? false,
            t1: cargo?.t1 ?? false,
            tir: cargo?.tir ?? false,
            distance: '${cargo?.distance?.toInt() ?? ''} км',
            permission: _permissionView(cargo?.permission ?? []),
            addressIds: cargo?.addressIds ?? [],
            cityName: cargo?.cityIdData?.name ?? '',
            cityNameRu: cargo?.cityIdData?.nameRu ?? '',
            cityNameEn: cargo?.cityIdData?.nameEn ?? '',
            city2Name: cargo?.cityId2Data?.name ?? '',
            city2NameRu: cargo?.cityId2Data?.nameRu ?? '',
            city2NameEn: cargo?.cityId2Data?.nameEn ?? '',
            noHaggling: cargo?.noHaggling ?? false,
            addressDataEntity: AddressDetailsEntity(
              addressId: cargo?.addressIdData?.addressId ?? '',
              code: cargo?.addressIdData?.code ?? '',
              guid: cargo?.addressIdData?.guid ?? '',
              name: cargo?.addressIdData?.name ?? '',
              nameRu: cargo?.addressIdData?.nameRu ?? '',
              nameEn: cargo?.addressIdData?.nameEn ?? '',
              type: cargo?.addressIdData?.type ?? [],
            ),
            address2DataEntity: AddressDetailsEntity(
              addressId: cargo?.addressId2Data?.addressId ?? '',
              code: cargo?.addressId2Data?.code ?? '',
              guid: cargo?.addressId2Data?.guid ?? '',
              name: cargo?.addressId2Data?.name ?? '',
              nameRu: cargo?.addressId2Data?.nameRu ?? '',
              nameEn: cargo?.addressId2Data?.nameEn ?? '',
              type: cargo?.addressId2Data?.type ?? [],
            ),
            currencyDataEntity: CurrencyDetailsEntity(
              code: cargo?.currencyIdData?.code ?? '',
              guid: cargo?.currencyIdData?.guid ?? '',
              name: cargo?.currencyIdData?.name ?? '',
              photo: cargo?.currencyIdData?.photo ?? '',
              shortName: cargo?.currencyIdData?.shortName ?? '',
            ),
            vehicleDataEntity: VehicleDetailsEntity(
              // cargoIds: cargo?.vehicleTypeIdData?.cargoIds ?? [],
              guid: cargo?.vehicleTypeIdData?.guid ?? '',
              name: cargo?.vehicleTypeIdData?.name ?? '',
              vehicleDetailsType: cargo?.vehicleTypeIdData?.vehicleDetailsType ?? '',
            ),
            companyDataEntity: CargoCompanyDetailsEntity(
              bankDetails: cargo?.companyIdData?.bankDetails ?? '',
              buildingAddress: cargo?.companyIdData?.buildingAddress ?? '',
              companyDirection: cargo?.companyIdData?.companyDirection ?? [],
              companyType: cargo?.companyIdData?.companyType?.first ?? '',
              email: cargo?.companyIdData?.email ?? '',
              fullName: cargo?.companyIdData?.fullName ?? '',
              guid: cargo?.companyIdData?.guid ?? '',
              name: cargo?.companyIdData?.name ?? '',
              phoneNumber: cargo?.companyIdData?.phoneNumber ?? '',
              tin: cargo?.companyIdData?.tin ?? '',
              rating: cargo?.usersIdData?.rating ?? 0,
              rateInterest: cargo?.prePaymentPercentage ?? 0,
              rateInterestAfterCompletion: cargo?.dimLengthSpecial ?? 0,
              paymentType: cargo?.mapIdData?.paymentType ?? '',
            ),
            cargoTypeDetailsData: CargoTypeDetailsData(
              name: cargo?.cargoTypeIdData?.name ?? '',
              guid: cargo?.cargoTypeIdData?.guid ?? '',
            ),
            statuses: (cargo?.indicateStatus is List<String>) ? cargo?.indicateStatus ?? [] : [],
            bidCash: cargo?.bidCash ?? 0,
            paymentType: cargo?.paymentType ?? '',
            dimWithSpecial: cargo?.dimWithSpecial ?? 0,
            // bargainType: cargo?.bargainType ?? [],
            bodyTypeId: cargo?.bodyTypeId ?? '',
            cargoTypeId: cargo?.cargoTypeId ?? '',
            comment: cargo?.comment ?? '',
            // conditions: cargo?.conditions ?? [],
            date: cargo?.date ?? '',
            guid: cargo?.guid ?? '',
            loadTime: cargo?.loadTime ?? '',
            loadCapacity: cargo?.loadCapacity ?? 0,
            loadLocation: cargo?.loadLocation ?? '',
            measurementId: cargo?.measurementId ?? '',
            numberOfCars: cargo?.numberOfCars ?? 0,
            // status: cargo?.status ?? [],
            unloadLocation: cargo?.unloadLocation ?? '',
            usersId: cargo?.usersId ?? '',
            volumeM3: cargo?.volumeM3 ?? 0,
            weight: cargo?.weight ?? 0,
            prePaymentPercentage: cargo?.prePaymentPercentage ?? 0,
            // paymentAfterLoading: cargo?.paymentAfterLoading ?? 0,
            hasAdditionalLoad: cargo?.loadAroundTheClock ?? false,
          )
        : null;
  }
}

class CargoAddressesPoint {
  final String addressName;

  // final String addressType;
  final String cargoStatus;

  const CargoAddressesPoint({
    required this.addressName,
    // required this.addressType,
    required this.cargoStatus,
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
