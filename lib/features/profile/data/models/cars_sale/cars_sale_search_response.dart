class CarsSaleSearchResponse {
  CarsSaleSearchResponse({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  CarsSaleSearchResponse.fromJson(Map json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? MainData.fromJson(json['data']) : null;
    customMessage = json['custom_message'];
  }

  String? status;
  String? description;
  MainData? data;
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

class MainData {
  MainData({
    this.tableSlug,
    this.data,
  });

  MainData.fromJson(Map json) {
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
        response?.add(RecommendationListResponse.fromJson(v));
      });
    }
  }

  num? count;
  List<RecommendationListResponse>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class RecommendationListResponse {
  RecommendationListResponse({
    this.accidentInformation,
    this.adType,
    this.address,
    this.addressId,
    this.addressIdData,
    this.availability,
    this.bodyTypeId,
    this.bodyTypeIdData,
    this.brandId,
    this.brandIdData,
    this.busType,
    this.cabineType,
    this.capacity,
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
    this.modelId,
    this.modelIdData,
    this.name,
    this.numberOfSeats,
    this.photo,
    this.power,
    this.price,
    this.saleId,
    this.state,
    this.status,
    this.suspension,
    this.tractionType,
    this.tractorType,
    this.transmission,
    this.type,
    this.typeOfSpecialEquipmentId,
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

  RecommendationListResponse.fromJson(Map json) {
    accidentInformation = json['accident_information'];
    // adType = json['ad_type'] != null ? json['ad_type'].cast<String>() : [];
    address = json['address'];
    addressId = json['address_id'];
    addressIdData = AddressIdData.fromJson(json['address_id_data']);
    availability = json['availability'];
    bodyTypeId = json['body_type_id'];
    bodyTypeIdData = json['body_type_id_data'];
    brandId = json['brand_id'];
    brandIdData = json['brand_id_data'];
    busType = json['bus_type'];
    cabineType = json['cabine_type'];
    capacity = json['capacity'];
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
    modelId = json['model_id'];
    modelIdData = json['model_id_data'];
    name = json['name'];
    numberOfSeats = json['number_of_seats'];
    photo = json['photo'];
    power = json['power'];
    price = json['price'];
    saleId = json['sale_id'];
    state = json['state'];
    // status = json['status'];
    suspension = json['suspension'];
    tractionType = json['traction_type'];
    tractorType = json['tractor_type'];
    transmission = json['transmission'];
    // type = json['type'];
    typeOfSpecialEquipmentId = json['type_of_special_equipment_id'];
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
  List<String>? adType;
  String? address;
  dynamic addressId;
  AddressIdData? addressIdData;
  String? availability;
  dynamic bodyTypeId;
  dynamic bodyTypeIdData;
  dynamic brandId;
  dynamic brandIdData;
  String? busType;
  String? cabineType;
  dynamic capacity;
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
  dynamic modelId;
  dynamic modelIdData;
  String? name;
  dynamic numberOfSeats;
  String? photo;
  dynamic power;
  num? price;
  String? saleId;
  String? state;
  String? status;
  String? suspension;
  String? tractionType;
  String? tractorType;
  String? transmission;
  String? type;
  dynamic typeOfSpecialEquipmentId;
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
    map['address_id_data'] = addressIdData?.toJson();
    map['availability'] = availability;
    map['body_type_id'] = bodyTypeId;
    map['body_type_id_data'] = bodyTypeIdData;
    map['brand_id'] = brandId;
    map['brand_id_data'] = brandIdData;
    map['bus_type'] = busType;
    map['cabine_type'] = cabineType;
    map['capacity'] = capacity;
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
    map['model_id'] = modelId;
    map['model_id_data'] = modelIdData;
    map['name'] = name;
    map['number_of_seats'] = numberOfSeats;
    map['photo'] = photo;
    map['power'] = power;
    map['price'] = price;
    map['sale_id'] = saleId;
    map['state'] = state;
    map['status'] = status;
    map['suspension'] = suspension;
    map['traction_type'] = tractionType;
    map['tractor_type'] = tractorType;
    map['transmission'] = transmission;
    map['type'] = type;
    map['type_of_special_equipment_id'] = typeOfSpecialEquipmentId;
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
    this.birthdate,
    this.clientTypeId,
    this.companyId,
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
    this.verified,
    this.typeDriver,
  });

  UsersIdData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    birthdate = json['birthdate'];
    clientTypeId = json['client_type_id'];
    companyId = json['company_id'];
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
    verified = json['verified'];
    // typeDriver = json['type_driver'] ?? [];
  }

  num? v;
  dynamic id;
  String? birthdate;
  String? clientTypeId;
  String? companyId;
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
  bool? verified;
  List<dynamic>? typeDriver;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['birthdate'] = birthdate;
    map['client_type_id'] = clientTypeId;
    map['company_id'] = companyId;
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
    map['verified'] = verified;
    map['type_driver'] = typeDriver;
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

class AddressIdData {
  String name;

  AddressIdData({
    required this.name,
  });

  factory AddressIdData.fromJson(Map json) => AddressIdData(
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
