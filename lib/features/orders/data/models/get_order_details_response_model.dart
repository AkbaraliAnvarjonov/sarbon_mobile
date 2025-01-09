class GetOrderDetailsResponseModel {
  String? status;
  String? description;
  Data? data;

  GetOrderDetailsResponseModel({
    this.status,
    this.description,
    this.data,
  });

  GetOrderDetailsResponseModel.fromJson(Map<String, dynamic> json) {
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
  OrderDetailsData? data;
  bool? isCached;

  Data({
    this.tableSlug,
    this.data,
    this.isCached,
  });

  Data.fromJson(Map<String, dynamic> json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? OrderDetailsData.fromJson(json['data']) : null;
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

class OrderDetailsData {
  int? count;
  List<OrderDetails>? response;

  OrderDetailsData({
    this.count,
    this.response,
  });

  OrderDetailsData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['response'] != null) {
      response = <OrderDetails>[];
      json['response'].forEach((v) {
        response!.add(OrderDetails.fromJson(v));
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

class OrderDetails {
  String? addressId;
  String? addressId2;
  String? carType;
  String? currencyId;
  List<String>? paymentType;
  List<String>? provisions;
  UserId2Data? userId2Data;
  UsersId3Data? usersId3Data;
  CargoIdData? cargoIdData;
  num? rateInterest;
  num? rateInterestAfterCompletion;
  AddressIdData? addressIdData;
  AddressIdData? addressId2Data;
  CurrencyIdData? currencyIdData;
  CompanyIdData? companyIdData;
  VehicleTypeIdData? vehicleTypeIdData;
  OrderTypeIdData? cargoTypeIdData;
  List<dynamic>? indicateStatus;
  num? bidCash;
  num? dimWithSpecial;
  String? companyId;
  String? phone;

  // List<String>? bargainType;
  String? bodyTypeId;
  String? cargoTypeId;
  String? comment;

  // List<String>? conditions;
  String? date;
  String? guid;
  String? loadTime;
  num? loadCapacity;
  String? loadLocation;
  String? measurementId;
  int? numberOfCars;

  // List<String>? status;
  String? unloadLocation;
  String? usersId;
  String? usersId2;
  String? usersId3;
  num? volumeM3;
  num? weight;
  num? prePaymentPercentage;
  num? paymentUnloading;

  // num? paymentAfterLoading;
  bool? loadAroundTheClock;
  MapIdData? mapIdData;
  List<String>? statuses;
  bool? cmr;
  bool? t1;
  bool? tir;
  num? driverCash;
  String? shortName;
  num? offers;
  String? file1;
  String? file2;
  String? file3;
  String? file4;
  String? file5;
  List<String>? requirements;
  String? driverComment;
  num? conditions;
  CurrencyId2Data? currencyId2Data;
  List<String>? addressIds;
  List<String>? permission;
  CityData? cityIdData;
  CityData? cityId2Data;
  num? distance;

  OrderDetails({
    this.addressId,
    this.addressId2,
    this.cargoIdData,
    this.currencyId,
    this.carType,
    this.offers,
    this.paymentType,
    this.provisions,
    this.addressIdData,
    this.addressId2Data,
    this.currencyIdData,
    this.companyIdData,
    this.vehicleTypeIdData,
    this.cargoTypeIdData,
    this.indicateStatus,
    this.companyId,
    this.dimWithSpecial,
    this.bidCash,
    // this.bargainType,
    this.bodyTypeId,
    this.cargoTypeId,
    this.comment,
    // this.conditions,
    this.date,
    this.guid,
    this.loadTime,
    this.loadCapacity,
    this.loadLocation,
    this.measurementId,
    this.numberOfCars,
    // this.status,
    this.unloadLocation,
    this.usersId,
    this.usersId2,
    this.usersId3,
    this.volumeM3,
    this.weight,
    this.prePaymentPercentage,
    // this.paymentAfterLoading,
    this.loadAroundTheClock,
    this.userId2Data,
    this.rateInterest,
    this.rateInterestAfterCompletion,
    this.paymentUnloading,
    this.mapIdData,
    this.statuses,
    this.usersId3Data,
    this.cmr,
    this.t1,
    this.tir,
    this.driverCash,
    this.shortName,
    this.requirements,
    this.driverComment,
    this.conditions,
    this.currencyId2Data,
    this.phone,
    this.addressIds,
    this.permission,
    this.cityIdData,
    this.cityId2Data,
    this.distance,
    this.file1,
    this.file2,
    this.file3,
    this.file4,
    this.file5,
  });

  OrderDetails.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressId2 = json['address_id_2'];
    phone = json['phone'];
    carType = json['car_type'];
    offers = json['offers'];
    currencyId = json['currency_id'];
    cargoIdData = json['cargo_id_data'] != null ? CargoIdData.fromJson(json['cargo_id_data']) : null;
    distance = json['distance'];
    paymentType = (json['payment_type'] is String) ? [json['payment_type']] : json['payment_type'].cast<String>();
    provisions = (json['provisions'] is String) ? [json['provisions']] : json['provisions'].cast<String>();
    cityIdData = json['city_id_data'] != null ? CityData.fromJson(json['city_id_data']) : null;
    cityId2Data = json['city_id_2_data'] != null ? CityData.fromJson(json['city_id_2_data']) : null;
    addressIds = json['address_ids'] != null && json['address_ids'] is List ? json['address_ids'].cast<String>() : [];
    permission = json['permission'] != null && json['permission'] is List ? json['permission'].cast<String>() : [];
    addressIdData = json['address_id_data'] != null ? AddressIdData.fromJson(json['address_id_data']) : null;
    addressId2Data = json['address_id_2_data'] != null ? AddressIdData.fromJson(json['address_id_2_data']) : null;
    currencyIdData = json['currency_id_data'] != null ? CurrencyIdData.fromJson(json['currency_id_data']) : null;
    companyIdData = json['firm_id_2_data'] != null ? CompanyIdData.fromJson(json['firm_id_2_data']) : null;
    vehicleTypeIdData =
        json['vehicle_type_id_data'] != null ? VehicleTypeIdData.fromJson(json['vehicle_type_id_data']) : null;
    cargoTypeIdData = json['cargo_type_id_data'] != null ? OrderTypeIdData.fromJson(json['cargo_type_id_data']) : null;
    userId2Data = json['users_id_2_data'] != null ? UserId2Data.fromJson(json['users_id_2_data']) : null;
    usersId3Data = json['users_id_3_data'] != null ? UsersId3Data.fromJson(json['users_id_3_data']) : null;
    rateInterest = json['rate_interest'];
    rateInterestAfterCompletion = json['rate_interest_after_completion'];
    // bargainType = json['bargain_type'].cast<String>();
    if (json['indicate_status'] is List) {
      indicateStatus = json['indicate_status'] ?? [];
    }
    companyId = json['company_id'];
    bidCash = json['bid_cash'];
    dimWithSpecial = json['dim_width_special'];
    bodyTypeId = json['body_type_id'];
    cargoTypeId = json['cargo_type_id'];
    comment = json['comment'];
    // conditions = json['conditions'].cast<String>();
    date = json['date'];
    guid = json['guid'];
    loadTime = json['load_time'];
    loadCapacity = json['load_capacity'];
    loadLocation = json['load_location'];
    measurementId = json['measurement_id'];
    numberOfCars = json['quantity'];
    // status = json['status'].cast<String>();
    unloadLocation = json['unload_location'];
    usersId = json['users_id'];
    usersId2 = json['users_id_2'];
    usersId3 = json['users_id_3'];
    volumeM3 = json['volume_m3'];
    weight = json['weight'];
    prePaymentPercentage = json['prepayment_percentage'];
    // paymentAfterLoading = json['payment_unloading'];
    loadAroundTheClock = json['load_around_the_clock'];
    paymentUnloading = json['payment_unloading'];
    mapIdData = json['map_id_data'] != null ? MapIdData.fromJson(json['map_id_data']) : null;

    if (json['response_status'] is List) {
      statuses = json['response_status'].cast<String>();
    }
    cmr = json['cmr'];
    t1 = json['t1'];
    tir = json['tir'];
    driverCash = json['driver_cash'];
    shortName = json['short_name'];
    file1 = json['file_1'];
    file2 = json['file_2'];
    file3 = json['file_3'];
    file4 = json['file_4'];
    file5 = json['file_5'];
    requirements = json['requirements'] != null
        ? json['requirements'] is String
            ? requirements = [json['requirements']]
            : requirements = json['requirements'].cast<String>()
        : [];
    driverComment = json['driver_comment'];
    conditions = json['conditions'];
    currencyId2Data = json['currency_id_2_data'] != null ? CurrencyId2Data.fromJson(json['currency_id_2_data']) : null;
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
      data['firm_id_data'] = companyIdData!.toJson();
    }
    if (vehicleTypeIdData != null) {
      data['vehicle_type_id_data'] = vehicleTypeIdData!.toJson();
    }
    if (cargoTypeIdData != null) {
      data['cargo_type_id_data'] = cargoTypeIdData!.toJson();
    }
    data['company_id'] = companyId;
    data['bid_cash'] = bidCash;
    data['dim_width_special'] = dimWithSpecial;
    data['indicate_status'] = indicateStatus;
    // data['bargain_type'] = bargainType;
    data['body_type_id'] = bodyTypeId;
    data['cargo_type_id'] = cargoTypeId;
    data['comment'] = comment;
    // data['conditions'] = conditions;
    data['date'] = date;
    data['guid'] = guid;
    data['load_time'] = loadTime;
    data['load_capacity'] = loadCapacity;
    data['load_location'] = loadLocation;
    data['measurement_id'] = measurementId;
    data['number_of_cars'] = numberOfCars;
    // data['status'] = status;
    data['unload_location'] = unloadLocation;
    data['users_id'] = usersId;
    data['users_id_3'] = usersId3;
    data['volume_m3'] = volumeM3;
    data['weight'] = weight;
    data['prepayment_percentage'] = prePaymentPercentage;
    // data['payment_unloading'] = paymentAfterLoading;
    data['load_around_the_clock'] = loadAroundTheClock;
    data['driver_cash'] = driverCash;
    data['short_name'] = shortName;
    data['requirements'] = requirements;
    data['driver_comment'] = driverComment;

    data['file_1'] = file1;
    data['file_2'] = file2;
    data['file_3'] = file3;
    data['file_4'] = file4;
    data['file_5'] = file5;

    data['conditions'] = conditions;
    if (currencyId2Data != null) {
      data['currency_id_2_data'] = currencyId2Data!.toJson();
    }
    data['phone'] = phone;
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
  });

  CityData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    addressId = json['address_id'];
    city = json['city'];
    guid = json['guid'];
    name = json['name'];
    nameEn = json['name_en'];
    nameRu = json['name_ru'];
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

class MapIdData {
  MapIdData({
    this.v,
    this.id,
    this.guid,
    this.paymentType,
  });

  MapIdData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    guid = json['guid'];
    paymentType = json['payment_type'];
  }

  num? v;
  dynamic id;
  String? guid;
  String? paymentType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['guid'] = guid;
    map['payment_type'] = paymentType;
    return map;
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
    this.nameEn,
    this.nameRu,
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
  CompanyIdData({
    this.v,
    this.id,
    this.bankDetails,
    this.buildingAddress,
    this.companyDirection,
    this.companyType,
    this.email,
    this.fullName,
    this.guid,
    this.name,
    this.phoneNumber,
    this.tin,
  });

  CompanyIdData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    bankDetails = json['bank_details'];
    buildingAddress = json['building_address'];
    companyDirection = json['company_direction'].cast<String>();
    companyType = (json['company_type'] is String) ? [json['company_type']] : json['company_type'].cast<String>();
    email = json['email'];
    fullName = json['full_name'];
    guid = json['guid'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    tin = json['tin'];
  }

  num? v;
  dynamic id;
  String? bankDetails;
  String? buildingAddress;
  List<String>? companyDirection;
  List<String>? companyType;
  String? email;
  String? fullName;
  String? guid;
  String? name;
  String? phoneNumber;
  String? tin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['bank_details'] = bankDetails;
    map['building_address'] = buildingAddress;
    map['company_direction'] = companyDirection;
    map['company_type'] = companyType;
    map['email'] = email;
    map['full_name'] = fullName;
    map['guid'] = guid;
    map['name'] = name;
    map['phone_number'] = phoneNumber;
    map['tin'] = tin;
    return map;
  }
}

class VehicleTypeIdData {
  VehicleTypeIdData({
    this.v,
    this.id,
    this.guid,
    this.name,
    this.vehicleDeataileType,
  });

  VehicleTypeIdData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    guid = json['guid'];
    name = json['name'];
    vehicleDeataileType = json['vehicle_deataile_type'];
  }

  num? v;
  dynamic id;
  String? guid;
  String? name;
  String? vehicleDeataileType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['guid'] = guid;
    map['name'] = name;
    map['vehicle_deataile_type'] = vehicleDeataileType;
    return map;
  }
}

class OrderTypeIdData {
  String? guid;
  String? name;

  OrderTypeIdData({this.guid, this.name});

  OrderTypeIdData.fromJson(Map<String, dynamic> json) {
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

class UsersId3Data {
  UsersId3Data({
    this.v,
    this.id,
    this.adr,
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
  });

  UsersId3Data.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    // adr = json['adr'] != null ? json['adr'].cast<String>() : [];
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
    // typeDriver = json['type_driver'];
    verified = json['verified'];
    typeDriver = json['type_driver'] is String ? json['type_driver'] : (json['type_driver'] as List).firstOrNull;
  }

  num? v;
  dynamic id;
  List<String>? adr;
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['adr'] = adr;
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
    return map;
  }
}

class CurrencyId2Data {
  CurrencyId2Data({
    this.v,
    this.id,
    this.code,
    this.guid,
    this.name,
    this.photo,
    this.shortName,
  });

  CurrencyId2Data.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    code = json['code'];
    guid = json['guid'];
    name = json['name'];
    photo = json['photo'];
    shortName = json['short_name'];
  }

  num? v;
  dynamic id;
  String? code;
  String? guid;
  String? name;
  String? photo;
  String? shortName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['code'] = code;
    map['guid'] = guid;
    map['name'] = name;
    map['photo'] = photo;
    map['short_name'] = shortName;
    return map;
  }
}

class CargoIdData {
  CargoIdData({
    this.v,
    this.id,
    this.additionalDate,
    this.addressId,
    this.addressId2,
    this.addressIds,
    this.agreementWithCarrierCompany,
    this.bidAmount,
    this.bidCash,
    this.bidNovatNoncash,
    this.bidVatNoncash,
    this.bunks,
    this.cargoType,
    this.cargoTypeId,
    this.cityId,
    this.cityId2,
    this.cmr,
    this.comment,
    this.companyContract,
    this.conditions,
    this.currencyId,
    this.currencyId2,
    this.date,
    this.diameter,
    this.dimHeightSpecial,
    this.dimLengthSpecial,
    this.dimWidthSpecial,
    this.dimensionHeight,
    this.dimensionLength,
    this.dimensionWidth,
    this.distance,
    this.driverCash,
    this.driverComment,
    this.duration,
    this.firmId,
    this.gpsMonitoring,
    this.guid,
    this.height,
    this.hitch,
    this.length,
    this.loadAroundTheClock,
    this.loadCapacity,
    this.loadLocation,
    this.loadTime,
    this.loadindType,
    this.map,
    this.mapId,
    this.measurementId,
    this.med,
    this.moderatorComment,
    this.negotiable,
    this.noHaggling,
    this.note,
    this.numberOfCars,
    this.acceptedOffers,
    this.numberOfOrder,
    this.onMap,
    this.orderStatus,
    this.packageQuantity,
    this.packagesId,
    this.paymentUnloading,
    this.paymentUponUnloading,
    this.paymentWithinDays,
    this.permission,
    this.permissions,
    this.phone,
    this.photo,
    this.photosOrDocuments,
    this.pneumatic,
    this.prepaymentInterest,
    this.prepaymentOfFuel,
    this.prepaymentPercentage,
    this.rateInterest,
    this.rateInterestAfterCompletion,
    this.request,
    this.requirements,
    this.shortName,
    this.status,
    this.strapsNumber,
    this.summa,
    this.t1,
    this.takeAllLoads,
    this.takeAllUnloads,
    this.tir,
    this.unloadAroundTheClock,
    this.unloadLocation,
    this.unloadTime,
    this.usersId,
    this.usersId2,
    this.vehicleId,
    this.vehicleTypeId,
    this.volumeM3,
    this.weight,
    this.width,
    this.workingdayType,
    this.from,
    this.to,
    this.productType,
    this.carType,
    this.asSoonAsA,
    this.asSoonAsB,
  });

  CargoIdData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    additionalDate = json['additional_date'];
    addressId = json['address_id'];
    addressId2 = json['address_id_2'];
    if (json['address_ids'] != null) {
      addressIds = [];
      json['address_ids'].forEach((v) {
        addressIds?.add(v);
      });
    }
    from = json['from'];
    to = json['to'];
    carType = json['car_type'];
    productType = json['product_type'];
    countryCodeFrom = json['country_code_from'];
    countryCodeTo = json['country_code_to'];
    agreementWithCarrierCompany = json['agreement_with_carrier_company'];
    bidAmount = json['bid_amount'];
    bidCash = json['bid_cash'];
    bidNovatNoncash = json['bid_novat_noncash'];
    bidVatNoncash = json['bid_vat_noncash'];
    bunks = json['bunks'];
    cargoType = json['cargo_type'] != null ? json['cargo_type'].cast<String>() : [];
    cargoTypeId = json['cargo_type_id'];
    cityId = json['city_id'];
    cityId2 = json['city_id_2'];
    cmr = json['cmr'];
    comment = json['comment'];
    paymentType = json['payment_type'];
    asSoonAsB = json['as_soon_as_b'];
    asSoonAsA = json['as_soon_as_a'];
    companyContract = json['company_contract'];
    conditions = json['conditions'];
    currencyId = json['currency_id'];
    currencyId2 = json['currency_id_2'];
    date = json['date'];
    diameter = json['diameter'];
    dimHeightSpecial = json['dim_height_special'];
    dimLengthSpecial = json['dim_length_special'];
    dimWidthSpecial = json['dim_width_special'];
    dimensionHeight = json['dimension_height'];
    dimensionLength = json['dimension_length'];
    dimensionWidth = json['dimension_width'];
    distance = json['distance'] ?? 0;
    driverCash = json['driver_cash'];
    driverComment = json['driver_comment'];
    duration = json['duration'];
    firmId = json['firm_id'];
    gpsMonitoring = json['gps_monitoring'];
    guid = json['guid'];
    height = json['height'];
    hitch = json['hitch'];
    length = json['length'];
    loadAroundTheClock = json['load_around_the_clock'];
    loadCapacity = json['load_capacity'];
    loadLocation = json['load_location'];
    loadTime = json['load_time'];
    loadindType = json['loadind_type'];
    map = json['map'];
    mapId = json['map_id'];
    measurementId = json['measurement_id'];
    med = json['med'];
    moderatorComment = json['moderator_comment'];
    negotiable = json['negotiable'];
    noHaggling = json['no_haggling'];
    note = json['note'];
    numberOfCars = json['number_of_cars'];
    acceptedOffers = json['accepted_offers'];
    numberOfOrder = json['number_of_order'];
    onMap = json['on_map'];
    orderStatus = json['order_status'] != null ? json['order_status'].cast<String>() : [];
    packageQuantity = json['package_quantity'];
    packagesId = json['packages_id'];
    paymentUnloading = json['payment_unloading'];
    paymentUponUnloading = json['payment_upon_unloading'];
    paymentWithinDays = json['payment_within_days'];
    // permission =
    // json['permission'] != null ? json['permission'].cast<String>() : [];
    // permissions =
    // json['permissions'] != null  ? json['permissions'].cast<String>() : [];
    phone = json['phone'];
    photo = json['photo'];
    photosOrDocuments = json['photos_or_documents'];
    pneumatic = json['pneumatic'];
    prepaymentInterest = json['prepayment_interest'];
    prepaymentOfFuel = json['prepayment_of_fuel'];
    prepaymentPercentage = json['prepayment_percentage'];
    rateInterest = json['rate_interest'];
    rateInterestAfterCompletion = json['rate_interest_after_completion'];
    request = json['request'];
    // requirements =
    // json['requirements'] != null ? json['requirements'].cast<String>() : [];
    shortName = json['short_name'];
    status = json['status'];
    strapsNumber = json['straps_number'];
    summa = json['summa'];
    t1 = json['t1'];
    takeAllLoads = json['take_all_loads'];
    takeAllUnloads = json['take_all_unloads'];
    tir = json['tir'];
    unloadAroundTheClock = json['unload_around_the_clock'];
    unloadLocation = json['unload_location'];
    unloadTime = json['unload_time'];
    usersId = json['users_id'];
    usersId2 = json['users_id_2'];
    vehicleId = json['vehicle_id'];
    vehicleTypeId = json['vehicle_type_id'];
    volumeM3 = json['volume_m3'];
    weight = json['weight'];
    width = json['width'];
    workingdayType = json['workingday_type'];
  }

  String? from;
  String? to;
  String? countryCodeFrom;
  String? countryCodeTo;
  String? carType;
  String? paymentType;
  bool? asSoonAsA;
  bool? asSoonAsB;
  num? v;
  dynamic id;
  dynamic additionalDate;
  String? addressId;
  String? addressId2;
  String? productType;
  List<dynamic>? addressIds;
  bool? agreementWithCarrierCompany;
  num? bidAmount;
  num? bidCash;
  dynamic bidNovatNoncash;
  dynamic bidVatNoncash;
  bool? bunks;
  List<String>? cargoType;
  String? cargoTypeId;
  String? cityId;
  String? cityId2;
  bool? cmr;
  String? comment;
  bool? companyContract;
  num? conditions;
  String? currencyId;
  String? currencyId2;
  String? date;
  num? diameter;
  dynamic dimHeightSpecial;
  num? dimLengthSpecial;
  dynamic dimWidthSpecial;
  dynamic dimensionHeight;
  dynamic dimensionLength;
  dynamic dimensionWidth;
  num? distance;
  num? driverCash;
  String? driverComment;
  String? duration;
  String? firmId;
  bool? gpsMonitoring;
  String? guid;
  num? height;
  bool? hitch;
  num? length;
  bool? loadAroundTheClock;
  num? loadCapacity;
  String? loadLocation;
  String? loadTime;
  String? loadindType;
  String? map;
  String? mapId;
  String? measurementId;
  bool? med;
  String? moderatorComment;
  bool? negotiable;
  bool? noHaggling;
  String? note;
  num? numberOfCars;
  num? acceptedOffers;
  String? numberOfOrder;
  bool? onMap;
  List<String>? orderStatus;
  num? packageQuantity;
  String? packagesId;
  dynamic paymentUnloading;
  bool? paymentUponUnloading;
  num? paymentWithinDays;
  List<String>? permission;
  List<String>? permissions;
  String? phone;
  String? photo;
  String? photosOrDocuments;
  bool? pneumatic;
  num? prepaymentInterest;
  bool? prepaymentOfFuel;
  num? prepaymentPercentage;
  dynamic rateInterest;
  dynamic rateInterestAfterCompletion;
  bool? request;
  List<String>? requirements;
  String? shortName;
  String? status;
  num? strapsNumber;
  dynamic summa;
  bool? t1;
  bool? takeAllLoads;
  bool? takeAllUnloads;
  bool? tir;
  bool? unloadAroundTheClock;
  String? unloadLocation;
  String? unloadTime;
  String? usersId;
  String? usersId2;
  String? vehicleId;
  String? vehicleTypeId;
  num? volumeM3;
  num? weight;
  String? width;
  String? workingdayType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['additional_date'] = additionalDate;
    map['address_id'] = addressId;
    map['address_id_2'] = addressId2;
    if (addressIds != null) {
      map['address_ids'] = addressIds?.map((v) => v.toJson()).toList();
    }
    map['agreement_with_carrier_company'] = agreementWithCarrierCompany;
    map['bid_amount'] = bidAmount;
    map['bid_cash'] = bidCash;
    map['bid_novat_noncash'] = bidNovatNoncash;
    map['bid_vat_noncash'] = bidVatNoncash;
    map['bunks'] = bunks;
    map['cargo_type'] = cargoType;
    map['cargo_type_id'] = cargoTypeId;
    map['city_id'] = cityId;
    map['city_id_2'] = cityId2;
    map['cmr'] = cmr;
    map['comment'] = comment;
    map['company_contract'] = companyContract;
    map['conditions'] = conditions;
    map['currency_id'] = currencyId;
    map['currency_id_2'] = currencyId2;
    map['date'] = date;
    map['diameter'] = diameter;
    map['dim_height_special'] = dimHeightSpecial;
    map['dim_length_special'] = dimLengthSpecial;
    map['dim_width_special'] = dimWidthSpecial;
    map['dimension_height'] = dimensionHeight;
    map['dimension_length'] = dimensionLength;
    map['dimension_width'] = dimensionWidth;
    map['distance'] = distance;
    map['driver_cash'] = driverCash;
    map['driver_comment'] = driverComment;
    map['duration'] = duration;
    map['firm_id'] = firmId;
    map['gps_monitoring'] = gpsMonitoring;
    map['guid'] = guid;
    map['height'] = height;
    map['hitch'] = hitch;
    map['length'] = length;
    map['load_around_the_clock'] = loadAroundTheClock;
    map['load_capacity'] = loadCapacity;
    map['load_location'] = loadLocation;
    map['load_time'] = loadTime;
    map['loadind_type'] = loadindType;
    map['map'] = map;
    map['map_id'] = mapId;
    map['measurement_id'] = measurementId;
    map['med'] = med;
    map['moderator_comment'] = moderatorComment;
    map['negotiable'] = negotiable;
    map['no_haggling'] = noHaggling;
    map['note'] = note;
    map['number_of_cars'] = numberOfCars;
    map['accepted_offers'] = acceptedOffers;
    map['number_of_order'] = numberOfOrder;
    map['on_map'] = onMap;
    map['order_status'] = orderStatus;
    map['package_quantity'] = packageQuantity;
    map['packages_id'] = packagesId;
    map['payment_unloading'] = paymentUnloading;
    map['payment_upon_unloading'] = paymentUponUnloading;
    map['payment_within_days'] = paymentWithinDays;
    map['permission'] = permission;
    map['permissions'] = permissions;
    map['phone'] = phone;
    map['photo'] = photo;
    map['photos_or_documents'] = photosOrDocuments;
    map['pneumatic'] = pneumatic;
    map['prepayment_interest'] = prepaymentInterest;
    map['prepayment_of_fuel'] = prepaymentOfFuel;
    map['prepayment_percentage'] = prepaymentPercentage;
    map['rate_interest'] = rateInterest;
    map['rate_interest_after_completion'] = rateInterestAfterCompletion;
    map['request'] = request;
    map['requirements'] = requirements;
    map['short_name'] = shortName;
    map['status'] = status;
    map['straps_number'] = strapsNumber;
    map['summa'] = summa;
    map['t1'] = t1;
    map['take_all_loads'] = takeAllLoads;
    map['take_all_unloads'] = takeAllUnloads;
    map['tir'] = tir;
    map['unload_around_the_clock'] = unloadAroundTheClock;
    map['unload_location'] = unloadLocation;
    map['unload_time'] = unloadTime;
    map['users_id'] = usersId;
    map['users_id_2'] = usersId2;
    map['vehicle_id'] = vehicleId;
    map['vehicle_type_id'] = vehicleTypeId;
    map['volume_m3'] = volumeM3;
    map['weight'] = weight;
    map['width'] = width;
    map['workingday_type'] = workingdayType;
    return map;
  }
}
