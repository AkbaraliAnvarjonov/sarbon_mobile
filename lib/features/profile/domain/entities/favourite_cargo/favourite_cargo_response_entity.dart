import 'package:equatable/equatable.dart';

import '../../../../../core/extension/extension.dart';
import '../../../data/models/favourite_cargo/favourite_cargo_response.dart';

class FavouriteCargoResponseEntity extends Equatable {
  const FavouriteCargoResponseEntity({
    required this.favouriteCargoes,
  });

  final List<FavouriteCargoListEntity> favouriteCargoes;

  @override
  List<Object?> get props => [favouriteCargoes];
}

class FavouriteCargoListEntity {
  String? guid;
  String? distance;
  String? fromAddress;
  String? fromAddressRu;
  String? fromAddressEn;
  String? toAddress;
  String? toAddressRu;
  String? toAddressEn;
  String? date;
  String? weight;
  String? volume;
  String? price;
  String? currency;
  String? companyName;
  bool? isLiked;
  num? rating;
  String? cityName;
  String? cityNameRu;
  String? cityNameEn;
  String? city2Name;
  String? city2NameRu;
  String? city2NameEn;

  FavouriteCargoListEntity({
    this.guid,
    this.distance,
    this.fromAddress,
    this.fromAddressRu,
    this.fromAddressEn,
    this.toAddress,
    this.toAddressRu,
    this.toAddressEn,
    this.date,
    this.weight,
    this.volume,
    this.price,
    this.currency,
    this.companyName,
    this.isLiked,
    this.rating,
    this.cityName,
    this.cityNameRu,
    this.cityNameEn,
    this.city2Name,
    this.city2NameRu,
    this.city2NameEn,
  });
}

extension FavouriteCargoResponseEntityX on FavouriteCargoResponse {
  FavouriteCargoResponseEntity toEntity() => FavouriteCargoResponseEntity(
        favouriteCargoes: data?.data?.response
                ?.map(
                  (cargo) => FavouriteCargoListEntity(
                    guid: cargo.guid ?? '',
                    distance: '${cargo.distance ?? ''} км',
                    fromAddress: cargo.addressIdData?.name ?? '',
                    fromAddressEn: cargo.addressIdData?.nameEn ?? '',
                    fromAddressRu: cargo.addressIdData?.nameRu ?? '',
                    toAddress: cargo.addressId2Data?.name ?? '',
                    toAddressEn: cargo.addressId2Data?.nameEn ?? '',
                    toAddressRu: cargo.addressId2Data?.nameRu ?? '',
                    date: cargo.loadTime ?? '',
                    weight: (cargo.weight ?? 0).toString(),
                    volume: (cargo.volumeM3 ?? 0).toString(),
                    price: (cargo.bidCash ?? 0).toInt().moneyFormat,
                    currency: cargo.currencyIdData?.code ?? '',
                    companyName: cargo.companyIdData?.fullName ?? '',
                    isLiked: cargo.isLiked ?? true,
                    rating: cargo.usersIdData?.rating ?? 0,
                    cityName: cargo.cityIdData?.name ?? '',
                    cityNameRu: cargo.cityIdData?.nameRu ?? '',
                    cityNameEn: cargo.cityIdData?.nameEn ?? '',
                    city2Name: cargo.cityId2Data?.name ?? '',
                    city2NameRu: cargo.cityId2Data?.nameRu ?? '',
                    city2NameEn: cargo.cityId2Data?.nameEn ?? '',
                  ),
                )
                .toList() ??
            [],
      );
}
