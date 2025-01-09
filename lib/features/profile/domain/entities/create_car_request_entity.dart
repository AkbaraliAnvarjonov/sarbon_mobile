import 'package:equatable/equatable.dart';

import '../../data/models/create_car_request_model.dart';

class CreateCarRequestEntity extends Equatable {
  const CreateCarRequestEntity({
    this.userId,
    this.cargoTypeId,
    this.capacity,
    this.height,
    this.trailerTypeId,
    this.loadTypeId,
    this.negotiable,
    this.konika,
    this.status,
    this.bodyDimensions,
    this.fuelId,
    this.carNumber,
    this.carPosition = const [],
    this.techPassportFront,
    this.vehicleImage,
    this.adrPictureFront,
    this.adrPictureBack,
    this.techPassportBack,
    this.techPassportTrailerFront1,
    this.techPassportTrailerFront2,
    this.techPassportTrailerBack1,
    this.techPassportTrailerBack2,
    this.ruNumber,
    this.ecoType,
    this.countryCode,
    this.kzNumber,
    this.trNumber,
  });

  final String? userId;
  final String? cargoTypeId;
  final String? ecoType;
  final num? capacity;
  final num? height;
  final String? trailerTypeId;
  final String? loadTypeId;
  final String? countryCode;
  final bool? negotiable;
  final bool? konika;
  final List<String>? status;
  final bool? bodyDimensions;
  final String? fuelId;
  final String? carNumber;
  final List<String> carPosition;
  final String? vehicleImage;
  final String? techPassportBack;
  final String? techPassportFront;
  final String? techPassportTrailerFront1;
  final String? techPassportTrailerFront2;
  final String? techPassportTrailerBack1;
  final String? techPassportTrailerBack2;
  final String? adrPictureFront;
  final String? adrPictureBack;
  final String? ruNumber;
  final String? kzNumber;
  final String? trNumber;

  @override
  List<Object?> get props => [
        userId,
        cargoTypeId,
        capacity,
        height,
        trailerTypeId,
        countryCode,
        ecoType,
        loadTypeId,
        negotiable,
        konika,
        status,
        bodyDimensions,
        fuelId,
        carNumber,
        carPosition,
        techPassportFront,
        techPassportBack,
        vehicleImage,
        techPassportTrailerFront1,
        techPassportTrailerFront2,
        techPassportTrailerBack1,
        techPassportTrailerBack2,
        adrPictureFront,
        adrPictureBack,
      ];
}

extension CreateCarRequestModelX on CreateCarRequestEntity {
  CreateUpdateCarRequestModel get toModel => CreateUpdateCarRequestModel(
        data: CreateUpdateCarRequestData(
          userId: userId ?? '',
          cargoTypeId: cargoTypeId ?? '',
          capacity: capacity ?? 0,
          countryCode: countryCode ?? '',
          height: height ?? 0,
          trailerTypeId: trailerTypeId ?? '',
          loadTypeId: loadTypeId ?? '',
          negotiable: negotiable ?? false,
          konika: konika ?? false,
          status: status ?? [],
          carPosition: carPosition,
          bodyDimensions: bodyDimensions ?? false,
          fuelId: fuelId ?? '',
          carNumber: carNumber ?? '',
          techPassportBack: techPassportBack ?? '',
          techPassportFront: techPassportFront ?? '',
          vehicleImage: vehicleImage ?? '',
          techPassportTrailerFront1: techPassportTrailerFront1 ?? '',
          techPassportTrailerFront2: techPassportTrailerFront2 ?? '',
          techPassportTrailerBack1: techPassportTrailerBack1 ?? '',
          techPassportTrailerBack2: techPassportTrailerBack2 ?? '',
          adrPictureFront: adrPictureFront ?? '',
          adrPictureBack: adrPictureBack ?? '',
          ruNumber: ruNumber ?? '',
          kzNumber: kzNumber ?? '',
          trNumber: trNumber ?? '',
          ecoType: ecoType ?? '',
        ),
      );
}
