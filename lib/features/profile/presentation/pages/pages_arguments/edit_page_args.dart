import '../../../domain/entities/get_cargo_types_response_entity.dart';
import '../../../domain/entities/get_load_types_response_entity.dart';
import '../../../domain/entities/get_trailer_types_response_entity.dart';

class EditCarPageArguments {
  final CargoTypeItem selectedCargoType;
  final TrailerTypeItem selectedTrailerType;
  final LoadTypeItem selectedLoadType;
  final String carGuid;
  final String capacity;
  final String volume;
  final bool bodyDimensions;
  final bool hydraLift;
  final bool koniky;
  final String status;
  final String vehicleNumber;
  final String vehicleFile;
  final String techPassportFront;
  final String techPassportBack;
  final String adrFrontFile;
  final String adrBackFile;
  final String techPassportTrailerFront1;
  final String techPassportTrailerFront2;
  final String techPassportTrailerBack1;
  final String techPassportTrailerBack2;

  const EditCarPageArguments({
    required this.selectedCargoType,
    required this.selectedTrailerType,
    required this.selectedLoadType,
    required this.carGuid,
    required this.capacity,
    required this.volume,
    required this.bodyDimensions,
    required this.hydraLift,
    required this.koniky,
    required this.status,
    required this.vehicleNumber,
    required this.vehicleFile,
    required this.techPassportFront,
    required this.adrFrontFile,
    required this.adrBackFile,
    required this.techPassportBack,
    required this.techPassportTrailerFront1,
    required this.techPassportTrailerFront2,
    required this.techPassportTrailerBack1,
    required this.techPassportTrailerBack2,
  });
}
