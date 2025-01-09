class GetOrderByNotificationResponseModel {
  String? status;
  String? description;
  Data? data;

  GetOrderByNotificationResponseModel({
    this.status,
    this.description,
    this.data,
  });

  GetOrderByNotificationResponseModel.fromJson(Map<String, dynamic> json) {
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
    data =
    json['data'] != null ? OrderDetailsData.fromJson(json['data']) : null;
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
  UserId2Data? userId2Data;
  UsersId3Data? usersId3Data;
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
  String? cargoId;
  num? dimWithSpecial;
  String? companyId;

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
  List<String>? provisions;
  num? distance;
  List<String>? permission;

  OrderDetails({
    this.addressId,
    this.addressId2,
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
    this.cargoId,
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
    this.provisions,
    this.distance,
    this.permission,
  });

  OrderDetails.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressId2 = json['address_id_2'];
    distance = json['distance'];
    permission = json['permission'].cast<String>();
    addressIdData = json['address_id_data'] != null
        ? AddressIdData.fromJson(json['address_id_data'])
        : null;
    addressId2Data = json['address_id_2_data'] != null
        ? AddressIdData.fromJson(json['address_id_2_data'])
        : null;
    currencyIdData = json['currency_id_data'] != null
        ? CurrencyIdData.fromJson(json['currency_id_data'])
        : null;
    companyIdData = json['company_id_data'] != null
        ? CompanyIdData.fromJson(json['company_id_data'])
        : null;
    vehicleTypeIdData = json['vehicle_type_id_data'] != null
        ? VehicleTypeIdData.fromJson(json['vehicle_type_id_data'])
        : null;
    cargoTypeIdData = json['cargo_type_id_data'] != null
        ? OrderTypeIdData.fromJson(json['cargo_type_id_data'])
        : null;
    userId2Data = json['users_id_2_data'] != null
        ? UserId2Data.fromJson(json['users_id_2_data'])
        : null;
    usersId3Data = json['users_id_3_data'] != null
        ? UsersId3Data.fromJson(json['users_id_3_data'])
        : null;
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
    numberOfCars = json['number_of_cars'];
    // status = json['status'].cast<String>();
    unloadLocation = json['unload_location'];
    usersId = json['users_id'];
    usersId3 = json['users_id_3'];
    volumeM3 = json['volume_m3'];
    weight = json['weight'];
    prePaymentPercentage = json['prepayment_percentage'];
    // paymentAfterLoading = json['payment_unloading'];
    loadAroundTheClock = json['load_around_the_clock'];
    paymentUnloading = json['payment_unloading'];
    mapIdData = json['map_id_data'] != null
        ? MapIdData.fromJson(json['map_id_data'])
        : null;

    if (json['response_status'] is List) {
      statuses = json['response_status'].cast<String>();
    }
    cmr = json['cmr'];
    t1 = json['t1'];
    tir = json['tir'];
    cargoId = json['cargo_id'];
    provisions = json['provisions'].cast<String>();
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
    data['payment_unloading'] = paymentUnloading;
    if (mapIdData != null) {
      data['map_id_data'] = mapIdData!.toJson();
    }
    data['response_status'] = statuses;
    data['cmr'] = cmr;
    data['t1'] = t1;
    data['tir'] = tir;
    data['cargo_id'] = cargoId;
    data['provisions'] = provisions;
    return data;
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
  List<String>? type;

  AddressIdData({
    this.addressId,
    this.code,
    this.guid,
    this.name,
    this.type,
  });

  AddressIdData.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    code = json['code'];
    guid = json['guid'];
    name = json['name'];
    type = json['type'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['code'] = code;
    data['guid'] = guid;
    data['name'] = name;
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
    typeDriver = json['type_driver'];
    verified = json['verified'];
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
