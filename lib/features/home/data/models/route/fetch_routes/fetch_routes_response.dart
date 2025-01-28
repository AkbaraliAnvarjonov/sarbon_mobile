import '../../../../../../core/utils/utils.dart';

class FetchRoutesResponse {
  FetchRoutesResponse({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  FetchRoutesResponse.fromJson(Map json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? RoutesMainDate.fromJson(json['data']) : null;
    customMessage = json['custom_message'];
  }

  String? status;
  String? description;
  RoutesMainDate? data;
  String? customMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['description'] = description;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['custom_message'] = customMessage;
    return map;
  }
}

class RoutesMainDate {
  RoutesMainDate({
    this.tableSlug,
    this.data,
  });

  RoutesMainDate.fromJson(Map json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? tableSlug;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['table_slug'] = tableSlug;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.count,
    this.response,
  });

  Data.fromJson(Map json) {
    count = json['count'];
    if (json['response'] != null) {
      response = [];
      json['response'].forEach((v) {
        response?.add(RoutesListResponse.fromJson(v));
      });
    }
  }

  num? count;
  List<RoutesListResponse>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class RoutesListResponse {
  RoutesListResponse({
    this.addressId,
    this.addressId2,
    this.addressId2Data,
    this.addressIdData,
    this.capacity,
    this.cityId,
    this.cityId2,
    this.cityId2Data,
    this.cityIdData,
    this.date,
    this.guid,
    this.routeId,
    this.shortName,
    this.usersId,
    this.usersIdData,
    this.vehicleId,
    this.vehicleIdData,
    this.volume,
  });

  RoutesListResponse.fromJson(Map json) {
    addressId = json['address_id'];
    addressId2 = json['address_id_2'];
    addressId2Data = json['address_id_2_data'] != null ? AddressId2Data.fromJson(json['address_id_2_data']) : null;
    addressIdData = json['address_id_data'] != null ? AddressIdData.fromJson(json['address_id_data']) : null;
    capacity = json['capacity'];
    cityId = json['city_id'];
    cityId2 = json['city_id_2'];
    cityId2Data = json['city_id_2_data'] != null ? CityId2Data.fromJson(json['city_id_2_data']) : null;
    cityIdData = json['city_id_data'] != null ? CityIdData.fromJson(json['city_id_data']) : null;
    date = json['date'];
    guid = json['guid'];
    routeId = json['route_id'];
    shortName = json['short_name'];
    usersId = json['users_id'];
    usersIdData = json['users_id_data'] != null ? UsersIdData.fromJson(json['users_id_data']) : null;
    vehicleId = json['vehicle_id'];
    vehicleIdData = json['vehicle_id_data'] != null ? VehicleIdData.fromJson(json['vehicle_id_data']) : null;
    volume = json['volume'];
    from = json['from'];
    to = json['to'];
    shortFrom = json['short_name_from'];
    shortTo = json['short_name_to'];
  }

  String? addressId;
  String? addressId2;
  AddressId2Data? addressId2Data;
  AddressIdData? addressIdData;
  num? capacity;
  String? cityId;
  String? cityId2;
  CityId2Data? cityId2Data;
  CityIdData? cityIdData;
  String? date;
  String? guid;
  String? routeId;
  String? shortName;
  String? usersId;
  String? from;
  String? to;
  String? shortFrom;
  String? shortTo;
  UsersIdData? usersIdData;
  String? vehicleId;
  VehicleIdData? vehicleIdData;
  num? volume;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address_id'] = addressId;
    map['address_id_2'] = addressId2;
    if (addressId2Data != null) {
      map['address_id_2_data'] = addressId2Data?.toJson();
    }
    if (addressIdData != null) {
      map['address_id_data'] = addressIdData?.toJson();
    }
    map['capacity'] = capacity;
    map['city_id'] = cityId;
    map['city_id_2'] = cityId2;
    if (cityId2Data != null) {
      map['city_id_2_data'] = cityId2Data?.toJson();
    }
    if (cityIdData != null) {
      map['city_id_data'] = cityIdData?.toJson();
    }
    map['date'] = date;
    map['guid'] = guid;
    map['route_id'] = routeId;
    map['short_name'] = shortName;
    map['users_id'] = usersId;
    if (usersIdData != null) {
      map['users_id_data'] = usersIdData?.toJson();
    }
    map['vehicle_id'] = vehicleId;
    if (vehicleIdData != null) {
      map['vehicle_id_data'] = vehicleIdData?.toJson();
    }
    map['volume'] = volume;
    return map;
  }
}

class VehicleIdData {
  VehicleIdData({
    this.v,
    this.id,
    this.bid,
    this.bodyDimensions,
    this.capacity,
    this.carNumber,
    this.carPhoto,
    this.carPosition,
    this.carVinCode,
    this.cargoTypeId,
    this.comment,
    this.dangerousGood,
    this.freeGpsMonitoring,
    this.guid,
    this.height,
    this.konika,
    this.length,
    this.loadRadius,
    this.loadTypeId3,
    this.negotiable,
    this.numberTrailer,
    this.paymentCash,
    this.paymentNoncashNovatBid,
    this.paymentNoncashVatBid,
    this.readyToLoad,
    this.shortNames,
    this.status,
    this.techPassport,
    this.techPassportTrailer,
    this.trailerTypeId,
    this.unloadingRadius,
    this.usersId,
    this.weight,
    this.width,
  });

  VehicleIdData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    bid = json['bid'];
    bodyDimensions = json['body_dimensions'];
    capacity = json['capacity'];
    carNumber = json['car_number'];
    carPhoto = json['car_photo'];
    carPosition = json['car_position'] != null ? json['car_position'].cast<String>() : [];
    carVinCode = json['car_vin_code'];
    cargoTypeId = json['cargo_type_id'];
    comment = json['comment'];
    dangerousGood = json['dangerous_good'];
    freeGpsMonitoring = json['free_gps_monitoring'];
    guid = json['guid'];
    height = json['height'];
    konika = json['konika'];
    length = json['length'];
    loadRadius = json['load_radius'];
    loadTypeId3 = json['load_type_id_3'];
    negotiable = json['negotiable'];
    numberTrailer = json['number_trailer'];
    paymentCash = json['payment_cash'];
    paymentNoncashNovatBid = json['payment_noncash_novat_bid'];
    paymentNoncashVatBid = json['payment_noncash_vat_bid'];
    readyToLoad = json['ready_to_load'];
    shortNames = json['short_names'];
    status = json['status'] != null ? json['status'].cast<String>() : [];
    techPassport = json['tech_passport'];
    techPassportTrailer = json['tech_passport_trailer'];
    trailerTypeId = json['trailer_type_id'];
    unloadingRadius = json['unloading_radius'];
    usersId = json['users_id'];
    weight = json['weight'];
    width = json['width'];
  }

  num? v;
  dynamic id;
  dynamic bid;
  bool? bodyDimensions;
  num? capacity;
  String? carNumber;
  String? carPhoto;
  List<String>? carPosition;
  dynamic carVinCode;
  String? cargoTypeId;
  String? comment;
  String? dangerousGood;
  bool? freeGpsMonitoring;
  String? guid;
  num? height;
  bool? konika;
  dynamic length;
  dynamic loadRadius;
  String? loadTypeId3;
  bool? negotiable;
  String? numberTrailer;
  dynamic paymentCash;
  dynamic paymentNoncashNovatBid;
  dynamic paymentNoncashVatBid;
  bool? readyToLoad;
  String? shortNames;
  List<String>? status;
  String? techPassport;
  String? techPassportTrailer;
  String? trailerTypeId;
  dynamic unloadingRadius;
  String? usersId;
  dynamic weight;
  dynamic width;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['bid'] = bid;
    map['body_dimensions'] = bodyDimensions;
    map['capacity'] = capacity;
    map['car_number'] = carNumber;
    map['car_photo'] = carPhoto;
    map['car_position'] = carPosition;
    map['car_vin_code'] = carVinCode;
    map['cargo_type_id'] = cargoTypeId;
    map['comment'] = comment;
    map['dangerous_good'] = dangerousGood;
    map['free_gps_monitoring'] = freeGpsMonitoring;
    map['guid'] = guid;
    map['height'] = height;
    map['konika'] = konika;
    map['length'] = length;
    map['load_radius'] = loadRadius;
    map['load_type_id_3'] = loadTypeId3;
    map['negotiable'] = negotiable;
    map['number_trailer'] = numberTrailer;
    map['payment_cash'] = paymentCash;
    map['payment_noncash_novat_bid'] = paymentNoncashNovatBid;
    map['payment_noncash_vat_bid'] = paymentNoncashVatBid;
    map['ready_to_load'] = readyToLoad;
    map['short_names'] = shortNames;
    map['status'] = status;
    map['tech_passport'] = techPassport;
    map['tech_passport_trailer'] = techPassportTrailer;
    map['trailer_type_id'] = trailerTypeId;
    map['unloading_radius'] = unloadingRadius;
    map['users_id'] = usersId;
    map['weight'] = weight;
    map['width'] = width;
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
    this.cargoIds,
    this.cash,
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
    adr = (json['adr'] is String) ? [json['adr']] : (json['adr'] as List?)?.cast<String>() ?? [];

    balance = json['balance'];
    birthdate = json['birthdate'];
    cargoIds = json['cargo_ids'] != null ? json['cargo_ids'].cast<String>() : [];
    cash = json['cash'];
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
  List<String>? adr;
  dynamic balance;
  String? birthdate;
  List<String>? cargoIds;
  num? cash;
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
  dynamic rating;
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
    map['cargo_ids'] = cargoIds;
    map['cash'] = cash;
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

class CityIdData {
  CityIdData({
    this.v,
    this.id,
    this.addressId,
    this.city,
    this.guid,
    this.name,
    this.nameRu,
    this.nameEn,
  });

  CityIdData.fromJson(Map<String, dynamic> json) {
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

class CityId2Data {
  CityId2Data({
    this.v,
    this.id,
    this.addressId,
    this.city,
    this.guid,
    this.name,
    this.nameEn,
    this.nameRu,
  });

  CityId2Data.fromJson(Map<String, dynamic> json) {
    v = json['__v'];
    id = json['_id'];
    addressId = json['address_id'];
    city = json['city'];
    guid = json['guid'];
    name = getLocalizedName(json, 'name');
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

class AddressIdData {
  AddressIdData({
    this.v,
    this.id,
    this.cargoIds,
    this.code,
    this.guid,
    this.logistikasendaninvitationtoorderDisable,
    this.name,
    this.nameRu,
    this.nameEn,
    this.responseIds,
    this.type,
  });

  AddressIdData.fromJson(Map<String, dynamic> json) {
    v = json['__v'];
    id = json['_id'];
    cargoIds = json['cargo_ids'] != null ? json['cargo_ids'].cast<String>() : [];
    code = json['code'];
    guid = json['guid'];
    logistikasendaninvitationtoorderDisable = json['logistika-send-an-invitation-to-order_disable'];
    name = getLocalizedName(json, 'name');
    nameRu = json['name_ru'];
    nameEn = json['name_en'];
    responseIds = json['response_ids'] != null ? json['response_ids'].cast<String>() : [];
    type = json['type'] != null ? json['type'].cast<String>() : [];
  }

  num? v;
  dynamic id;
  List<String>? cargoIds;
  String? code;
  String? guid;
  bool? logistikasendaninvitationtoorderDisable;
  String? name;
  String? nameRu;
  String? nameEn;
  List<String>? responseIds;
  List<String>? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['cargo_ids'] = cargoIds;
    map['code'] = code;
    map['guid'] = guid;
    map['logistika-send-an-invitation-to-order_disable'] = logistikasendaninvitationtoorderDisable;
    map['name'] = name;
    map['name_ru'] = nameRu;
    map['name_en'] = nameEn;
    map['response_ids'] = responseIds;
    map['type'] = type;
    return map;
  }
}

class AddressId2Data {
  AddressId2Data({
    this.v,
    this.id,
    this.cargoIds,
    this.code,
    this.guid,
    this.logistikasendaninvitationtoorderDisable,
    this.name,
    this.nameRu,
    this.nameEn,
    this.responseIds,
    this.type,
  });

  AddressId2Data.fromJson(Map<String, dynamic> json) {
    v = json['__v'];
    id = json['_id'];
    cargoIds = json['cargo_ids'] != null ? json['cargo_ids'].cast<String>() : [];
    code = json['code'];
    guid = json['guid'];
    logistikasendaninvitationtoorderDisable = json['logistika-send-an-invitation-to-order_disable'];
    name = getLocalizedName(json, 'name');
    nameRu = json['name_ru'];
    nameEn = json['name_en'];
    responseIds = json['response_ids'] != null ? json['response_ids'].cast<String>() : [];
    type = json['type'] != null ? json['type'].cast<String>() : [];
  }

  num? v;
  dynamic id;
  List<String>? cargoIds;
  String? code;
  String? guid;
  bool? logistikasendaninvitationtoorderDisable;
  String? name;
  String? nameRu;
  String? nameEn;
  List<String>? responseIds;
  List<String>? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['cargo_ids'] = cargoIds;
    map['code'] = code;
    map['guid'] = guid;
    map['logistika-send-an-invitation-to-order_disable'] = logistikasendaninvitationtoorderDisable;
    map['name'] = name;
    map['name_ru'] = nameRu;
    map['name_en'] = nameEn;
    map['response_ids'] = responseIds;
    map['type'] = type;
    return map;
  }
}
