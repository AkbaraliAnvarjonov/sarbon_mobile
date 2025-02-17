import '../../../../../core/utils/utils.dart';

class GetSearchedCargoItemsResponseModel {
  String? status;
  String? description;
  Data? data;

  GetSearchedCargoItemsResponseModel({
    this.status,
    this.description,
    this.data,
  });

  GetSearchedCargoItemsResponseModel.fromJson(Map<String, dynamic> json) {
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
  SearchedCargoData? data;
  bool? isCached;

  Data({
    this.tableSlug,
    this.data,
    this.isCached,
  });

  Data.fromJson(Map<String, dynamic> json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? SearchedCargoData.fromJson(json['data']) : null;
    isCached = json['is_cached'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['table_slug'] = tableSlug;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['is_cached'] = isCached;
    return data;
  }
}

class SearchedCargoData {
  int? count;
  List<SearchedCargoItem>? response;

  SearchedCargoData({
    this.count,
    this.response,
  });

  SearchedCargoData.fromJson(Map<String, dynamic> json) {
    // count = json['count'];
    if (json['response'] != null) {
      response = <SearchedCargoItem>[];
      json['response'].forEach((v) {
        response!.add(SearchedCargoItem.fromJson(v));
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

class SearchedCargoItem {
  String? addressFull;
  String? addressId;
  String? addressId2;
  String? fullName;
  String? countryCodeFrom;
  String? paymentType;
  String? countryCodeTo;
  int? currencyPersentage;
  AddressIdData? addressIdData;
  AddressIdData? addressId2Data;
  CurrencyIdData? currencyIdData;
  CompanyIdData? companyIdData;
  UserId2Data? userId2Data;
  num? bidCash;
  bool? asSoonAsA;
  bool? asSoonAsB;
  num? dimWithSpecial;
  List<String>? bargainType;
  String? bodyTypeId;
  String? cargoTypeId;
  String? comment;
  CargoTypeIdData? cargoTypeIdData;
  VehicleTypeIdData? vehicleTypeIdData;

  // List<String>? conditions;
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
  UsersIdData? usersIdData;
  bool? request;
  CityData? cityIdData;
  CityData? cityId2Data;
  num? distance;
  num? difference;

  SearchedCargoItem({
    this.addressId,
    this.addressFull,
    this.addressId2,
    this.paymentType,
    this.fullName,
    this.addressIdData,
    this.addressId2Data,
    this.currencyIdData,
    this.currencyPersentage,
    this.companyIdData,
    this.dimWithSpecial,
    this.bidCash,
    this.asSoonAsA,
    this.asSoonAsB,
    this.bargainType,
    this.bodyTypeId,
    this.cargoTypeId,
    this.cargoTypeIdData,
    this.vehicleTypeIdData,
    this.comment,
    // this.conditions,
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
    this.isLiked,
    this.userId2Data,
    this.usersIdData,
    this.request,
    this.cityIdData,
    this.cityId2Data,
    this.distance,
    this.difference,
  });

  SearchedCargoItem.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressId2 = json['address_id_2'];
    paymentType = json['payment_type'];
    countryCodeTo = json['country_code_to'];
    countryCodeFrom = json['country_code_from'];
    currencyPersentage = json['prepayment_percentage'];
    distance = json['distance'];
    difference = json['diff'];
    addressFull = json['address_name'];
    fullName = json['firm_id_data']?['full_name'] ?? '';
    cityIdData = json['city_id_data'] != null ? CityData.fromJson(json['city_id_data']) : null;
    cityId2Data = json['city_id_2_data'] != null ? CityData.fromJson(json['city_id_2_data']) : null;
    addressIdData = json['address_id_data'] != null ? AddressIdData.fromJson(json['address_id_data']) : null;
    addressId2Data = json['address_id_2_data'] != null ? AddressIdData.fromJson(json['address_id_2_data']) : null;
    currencyIdData = json['currency_id_data'] != null ? CurrencyIdData.fromJson(json['currency_id_data']) : null;
    companyIdData = json['company_id_data'] != null ? CompanyIdData.fromJson(json['company_id_data']) : null;
    // if(json['bargain_type'] is String){
    //   bargainType = [json['bargain_type']];
    // } else {
    //   bargainType = json['bargain_type'].cast<String>();
    // }
    userId2Data = json['users_id_2_data'] != null ? UserId2Data.fromJson(json['users_id_2_data']) : null;
    bidCash = json['bid_cash'];
    asSoonAsA = json['as_soon_as_a'];
    asSoonAsB = json['as_soon_as_b'];
    dimWithSpecial = json['dim_width_special'];
    bodyTypeId = json['body_type_id'];
    cargoTypeId = json['cargo_type_id'];
    cargoTypeIdData = json['cargo_type_id_data'] != null ? CargoTypeIdData.fromJson(json['cargo_type_id_data']) : null;
    vehicleTypeIdData =
        json['vehicle_type_id_data'] != null ? VehicleTypeIdData.fromJson(json['vehicle_type_id_data']) : null;
    comment = json['comment'];
    // conditions = json['conditions'].cast<String>();
    date = json['date'];
    guid = json['guid'];
    loadTime = json['load_time'];
    loadCapacity = json['load_capacity'];
    loadLocation = json['load_location'];
    measurementId = json['measurement_id'];
    numberOfCars = json['number_of_cars'];
    // status = json['status'].cast<String>();
    unloadLocation = json['unload_location'];
    usersId = json['users_id'];
    volumeM3 = json['volume_m3'];
    weight = json['weight'];
    usersIdData = json['users_id_data'] != null ? UsersIdData.fromJson(json['users_id_data']) : null;
    request = json['request'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['address_id_2'] = addressId2;
    if (addressIdData != null) {
      data['address_id_data'] = addressIdData!.toJson();
    }
    if (addressId2Data != null) {
      data['address_id_2_data'] = addressId2Data!.toJson();
    }
    if (currencyIdData != null) {
      data['currency_id_data'] = currencyIdData!.toJson();
    }
    if (companyIdData != null) {
      data['company_id_data'] = companyIdData!.toJson();
    }
    data['bid_cash'] = bidCash;
    data['dim_width_special'] = dimWithSpecial;
    data['bargain_type'] = bargainType;
    data['body_type_id'] = bodyTypeId;
    data['cargo_type_id'] = cargoTypeId;
    if (cargoTypeIdData != null) {
      data['cargo_type_id_data'] = cargoTypeIdData!.toJson();
    }
    if (vehicleTypeIdData != null) {
      data['vehicle_type_id_data'] = vehicleTypeIdData!.toJson();
    }
    data['comment'] = comment;
    // data['conditions'] = conditions;
    data['date'] = date;
    data['guid'] = guid;
    data['load_time'] = loadTime;
    data['load_capacity'] = loadCapacity;
    data['load_location'] = loadLocation;
    data['measurement_id'] = measurementId;
    data['number_of_cars'] = numberOfCars;
    data['status'] = status;
    data['unload_location'] = unloadLocation;
    data['users_id'] = usersId;
    data['volume_m3'] = volumeM3;
    data['weight'] = weight;
    data['users_id_2_data'] = userId2Data;
    data['users_id_data'] = usersIdData;
    data['request'] = request;
    return data;
  }
}

class CargoTypeIdData {
  String? guid;
  String? name;

  CargoTypeIdData({this.guid, this.name});

  CargoTypeIdData.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guid'] = guid;
    data['name'] = name;
    return data;
  }
}

class VehicleTypeIdData {
  // List<String>? cargoIds;
  String? guid;
  String? name;
  String? vehicleDetailsType;

  VehicleTypeIdData({
    // this.cargoIds,
    this.guid,
    this.name,
    this.vehicleDetailsType,
  });

  VehicleTypeIdData.fromJson(Map<String, dynamic> json) {
    // cargoIds = json['cargo_ids'].cast<String>();
    guid = json['guid'];
    name = json['name'];
    vehicleDetailsType = json['vehicle_deataile_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['cargo_ids'] = cargoIds;
    data['guid'] = guid;
    data['name'] = name;
    data['vehicle_deataile_type'] = vehicleDetailsType;
    return data;
  }
}

class CityData {
  CityData({
    this.v,
    this.id,
    this.addressId,
    this.city,
    this.guid,
    this.name,
    this.nameRu,
    this.nameEn,
  });

  CityData.fromJson(Map<String, dynamic> json) {
    v = json['__v'];
    id = json['_id'];
    addressId = json['address_id'];
    city = json['city'];
    guid = json['guid'];
    name = getLocalizedName(json, 'name');
    nameRu = json['name_ru'];
    nameEn = json['name_en'];
  }

  num? v;
  dynamic id;
  String? addressId;
  String? city;
  String? guid;
  String? name;
  String? nameRu;
  String? nameEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['address_id'] = addressId;
    map['city'] = city;
    map['guid'] = guid;
    map['name'] = name;
    map['name_ru'] = nameRu;
    map['name_en'] = nameEn;
    return map;
  }
}

class UsersIdData {
  UsersIdData({
    this.v,
    this.id,
    this.adr,
    this.balance,
    this.birthdate,
    this.clientTypeId,
    this.companyId,
    this.dailyContactNumberView,
    this.driverLicense,
    this.email,
    this.fcmToken,
    this.fullName,
    this.guid,
    this.house,
    this.iNn,
    this.index,
    this.login,
    this.loginId,
    this.passportCode,
    this.passportIssuedBy,
    this.passportScan,
    this.password,
    this.payment,
    this.phone,
    this.photo,
    this.punkt,
    this.rating,
    this.registerId,
    this.residenceRegistration,
    this.road,
    this.roleId,
    this.tin,
    this.tr,
    this.track,
    this.typeDriver,
    this.verified,
    this.yourId,
  });

  UsersIdData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    // adr = json['adr'];
    balance = json['balance'];
    birthdate = json['birthdate'];
    clientTypeId = json['client_type_id'];
    companyId = json['company_id'];
    dailyContactNumberView = json['daily_contact_number_view'];
    driverLicense = json['driver_license'];
    email = json['email'];
    fcmToken = json['fcm_token'];
    fullName = json['full_name'];
    guid = json['guid'];
    house = json['house'];
    iNn = json['i_nn'];
    index = json['index'];
    login = json['login'];
    loginId = json['login_id'];
    passportCode = json['passport_code'];
    passportIssuedBy = json['passport_issued_by'];
    passportScan = json['passport_scan'];
    password = json['password'];
    payment = json['payment'];
    phone = json['phone'];
    photo = json['photo'];
    punkt = json['punkt'];
    rating = json['rating'];
    registerId = json['register_id'];
    residenceRegistration = json['residence_registration'];
    road = json['road'];
    roleId = json['role_id'];
    tin = json['tin'];
    tr = json['tr'];
    track = json['track'];
    typeDriver = json['type_driver'];
    verified = json['verified'];
    yourId = json['your_id'];
  }

  num? v;
  dynamic id;
  String? adr;
  dynamic balance;
  String? birthdate;
  String? clientTypeId;
  String? companyId;
  dynamic dailyContactNumberView;
  String? driverLicense;
  String? email;
  String? fcmToken;
  String? fullName;
  String? guid;
  String? house;
  String? iNn;
  dynamic index;
  String? login;
  String? loginId;
  String? passportCode;
  String? passportIssuedBy;
  String? passportScan;
  String? password;
  bool? payment;
  String? phone;
  String? photo;
  String? punkt;
  num? rating;
  String? registerId;
  String? residenceRegistration;
  String? road;
  String? roleId;
  String? tin;
  dynamic tr;
  bool? track;
  String? typeDriver;
  bool? verified;
  String? yourId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['adr'] = adr;
    map['balance'] = balance;
    map['birthdate'] = birthdate;
    map['client_type_id'] = clientTypeId;
    map['company_id'] = companyId;
    map['daily_contact_number_view'] = dailyContactNumberView;
    map['driver_license'] = driverLicense;
    map['email'] = email;
    map['fcm_token'] = fcmToken;
    map['full_name'] = fullName;
    map['guid'] = guid;
    map['house'] = house;
    map['i_nn'] = iNn;
    map['index'] = index;
    map['login'] = login;
    map['login_id'] = loginId;
    map['passport_code'] = passportCode;
    map['passport_issued_by'] = passportIssuedBy;
    map['passport_scan'] = passportScan;
    map['password'] = password;
    map['payment'] = payment;
    map['phone'] = phone;
    map['photo'] = photo;
    map['punkt'] = punkt;
    map['rating'] = rating;
    map['register_id'] = registerId;
    map['residence_registration'] = residenceRegistration;
    map['road'] = road;
    map['role_id'] = roleId;
    map['tin'] = tin;
    map['tr'] = tr;
    map['track'] = track;
    map['type_driver'] = typeDriver;
    map['verified'] = verified;
    map['your_id'] = yourId;
    return map;
  }
}

class AddressIdData {
  String? addressId;
  String? code;
  String? guid;
  String? name;
  String? nameRu;
  String? nameEn;
  List<String>? type;

  AddressIdData({
    this.addressId,
    this.code,
    this.guid,
    this.name,
    this.nameRu,
    this.nameEn,
    this.type,
  });

  AddressIdData.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    code = json['code'];
    guid = json['guid'];
    name = json['name'];
    nameRu = json['name_ru'];
    nameEn = json['name_en'];
    type = json['type'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['code'] = code;
    data['guid'] = guid;
    data['name'] = name;
    data['name_ru'] = nameRu;
    data['name_en'] = nameEn;
    data['type'] = type;
    return data;
  }
}

class CurrencyIdData {
  String? code;
  String? guid;
  String? name;
  String? photo;
  String? shortName;

  CurrencyIdData({
    this.code,
    this.guid,
    this.name,
    this.photo,
    this.shortName,
  });

  CurrencyIdData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    guid = json['guid'];
    name = json['name'];
    photo = json['photo'];
    shortName = json['short_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['guid'] = guid;
    data['name'] = name;
    data['photo'] = photo;
    data['short_name'] = shortName;
    return data;
  }
}

class CompanyIdData {
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

  CompanyIdData({
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

  CompanyIdData.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    aliasName = json['alias_name'];
    bankDetails = json['bank_details'];
    buildingAddress = json['building_address'];
    companyDirection = json['company_direction'].cast<String>();
    companyType = json['company_type'].cast<String>();
    email = json['email'];
    fullName = json['full_name'];
    guid = json['guid'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    photoUrl = json['photo_url'];
    tin = json['tin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['alias_name'] = aliasName;
    data['bank_details'] = bankDetails;
    data['building_address'] = buildingAddress;
    data['company_direction'] = companyDirection;
    data['company_type'] = companyType;
    data['email'] = email;
    data['full_name'] = fullName;
    data['guid'] = guid;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['photo_url'] = photoUrl;
    data['tin'] = tin;
    return data;
  }
}

class UserId2Data {
  UserId2Data({
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
  });

  UserId2Data.fromJson(Map json) {
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
