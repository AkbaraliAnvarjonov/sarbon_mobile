import 'package:equatable/equatable.dart';

import '../../../../data/models/announcement/get_active_announcemant/get_active_announcement_response.dart';

class GetActiveInActiveAnnouncementEntity extends Equatable {
  final List<GetActiveInActiveAnnouncementListEntity>
      activeInActiveAnnouncementList;

  const GetActiveInActiveAnnouncementEntity({
    required this.activeInActiveAnnouncementList,
  });

  @override
  List<Object?> get props => [
        activeInActiveAnnouncementList,
      ];
}

class GetActiveInActiveAnnouncementListEntity extends Equatable {
  final String carName;
  final VehicleTypeIdDataEntity vehicleTypeIdData;
  final num carPrice;
  final String carDescription;
  final String contact;
  final CurrencyIdDataEntity currencyIdData;
  final String imageUrl;
  final List<String> status;
  final String userId;
  final String madeDate;
  final AddressIdDataEntity addressIdData;
  final String saleId;
  final String id;

  const GetActiveInActiveAnnouncementListEntity({
    required this.imageUrl,
    required this.carName,
    required this.carPrice,
    required this.carDescription,
    required this.id,
    required this.currencyIdData,
    required this.vehicleTypeIdData,
    required this.addressIdData,
    required this.madeDate,
    required this.saleId,
    required this.status,
    required this.userId,
    required this.contact,
  });

  @override
  List<Object?> get props => [
        imageUrl,
        carName,
        carPrice,
        carDescription,
        id,
        currencyIdData,
        vehicleTypeIdData,
        addressIdData,
        madeDate,
        saleId,
        status,
        userId,
        contact,
      ];
}

class AddressIdDataEntity extends Equatable {
  const AddressIdDataEntity({
    required this.addressId,
    required this.addressName,
    required this.cityId,
    required this.cityName,
  });

  final String addressId;
  final String addressName;
  final String cityId;
  final String cityName;

  @override
  List<Object?> get props => [addressId, addressName, cityId, cityName];
}

class CurrencyIdDataEntity extends Equatable {
  const CurrencyIdDataEntity({required this.id, required this.name});

  final String name;
  final String id;

  @override
  List<Object?> get props => [name, id];
}

class VehicleTypeIdDataEntity extends Equatable {
  const VehicleTypeIdDataEntity({required this.id, required this.name});

  final String name;
  final String id;

  @override
  List<Object?> get props => [name, id];
}

extension GetActiveAnnouncementEntityX
    on GetActiveInActiveAnnouncementResponse {
  GetActiveInActiveAnnouncementEntity toEntity() =>
      GetActiveInActiveAnnouncementEntity(
        activeInActiveAnnouncementList: data?.data?.response
                ?.map(
                  (car) => GetActiveInActiveAnnouncementListEntity(
                    imageUrl: car.photo ?? '',
                    carName: car.name ?? '',
                    carPrice: car.price ?? 0,
                    carDescription: car.description ?? '',
                    id: car.guid ?? '',
                    currencyIdData: CurrencyIdDataEntity(
                      id: car.currencyIdData?.guid ?? '',
                      name: car.currencyIdData?.name ?? '',
                    ),
                    vehicleTypeIdData: VehicleTypeIdDataEntity(
                      id: car.vehicleTypeIdData?.guid ?? '',
                      name: car.vehicleTypeIdData?.name ?? '',
                    ),
                    addressIdData: AddressIdDataEntity(
                      addressId: car.addressIdData?.guid ?? '',
                      addressName: car.addressIdData?.name ?? '',
                      cityId: car.cityIdData?.guid ?? '',
                      cityName: car.cityIdData?.name ?? '',
                    ),
                    madeDate: car.madeDate ?? '',
                    saleId: '',
                    status: car.status ?? [],
                    userId: car.usersId ?? '',
                    contact: car.contact ?? '',
                  ),
                )
                .toList() ??
            [],
      );
}
