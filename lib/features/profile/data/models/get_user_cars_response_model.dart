class GetUserCarsResponseModel {
  String? status;
  String? description;
  Data? data;

  GetUserCarsResponseModel({this.status, this.description, this.data});

  GetUserCarsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['description'] = description;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? tableSlug;
  UserCarsData? data;

  Data({this.tableSlug, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? UserCarsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['table_slug'] = tableSlug;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserCarsData {
  int? count;
  List<UserCarItem>? response;

  UserCarsData({this.count, this.response});

  UserCarsData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['response'] != null) {
      response = <UserCarItem>[];
      json['response'].forEach((v) {
        response!.add(UserCarItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserCarItem {
  UserCarItem({
    this.addressId2Data,
    this.addressIdData,
    this.bid,
    this.bodyTypeIdData,
    this.brandIdData,
    this.capacity,
    this.carNumber,
    this.carPhoto,
    this.carVinCode,
    this.cargoTypeId,
    this.cargoTypeIdData,
    this.comment,
    this.companyIdData,
    this.currencyIdData,
    this.dangerousGood,
    this.freeGpsMonitoring,
    this.guid,
    this.height,
    this.konika,
    this.length,
    this.loadRadius,
    this.loadTypeId3,
    this.loadTypeId3Data,
    this.negotiable,
    this.numberTrailer,
    this.paymentCash,
    this.paymentNoncashNovatBid,
    this.paymentNoncashVatBid,
    this.readyToLoad,
    this.shortNames,
    this.status,
    this.techPassport,
    this.techPassportTrailerFront,
    this.trailerTypeId,
    this.trailerTypeIdData,
    this.unloadingRadius,
    this.usersId,
    this.usersIdData,
    this.vehicleTypeIdData,
    this.weight,
    this.width,
    this.bodyDimensions,
    this.adrBackFile,
    this.adrFrontFile,
  });

  UserCarItem.fromJson(Map json) {
    addressId2Data = json['address_id_2_data'];
    addressIdData = json['address_id_data'];
    bid = json['bid'];
    bodyTypeIdData = json['body_type_id_data'];
    brandIdData = json['brand_id_data'];
    capacity = json['capacity'];
    carNumber = json['car_number'];
    carPhoto = json['car_photo'];
    carVinCode = json['car_vin_code'];
    cargoTypeId = json['cargo_type_id'];
    cargoTypeIdData = json['cargo_type_id_data'] != null ? CargoTypeIdData.fromJson(json['cargo_type_id_data']) : null;
    comment = json['comment'];
    companyIdData = json['company_id_data'];
    currencyIdData = json['currency_id_data'];
    dangerousGood = json['dangerous_good'];
    freeGpsMonitoring = json['free_gps_monitoring'];
    guid = json['guid'];
    height = json['height'];
    konika = json['konika'];
    length = json['length'];
    loadRadius = json['load_radius'];
    loadTypeId3 = json['load_type_id_3'];
    loadTypeId3Data =
        json['load_type_id_3_data'] != null ? LoadTypeId3Data.fromJson(json['load_type_id_3_data']) : null;
    negotiable = json['negotiable'];
    numberTrailer = json['number_trailer'];
    paymentCash = json['payment_cash'];
    paymentNoncashNovatBid = json['payment_noncash_novat_bid'];
    paymentNoncashVatBid = json['payment_noncash_vat_bid'];
    readyToLoad = json['ready_to_load'];
    shortNames = json['short_names'];
    status = json['status'] != null ? json['status'].cast<String>() : [];
    techPassportTrailerFront = json['tech_passport_trailer'];
    trailerTypeId = json['trailer_type_id'];
    trailerTypeIdData =
        json['trailer_type_id_data'] != null ? TrailerTypeIdData.fromJson(json['trailer_type_id_data']) : null;
    unloadingRadius = json['unloading_radius'];
    usersId = json['users_id'];
    usersIdData = json['users_id_data'] != null ? UsersIdData.fromJson(json['users_id_data']) : null;
    vehicleTypeIdData = json['vehicle_type_id_data'];
    weight = json['weight'];
    width = json['width'];
    bodyDimensions = json['body_dimensions'];
    adrBackFile = json['adr_picture_back'];
    adrFrontFile = json['adr_picture_front'];
    techPassport = json['tech_passport'];
    techPassportTrailerBack = json['back_side_of_the_passport'];
    techPassportTrailerFront1 = json['front_side_trailer'];
    techPassportTrailerBack1 = json['back_side_trailer'];
    techPassportTrailerFront2 = json['front_side_trailer_1'];
    techPassportTrailerBack2 = json['back_side_trailer_1'];
  }

  dynamic addressId2Data;
  dynamic addressIdData;
  dynamic bid;
  dynamic bodyTypeIdData;
  dynamic brandIdData;
  num? capacity;
  String? carNumber;
  String? carPhoto;
  dynamic carVinCode;
  String? cargoTypeId;
  CargoTypeIdData? cargoTypeIdData;
  String? comment;
  dynamic companyIdData;
  dynamic currencyIdData;
  String? dangerousGood;
  bool? freeGpsMonitoring;
  String? guid;
  num? height;
  bool? konika;
  bool? bodyDimensions;
  dynamic length;
  dynamic loadRadius;
  String? loadTypeId3;
  LoadTypeId3Data? loadTypeId3Data;
  bool? negotiable;
  String? numberTrailer;
  dynamic paymentCash;
  dynamic paymentNoncashNovatBid;
  dynamic paymentNoncashVatBid;
  bool? readyToLoad;
  String? shortNames;
  List<String>? status;

  String? trailerTypeId;
  TrailerTypeIdData? trailerTypeIdData;
  dynamic unloadingRadius;
  String? usersId;
  UsersIdData? usersIdData;
  dynamic vehicleTypeIdData;
  dynamic weight;
  dynamic width;
  String? techPassport;
  String? techPassportTrailerFront;
  String? techPassportTrailerBack;
  String? techPassportTrailerFront1;
  String? techPassportTrailerFront2;
  String? techPassportTrailerBack1;
  String? techPassportTrailerBack2;
  String? adrBackFile;
  String? adrFrontFile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address_id_2_data'] = addressId2Data;
    map['address_id_data'] = addressIdData;
    map['bid'] = bid;
    map['body_type_id_data'] = bodyTypeIdData;
    map['brand_id_data'] = brandIdData;
    map['capacity'] = capacity;
    map['car_number'] = carNumber;
    map['car_photo'] = carPhoto;
    map['car_vin_code'] = carVinCode;
    map['cargo_type_id'] = cargoTypeId;
    if (cargoTypeIdData != null) map['cargo_type_id_data'] = cargoTypeIdData?.toJson();
    map['comment'] = comment;
    map['company_id_data'] = companyIdData;
    map['currency_id_data'] = currencyIdData;
    map['dangerous_good'] = dangerousGood;
    map['free_gps_monitoring'] = freeGpsMonitoring;
    map['guid'] = guid;
    map['height'] = height;
    map['konika'] = konika;
    map['length'] = length;
    map['load_radius'] = loadRadius;
    map['load_type_id_3'] = loadTypeId3;
    if (loadTypeId3Data != null) map['load_type_id_3_data'] = loadTypeId3Data?.toJson();
    map['negotiable'] = negotiable;
    map['number_trailer'] = numberTrailer;
    map['payment_cash'] = paymentCash;
    map['payment_noncash_novat_bid'] = paymentNoncashNovatBid;
    map['payment_noncash_vat_bid'] = paymentNoncashVatBid;
    map['ready_to_load'] = readyToLoad;
    map['short_names'] = shortNames;
    map['status'] = status;
    map['tech_passport'] = techPassport;
    map['tech_passport_trailer'] = techPassportTrailerFront;
    map['back_side_of_the_passport'] = techPassportTrailerBack;
    map['front_side_trailer'] = techPassportTrailerFront1;
    map['back_side_trailer'] = techPassportTrailerBack1;
    map['front_side_trailer_1'] = techPassportTrailerFront2;
    map['back_side_trailer_1'] = techPassportTrailerBack2;
    map['adr_back_file'] = adrBackFile;
    map['adr_front_file'] = adrFrontFile;
    map['trailer_type_id'] = trailerTypeId;
    if (trailerTypeIdData != null) map['trailer_type_id_data'] = trailerTypeIdData?.toJson();
    map['unloading_radius'] = unloadingRadius;
    map['users_id'] = usersId;
    if (usersIdData != null) map['users_id_data'] = usersIdData?.toJson();
    map['vehicle_type_id_data'] = vehicleTypeIdData;
    map['weight'] = weight;
    map['width'] = width;
    map['body_dimensions'] = bodyDimensions;

    return map;
  }
}

class UsersIdData {
  UsersIdData({
    this.v,
    this.id,
    this.birthdate,
    this.clientTypeId,
    this.companyId,
    this.dailyContactNumberView,
    this.driverLicense,
    this.email,
    this.fullName,
    this.guid,
    this.house,
    this.iNn,
    this.index,
    this.login,
    this.passportCode,
    this.passportIssuedBy,
    this.passportScan,
    this.password,
    this.payment,
    this.phone,
    this.photo,
    this.punkt,
    this.rating,
    this.residenceRegistration,
    this.road,
    this.roleId,
    this.tin,
    this.tr,
    this.track,
    this.typeDriver,
    this.verified,
    this.vehicleTypeId,
  });

  UsersIdData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    birthdate = json['birthdate'];
    clientTypeId = json['client_type_id'];
    companyId = json['company_id'];
    dailyContactNumberView = json['daily_contact_number_view'];
    driverLicense = json['driver_license'];
    email = json['email'];
    fullName = json['full_name'];
    guid = json['guid'];
    house = json['house'];
    iNn = json['i_nn'];
    index = json['index'];
    login = json['login'];
    passportCode = json['passport_code'];
    vehicleTypeId = json['vehicle_type_id'];
    passportIssuedBy = json['passport_issued_by'];
    passportScan = json['passport_scan'];
    password = json['password'];
    payment = json['payment'];
    phone = json['phone'];
    photo = json['photo'];
    punkt = json['punkt'];
    rating = json['rating'];
    residenceRegistration = json['residence_registration'];
    road = json['road'];
    roleId = json['role_id'];
    tin = json['tin'];
    tr = json['tr'];
    track = json['track'];
    typeDriver = json['type_driver'];
    verified = json['verified'];
  }

  num? v;
  dynamic id;
  String? birthdate;
  String? clientTypeId;
  String? companyId;
  dynamic dailyContactNumberView;
  String? driverLicense;
  String? email;
  String? fullName;
  String? guid;
  String? house;
  String? iNn;
  dynamic index;
  String? login;
  String? passportCode;
  String? passportIssuedBy;
  String? passportScan;
  String? password;
  bool? payment;
  String? phone;
  String? photo;
  String? punkt;
  num? rating;
  String? residenceRegistration;
  String? road;
  String? roleId;
  String? vehicleTypeId;
  String? tin;
  dynamic tr;
  bool? track;
  String? typeDriver;
  bool? verified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['birthdate'] = birthdate;
    map['client_type_id'] = clientTypeId;
    map['company_id'] = companyId;
    map['daily_contact_number_view'] = dailyContactNumberView;
    map['driver_license'] = driverLicense;
    map['email'] = email;
    map['full_name'] = fullName;
    map['guid'] = guid;
    map['house'] = house;
    map['i_nn'] = iNn;
    map['index'] = index;
    map['login'] = login;
    map['passport_code'] = passportCode;
    map['vehicle_type_id'] = vehicleTypeId;
    map['passport_issued_by'] = passportIssuedBy;
    map['passport_scan'] = passportScan;
    map['password'] = password;
    map['payment'] = payment;
    map['phone'] = phone;
    map['photo'] = photo;
    map['punkt'] = punkt;
    map['rating'] = rating;
    map['residence_registration'] = residenceRegistration;
    map['road'] = road;
    map['role_id'] = roleId;
    map['tin'] = tin;
    map['tr'] = tr;
    map['track'] = track;
    map['type_driver'] = typeDriver;
    map['verified'] = verified;
    return map;
  }
}

class TrailerTypeIdData {
  TrailerTypeIdData({
    this.v,
    this.id,
    this.guid,
    this.name,
  });

  TrailerTypeIdData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    guid = json['guid'];
    name = json['name'];
  }

  num? v;
  dynamic id;
  String? guid;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['guid'] = guid;
    map['name'] = name;
    return map;
  }
}

class LoadTypeId3Data {
  LoadTypeId3Data({
    this.v,
    this.id,
    this.cargoIds,
    this.guid,
    this.name,
    this.responseIds,
    this.vehicleIds,
  });

  LoadTypeId3Data.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    cargoIds = json['cargo_ids'] != null ? json['cargo_ids'].cast<String>() : [];
    guid = json['guid'];
    name = json['name'];
    responseIds = json['response_ids'] != null ? json['response_ids'].cast<String>() : [];
    vehicleIds = json['vehicle_ids'] != null ? json['vehicle_ids'].cast<String>() : [];
  }

  num? v;
  dynamic id;
  List<String>? cargoIds;
  String? guid;
  String? name;
  List<String>? responseIds;
  List<String>? vehicleIds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['cargo_ids'] = cargoIds;
    map['guid'] = guid;
    map['name'] = name;
    map['response_ids'] = responseIds;
    map['vehicle_ids'] = vehicleIds;
    return map;
  }
}

class CargoTypeIdData {
  CargoTypeIdData({
    this.v,
    this.id,
    this.guid,
    this.name,
  });

  CargoTypeIdData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    guid = json['guid'];
    name = json['name'];
  }

  num? v;
  dynamic id;
  String? guid;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['guid'] = guid;
    map['name'] = name;
    return map;
  }
}
