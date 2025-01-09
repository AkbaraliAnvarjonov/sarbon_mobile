import 'package:equatable/equatable.dart';

import '../../../data/models/cars_sale/cars_sale_search_response.dart';

class SaleCarsSearchResultEntity extends Equatable {
  final List<SaleCarsSearchResultListEntity> searchResultList;

  const SaleCarsSearchResultEntity({
    required this.searchResultList,
  });

  @override
  List<Object?> get props => [
        searchResultList,
      ];
}

class SaleCarsSearchResultListEntity extends Equatable {
  final String imageUrls;
  final String carName;
  final num carPrice;
  final String carDescription;
  final String currency;
  final String type;
  final String address;
  final String date;
  final String id;
  final String userNumber;
  final String userName;
  final String rating;

  const SaleCarsSearchResultListEntity({
    required this.imageUrls,
    required this.carName,
    required this.carPrice,
    required this.carDescription,
    required this.currency,
    required this.type,
    required this.address,
    required this.date,
    required this.id,
    required this.userNumber,
    required this.userName,
    required this.rating,
  });

  @override
  List<Object?> get props => [
        imageUrls,
        carName,
        carPrice,
        carDescription,
        currency,
        type,
        address,
        date,
        id,
        userNumber,
        userName,
        rating,
      ];
}

extension SaleCarsSearchResultEntityX on CarsSaleSearchResponse {
  SaleCarsSearchResultEntity toEntity() => SaleCarsSearchResultEntity(
        searchResultList: data?.data?.response?.map(
              (car) {
                final StringBuffer ratingResult = StringBuffer();
                for (var i = 0; i < (car.usersIdData?.rating ?? 0); i++) {
                  ratingResult.write('⭐');
                }
                return SaleCarsSearchResultListEntity(
                  imageUrls: car.photo ?? '',
                  carName: car.name ?? '',
                  carPrice: car.price ?? 0,
                  carDescription: car.description ?? '',
                  currency: car.currencyIdData?.name ?? '',
                  type: car.vehicleTypeIdData?.name ?? '',
                  address: car.addressIdData?.name ?? '',
                  date: car.madeDate ?? '',
                  id: car.guid ?? '',
                  userNumber: car.contact ?? '',
                  userName: car.usersIdData?.fullName ?? '',
                  rating: ratingResult.toString(),
                );
              },
            ).toList() ??
            [],
      );
}
