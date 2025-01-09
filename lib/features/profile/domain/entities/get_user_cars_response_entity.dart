import 'package:equatable/equatable.dart';

import '../../data/models/get_user_cars_response_model.dart';

class GetUserCarsResponseEntity extends Equatable {
  const GetUserCarsResponseEntity({
    required this.count,
    required this.userCars,
  });

  final int count;
  final List<UserCarEntity> userCars;

  @override
  List<Object?> get props => [userCars];
}

class UserCarEntity {
  String? guid;
  num? capacity;
  num? height;
  num? weight;
  bool? isHydroLift;
  bool? isKoniky;
  bool? isBodyDimensions;
  String? status;
  TrailerTypeDataEntity? trailerTypeData;
  String? trailerTypeId;
  String? vehicleTypeId;
  CargoTypeDataEntity? cargoTypeData;
  LoadTypeDataEntity? loadTypeData;
  String? vehicleNumber;
  String? vehicleFile;
  String? techPassportBack;
  String? techPassportFront;
  String? techPassportTrailerFront1;
  String? techPassportTrailerFront2;
  String? techPassportTrailerBack1;
  String? techPassportTrailerBack2;
  String? adrPictureFront;
  String? adrPictureBack;

  UserCarEntity({
    this.guid,
    this.trailerTypeId,
    this.vehicleTypeId,
    this.capacity,
    this.height,
    this.weight,
    this.trailerTypeData,
    this.cargoTypeData,
    this.loadTypeData,
    this.isHydroLift,
    this.isKoniky,
    this.isBodyDimensions,
    this.status,
    this.vehicleNumber,
    this.vehicleFile,
    this.techPassportBack,
    this.techPassportFront,
    this.techPassportTrailerFront1,
    this.techPassportTrailerFront2,
    this.techPassportTrailerBack1,
    this.techPassportTrailerBack2,
    this.adrPictureFront,
    this.adrPictureBack,
  });
}

class TrailerTypeDataEntity {
  String? guid;
  String? name;

  TrailerTypeDataEntity({
    this.guid,
    this.name,
  });
}

class CargoTypeDataEntity {
  String? guid;
  String? name;

  CargoTypeDataEntity({
    this.guid,
    this.name,
  });
}

class LoadTypeDataEntity {
  String? name;
  String? guid;

  LoadTypeDataEntity({
    this.name,
    this.guid,
  });
}

extension GetUserCarsResponseEntityX on GetUserCarsResponseModel {
  GetUserCarsResponseEntity toEntity() => GetUserCarsResponseEntity(
        count: data?.data?.count ?? 0,
        userCars: data?.data?.response
                ?.map(
                  (car) => UserCarEntity(
                    guid: car.guid ?? '',
                    // carName: car.carName ?? '',
                    adrPictureBack: car.adrBackFile ?? '',
                    adrPictureFront: car.adrFrontFile ?? '',
                    vehicleFile: car.techPassport ?? '',
                    vehicleTypeId: car.usersIdData?.vehicleTypeId ?? '',
                    techPassportFront: car.techPassportTrailerFront ?? '',
                    techPassportBack: car.techPassportTrailerBack ?? '',
                    techPassportTrailerFront1: car.techPassportTrailerFront1 ?? '',
                    techPassportTrailerFront2: car.techPassportTrailerFront2 ?? '',
                    techPassportTrailerBack1: car.techPassportTrailerBack1 ?? '',
                    techPassportTrailerBack2: car.techPassportTrailerBack2 ?? '',
                    vehicleNumber: car.carNumber ?? '',
                    capacity: car.capacity ?? 0,
                    height: car.height ?? 0,
                    weight: car.weight ?? 0,
                    isHydroLift: car.negotiable ?? false,
                    isKoniky: car.konika ?? false,
                    isBodyDimensions: car.bodyDimensions ?? false,
                    trailerTypeId: car.trailerTypeId ?? '',
                    status: car.status?.first ?? 'active',
                    trailerTypeData: TrailerTypeDataEntity(
                      guid: car.trailerTypeIdData?.guid ?? '',
                      name: car.trailerTypeIdData?.name ?? '',
                    ),
                    cargoTypeData: CargoTypeDataEntity(
                      guid: car.cargoTypeIdData?.guid ?? '',
                      name: car.cargoTypeIdData?.name ?? '',
                    ),
                    loadTypeData: LoadTypeDataEntity(
                      name: car.loadTypeId3Data?.name ?? '',
                      guid: car.loadTypeId3Data?.guid ?? '',
                    ),
                  ),
                )
                .toList() ??
            [],
      );
}
