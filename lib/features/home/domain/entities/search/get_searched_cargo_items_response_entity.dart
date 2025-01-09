import 'package:equatable/equatable.dart';

import '../../../../../router/app_routes.dart';
import '../../../data/models/search/get_searched_cargo_items_response_model.dart';

class GetSearchedCargoItemsResponseEntity extends Equatable {
  const GetSearchedCargoItemsResponseEntity({
    required this.count,
    required this.searchedCargos,
  });

  final int count;
  final List<SearchedCargoItemEntity> searchedCargos;

  @override
  List<Object?> get props => [searchedCargos];
}

class SearchedCargoItemEntity {
  String? addressId;
  String? addressId2;
  String? fullName;
  String? addressFull;
  String? countryCodeFrom;
  String? countryCodeTo;
  int? currencyPersentage;
  AddressDataEntity? addressDataEntity;
  AddressDataEntity? address2DataEntity;
  CurrencyDataEntity? currencyDataEntity;
  CompanyDataEntity? companyDataEntity;
  num? bidCash;
  bool? asSoonAsA;
  bool? asSoonAsB;
  String? vehicleId;
  num? dimWithSpecial;
  String? companyId;
  List<String>? bargainType;
  String? bodyTypeId;
  String? cargoTypeId;
  String? cardoTypeName;
  String? vehicleTypeName;
  String? comment;
  List<String>? conditions;
  String? date;
  String? guid;
  String? loadTime;
  num? loadCapacity;
  String? loadLocation;
  String? measurementId;
  num? numberOfCars;
  List<String>? status;
  String? unloadLocation;
  String? usersId;
  num? volumeM3;
  num? weight;
  bool? isLiked;
  num? rating;
  bool? request;
  String? cityName;
  String? city2Name;
  String? cityNameRu;
  String? city2NameRu;
  String? cityNameEn;
  String? city2NameEn;
  String? distance;
  String? difference;

  SearchedCargoItemEntity({
    this.addressId,
    this.addressFull,
    this.addressId2,
    this.fullName,
    this.vehicleId,
    this.countryCodeFrom,
    this.countryCodeTo,
    this.addressDataEntity,
    this.address2DataEntity,
    this.currencyDataEntity,
    this.companyDataEntity,
    this.bidCash,
    this.asSoonAsA,
    this.asSoonAsB,
    this.dimWithSpecial,
    this.companyId,
    this.bargainType,
    this.bodyTypeId,
    this.cargoTypeId,
    this.cardoTypeName,
    this.vehicleTypeName,
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
    this.currencyPersentage,
    this.unloadLocation,
    this.usersId,
    this.volumeM3,
    this.weight,
    this.isLiked,
    this.rating,
    this.request,
    this.cityName,
    this.city2Name,
    this.cityNameRu,
    this.city2NameRu,
    this.cityNameEn,
    this.city2NameEn,
    this.distance,
    this.difference,
  });
}

class AddressDataEntity {
  String? addressId;
  String? code;
  String? guid;
  String? name;
  String? nameRu;
  String? nameEn;
  List<String>? type;

  AddressDataEntity({
    this.addressId,
    this.code,
    this.guid,
    this.name,
    this.nameRu,
    this.nameEn,
    this.type,
  });
}

class CurrencyDataEntity {
  String? code;
  String? guid;
  String? name;
  String? photo;
  String? shortName;

  CurrencyDataEntity({
    this.code,
    this.guid,
    this.name,
    this.photo,
    this.shortName,
  });
}

class CompanyDataEntity {
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

  CompanyDataEntity({
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
  });
}

extension GetSearchedCargoItemsResponseEntityX on GetSearchedCargoItemsResponseModel {
  GetSearchedCargoItemsResponseEntity toEntity() => GetSearchedCargoItemsResponseEntity(
        count: data?.data?.count ?? 0,
        searchedCargos: data?.data?.response
                ?.map(
                  (cargo) => SearchedCargoItemEntity(
                    countryCodeFrom: cargo.countryCodeFrom ?? '',
                    countryCodeTo: cargo.countryCodeTo ?? '',
                    addressFull: cargo.addressFull ?? '',
                    currencyPersentage: cargo.currencyPersentage ?? 0,
                    vehicleId: cargo.vehicleTypeIdData?.guid ?? '',
                    addressId: cargo.addressId ?? '',
                    fullName: cargo.fullName ?? '',
                    addressId2: cargo.addressId2 ?? '',
                    isLiked: localSource.favouriteCargoes.contains(cargo.guid),
                    rating: cargo.usersIdData?.rating ?? 0,
                    request: cargo.request ?? false,
                    cityName: cargo.cityIdData?.name ?? '',
                    cityNameRu: cargo.cityIdData?.nameRu ?? '',
                    cityNameEn: cargo.cityIdData?.nameEn ?? '',
                    city2Name: cargo.cityId2Data?.name ?? '',
                    city2NameRu: cargo.cityId2Data?.nameRu ?? '',
                    city2NameEn: cargo.cityId2Data?.nameEn ?? '',
                    distance: '${cargo.distance?.toInt() ?? 0} км',
                    difference: '${cargo.difference ?? 0} км',
                    addressDataEntity: AddressDataEntity(
                      addressId: cargo.addressIdData?.addressId ?? '',
                      code: cargo.addressIdData?.code ?? '',
                      guid: cargo.addressIdData?.guid ?? '',
                      name: cargo.addressIdData?.name ?? '',
                      nameRu: cargo.addressIdData?.nameRu ?? '',
                      nameEn: cargo.addressIdData?.nameEn ?? '',
                      type: cargo.addressIdData?.type ?? [],
                    ),
                    address2DataEntity: AddressDataEntity(
                      addressId: cargo.addressId2Data?.addressId ?? '',
                      code: cargo.addressId2Data?.code ?? '',
                      guid: cargo.addressId2Data?.guid ?? '',
                      name: cargo.addressId2Data?.name ?? '',
                      nameRu: cargo.addressId2Data?.nameRu ?? '',
                      nameEn: cargo.addressId2Data?.nameEn ?? '',
                      type: cargo.addressId2Data?.type ?? [],
                    ),
                    currencyDataEntity: CurrencyDataEntity(
                      code: cargo.currencyIdData?.code ?? '',
                      guid: cargo.currencyIdData?.guid ?? '',
                      name: cargo.currencyIdData?.name ?? '',
                      photo: cargo.currencyIdData?.photo ?? '',
                      shortName: cargo.currencyIdData?.shortName ?? '',
                    ),
                    companyDataEntity: CompanyDataEntity(
                      addressId: cargo.companyIdData?.addressId ?? '',
                      aliasName: cargo.companyIdData?.aliasName ?? '',
                      bankDetails: cargo.companyIdData?.bankDetails ?? '',
                      buildingAddress: cargo.companyIdData?.buildingAddress ?? '',
                      companyDirection: cargo.companyIdData?.companyDirection ?? [],
                      companyType: cargo.companyIdData?.companyType ?? [],
                      email: cargo.companyIdData?.email ?? '',
                      fullName: cargo.companyIdData?.fullName ?? '',
                      guid: cargo.companyIdData?.guid ?? '',
                      name: cargo.companyIdData?.name ?? '',
                      phoneNumber: cargo.companyIdData?.phoneNumber ?? '',
                      photoUrl: cargo.companyIdData?.photoUrl ?? '',
                      tin: cargo.companyIdData?.tin ?? '',
                    ),
                    bidCash: cargo.bidCash ?? 0,
                    asSoonAsA: cargo.asSoonAsA ?? false,
                    asSoonAsB: cargo.asSoonAsB ?? false,
                    dimWithSpecial: cargo.dimWithSpecial ?? 0,
                    bargainType: cargo.bargainType ?? [],
                    bodyTypeId: cargo.bodyTypeId ?? '',
                    cargoTypeId: cargo.cargoTypeId ?? '',
                    cardoTypeName: cargo.cargoTypeIdData?.name ?? '',
                    vehicleTypeName: cargo.vehicleTypeIdData?.name ?? '',
                    comment: cargo.comment ?? '',
                    // conditions: cargo.conditions ?? [],
                    date: cargo.date ?? '',
                    guid: cargo.guid ?? '',
                    loadTime: cargo.loadTime ?? '',
                    loadCapacity: cargo.loadCapacity ?? 0,
                    loadLocation: cargo.loadLocation ?? '',
                    measurementId: cargo.measurementId ?? '',
                    numberOfCars: cargo.numberOfCars ?? 0,
                    status: cargo.status ?? [],
                    unloadLocation: cargo.unloadLocation ?? '',
                    usersId: cargo.usersId ?? '',
                    volumeM3: cargo.volumeM3 ?? 0,
                    weight: cargo.weight ?? 0,
                  ),
                )
                .toList() ??
            [],
      );
}
