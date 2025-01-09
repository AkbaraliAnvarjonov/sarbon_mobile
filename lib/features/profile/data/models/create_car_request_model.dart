class CreateUpdateCarRequestModel {
  CreateUpdateCarRequestData? data;

  CreateUpdateCarRequestModel({this.data});

  CreateUpdateCarRequestModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? CreateUpdateCarRequestData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CreateUpdateCarRequestData {
  String? userId;
  String? cargoTypeId;
  num? capacity;
  num? height;
  String? trailerTypeId;
  String? loadTypeId;
  bool? negotiable;
  bool? konika;
  List<String>? status;
  String? guid;
  bool? bodyDimensions;
  String? fuelId;
  String? carNumber;
  String? ruNumber;
  String? kzNumber;
  String? trNumber;
  String? countryCode;
  String? vehicleImage;
  String? techPassportBack;
  String? ecoType;
  String? techPassportFront;
  String? techPassportTrailerFront1;
  String? techPassportTrailerFront2;
  String? techPassportTrailerBack1;
  String? techPassportTrailerBack2;
  String? adrPictureFront;
  String? adrPictureBack;
  List<String>? carPosition;

  CreateUpdateCarRequestData({
    this.userId,
    this.cargoTypeId,
    this.capacity,
    this.height,
    this.trailerTypeId,
    this.loadTypeId,
    this.negotiable,
    this.konika,
    this.status,
    this.countryCode,
    this.guid,
    this.ecoType,
    this.bodyDimensions,
    this.fuelId,
    this.carNumber,
    this.techPassportFront,
    this.techPassportBack,
    this.techPassportTrailerFront1,
    this.techPassportTrailerFront2,
    this.techPassportTrailerBack1,
    this.techPassportTrailerBack2,
    this.vehicleImage,
    this.carPosition,
    this.adrPictureFront,
    this.adrPictureBack,
    this.ruNumber,
    this.kzNumber,
    this.trNumber,
  });

  CreateUpdateCarRequestData.fromJson(Map<String, dynamic> json) {
    userId = json['users_id'];
    cargoTypeId = json['cargo_type_id'];
    capacity = json['capacity'];
    height = json['height'];
    trailerTypeId = json['trailer_type_id'];
    loadTypeId = json['load_type_id_3'];
    negotiable = json['negotiable'];
    konika = json['konika'];
    status = json['status'];
    bodyDimensions = json['body_dimensions'];
    fuelId = json['fuel_id'];
    if (json['guid'] != null) guid = json['guid'];
    if (json['car_number'] != null) carNumber = json['car_number'];
    if (json['tech_passport_trailer'] != null) {
      techPassportFront = json['tech_passport_trailer'];
    }

    vehicleImage = json['tech_passport'];
    carPosition = json['car_position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userId != null) data['users_id'] = userId;
    if (ecoType != null) data['eco_standart'] = ecoType;
    if (cargoTypeId != null) data['cargo_type_id'] = cargoTypeId;
    if (capacity != null) data['capacity'] = capacity;
    if (height != null) data['height'] = height;
    if (countryCode != null) data['car_country'] = countryCode;
    if (trailerTypeId != null) data['trailer_type_id'] = trailerTypeId;
    if (loadTypeId != null) data['load_type_id_3'] = loadTypeId;
    if (negotiable != null) data['negotiable'] = negotiable;
    if (konika != null) data['konika'] = konika;
    if (status != null) data['status'] = status;
    if (bodyDimensions != null) data['body_dimensions'] = bodyDimensions;
    if (fuelId != null) data['fuel_id'] = fuelId;
    if (guid != null) data['guid'] = guid;
    if (carPosition != null) data['car_position'] = carPosition;
    if (carNumber != null) data['car_number'] = carNumber;
    if (vehicleImage != null) data['tech_passport'] = vehicleImage;
    if (techPassportFront != null) {
      data['tech_passport_trailer'] = techPassportFront;
    }
    if (techPassportBack != null) {
      data['back_side_of_the_passport'] = techPassportBack;
    }
    if (techPassportTrailerFront1 != null) {
      data['front_side_trailer'] = techPassportTrailerFront1;
    }
    if (techPassportTrailerFront2 != null) {
      data['front_side_trailer_1'] = techPassportTrailerFront2;
    }
    if (techPassportTrailerBack1 != null) {
      data['back_side_trailer'] = techPassportTrailerBack1;
    }
    if (techPassportTrailerBack2 != null) {
      data['back_side_trailer_1'] = techPassportTrailerBack2;
    }
    if (adrPictureFront != null) data['adr_picture_front'] = adrPictureFront;
    if (adrPictureBack != null) data['adr_picture_back'] = adrPictureBack;

    if (ruNumber != null) data['phone_number_rus'] = ruNumber;
    if (kzNumber != null) data['phone_number_kz'] = kzNumber;
    if (kzNumber != null) data['phone_number_kz'] = kzNumber;
    if (trNumber != null) data['phone_number_tr'] = trNumber;
    data['create_time'] = DateTime.now().toString();
    return data;
  }
}
