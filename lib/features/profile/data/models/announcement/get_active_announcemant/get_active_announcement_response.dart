class GetActiveInActiveAnnouncementResponse {
  GetActiveInActiveAnnouncementResponse({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  GetActiveInActiveAnnouncementResponse.fromJson(Map json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    customMessage = json['custom_message'];
  }

  String? status;
  String? description;
  Data? data;
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

class Data {
  Data({
    this.tableSlug,
    this.data,
  });

  Data.fromJson(Map json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? MainData.fromJson(json['data']) : null;
  }

  String? tableSlug;
  MainData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['table_slug'] = tableSlug;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class MainData {
  MainData({
    this.count,
    this.response,
  });

  MainData.fromJson(Map json) {
    count = json['count'];
    if (json['response'] != null) {
      response = [];
      json['response'].forEach((v) {
        response?.add(ActiveAnnouncementListResponse.fromJson(v));
      });
    }
  }

  num? count;
  List<ActiveAnnouncementListResponse>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ActiveAnnouncementListResponse {
  ActiveAnnouncementListResponse({
    this.accidentInformation,
    this.adType,
    this.address,
    this.addressId,
    this.addressIdData,
    this.availability,
    this.bodyTypeIdData,
    this.brandIdData,
    this.busType,
    this.cabineType,
    this.capacity,
    this.cityId,
    this.cityIdData,
    this.contact,
    this.currencyId,
    this.currencyIdData,
    this.description,
    this.driveUnit,
    this.engine,
    this.engineHours,
    this.guid,
    this.height,
    this.length,
    this.loadCapacity,
    this.madeDate,
    this.mileage,
    this.modelIdData,
    this.name,
    this.numberOfSeats,
    this.photo,
    this.power,
    this.price,
    this.state,
    this.status,
    this.suspension,
    this.tractionType,
    this.tractorType,
    this.transmission,
    this.type,
    this.typeOfSpecialEquipmentIdData,
    this.usersId,
    this.usersIdData,
    this.vehicleNumber,
    this.vehicleTypeId,
    this.vehicleTypeIdData,
    this.vinNumber,
    this.volume,
    this.width,
    this.workingWeight,
  });

  ActiveAnnouncementListResponse.fromJson(Map json) {
    accidentInformation = json['accident_information'];
    adType = json['ad_type'];
    address = json['address'];
    addressId = json['address_id'];
    addressIdData = json['address_id_data'] != null
        ? AddressIdData.fromJson(json['address_id_data'])
        : null;
    availability = json['availability'];
    bodyTypeIdData = json['body_type_id_data'];
    brandIdData = json['brand_id_data'];
    busType = json['bus_type'];
    cabineType = json['cabine_type'];
    capacity = json['capacity'];
    cityId = json['city_id'];
    cityIdData = json['city_id_data'] != null
        ? CityIdData.fromJson(json['city_id_data'])
        : null;
    contact = json['contact'];
    currencyId = json['currency_id'];
    currencyIdData = json['currency_id_data'] != null
        ? CurrencyIdData.fromJson(json['currency_id_data'])
        : null;
    description = json['description'];
    driveUnit = json['drive_unit'];
    engine = json['engine'];
    engineHours = json['engine_hours'];
    guid = json['guid'];
    height = json['height'];
    length = json['length'];
    loadCapacity = json['load_capacity'];
    madeDate = json['made_date'];
    mileage = json['mileage'];
    modelIdData = json['model_id_data'];
    name = json['name'];
    numberOfSeats = json['number_of_seats'];
    photo = json['photo'];
    power = json['power'];
    price = json['price'];
    state = json['state'];
    status = json['status'] != null ? json['status'].cast<String>() : [];
    suspension = json['suspension'];
    tractionType = json['traction_type'];
    tractorType = json['tractor_type'];
    transmission = json['transmission'];
    type = json['type'];
    typeOfSpecialEquipmentIdData = json['type_of_special_equipment_id_data'];
    usersId = json['users_id'];
    usersIdData = json['users_id_data'] != null
        ? UsersIdData.fromJson(json['users_id_data'])
        : null;
    vehicleNumber = json['vehicle_number'];
    vehicleTypeId = json['vehicle_type_id'];
    vehicleTypeIdData = json['vehicle_type_id_data'] != null
        ? VehicleTypeIdData.fromJson(json['vehicle_type_id_data'])
        : null;
    vinNumber = json['vin_number'];
    volume = json['volume'];
    width = json['width'];
    workingWeight = json['working_weight'];
  }

  String? accidentInformation;
  String? adType;
  String? address;
  String? addressId;
  AddressIdData? addressIdData;
  String? availability;
  dynamic bodyTypeIdData;
  dynamic brandIdData;
  String? busType;
  String? cabineType;
  dynamic capacity;
  String? cityId;
  CityIdData? cityIdData;
  String? contact;
  String? currencyId;
  CurrencyIdData? currencyIdData;
  String? description;
  String? driveUnit;
  String? engine;
  dynamic engineHours;
  String? guid;
  dynamic height;
  dynamic length;
  dynamic loadCapacity;
  String? madeDate;
  dynamic mileage;
  dynamic modelIdData;
  String? name;
  dynamic numberOfSeats;
  String? photo;
  dynamic power;
  num? price;
  String? state;
  List<String>? status;
  String? suspension;
  String? tractionType;
  String? tractorType;
  String? transmission;
  String? type;
  dynamic typeOfSpecialEquipmentIdData;
  String? usersId;
  UsersIdData? usersIdData;
  String? vehicleNumber;
  String? vehicleTypeId;
  VehicleTypeIdData? vehicleTypeIdData;
  dynamic vinNumber;
  dynamic volume;
  dynamic width;
  dynamic workingWeight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accident_information'] = accidentInformation;
    map['ad_type'] = adType;
    map['address'] = address;
    map['address_id'] = addressId;
    if (addressIdData != null) {
      map['address_id_data'] = addressIdData?.toJson();
    }
    map['availability'] = availability;
    map['body_type_id_data'] = bodyTypeIdData;
    map['brand_id_data'] = brandIdData;
    map['bus_type'] = busType;
    map['cabine_type'] = cabineType;
    map['capacity'] = capacity;
    map['city_id'] = cityId;
    if (cityIdData != null) {
      map['city_id_data'] = cityIdData?.toJson();
    }
    map['contact'] = contact;
    map['currency_id'] = currencyId;
    if (currencyIdData != null) {
      map['currency_id_data'] = currencyIdData?.toJson();
    }
    map['description'] = description;
    map['drive_unit'] = driveUnit;
    map['engine'] = engine;
    map['engine_hours'] = engineHours;
    map['guid'] = guid;
    map['height'] = height;
    map['length'] = length;
    map['load_capacity'] = loadCapacity;
    map['made_date'] = madeDate;
    map['mileage'] = mileage;
    map['model_id_data'] = modelIdData;
    map['name'] = name;
    map['number_of_seats'] = numberOfSeats;
    map['photo'] = photo;
    map['power'] = power;
    map['price'] = price;
    map['state'] = state;
    map['status'] = status;
    map['suspension'] = suspension;
    map['traction_type'] = tractionType;
    map['tractor_type'] = tractorType;
    map['transmission'] = transmission;
    map['type'] = type;
    map['type_of_special_equipment_id_data'] = typeOfSpecialEquipmentIdData;
    map['users_id'] = usersId;
    if (usersIdData != null) {
      map['users_id_data'] = usersIdData?.toJson();
    }
    map['vehicle_number'] = vehicleNumber;
    map['vehicle_type_id'] = vehicleTypeId;
    if (vehicleTypeIdData != null) {
      map['vehicle_type_id_data'] = vehicleTypeIdData?.toJson();
    }
    map['vin_number'] = vinNumber;
    map['volume'] = volume;
    map['width'] = width;
    map['working_weight'] = workingWeight;
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
    adr = json['adr'];
    balance = json['balance'];
    birthdate = json['birthdate'];
    cargoIds =
    json['cargo_ids'] != null ? json['cargo_ids'].cast<String>() : [];
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
  String? adr;
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

class CurrencyIdData {
  CurrencyIdData({
    this.v,
    this.id,
    this.code,
    this.guid,
    this.name,
    this.photo,
    this.shortName,
  });

  CurrencyIdData.fromJson(Map json) {
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

class CityIdData {
  CityIdData({
    this.v,
    this.id,
    this.addressId,
    this.city,
    this.guid,
    this.name,
  });

  CityIdData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    addressId = json['address_id'];
    city = json['city'];
    guid = json['guid'];
    name = json['name'];
  }

  num? v;
  dynamic id;
  String? addressId;
  String? city;
  String? guid;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['address_id'] = addressId;
    map['city'] = city;
    map['guid'] = guid;
    map['name'] = name;
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
    this.responseIds,
    this.type,
  });

  AddressIdData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    cargoIds =
    json['cargo_ids'] != null ? json['cargo_ids'].cast<String>() : [];
    code = json['code'];
    guid = json['guid'];
    logistikasendaninvitationtoorderDisable =
    json['logistika-send-an-invitation-to-order_disable'];
    name = json['name'];
    responseIds =
    json['response_ids'] != null ? json['response_ids'].cast<String>() : [];
    type = json['type'] != null ? json['type'].cast<String>() : [];
  }

  num? v;
  dynamic id;
  List<String>? cargoIds;
  String? code;
  String? guid;
  bool? logistikasendaninvitationtoorderDisable;
  String? name;
  List<String>? responseIds;
  List<String>? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['cargo_ids'] = cargoIds;
    map['code'] = code;
    map['guid'] = guid;
    map['logistika-send-an-invitation-to-order_disable'] =
        logistikasendaninvitationtoorderDisable;
    map['name'] = name;
    map['response_ids'] = responseIds;
    map['type'] = type;
    return map;
  }
}

