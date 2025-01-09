// ignore_for_file: avoid_dynamic_calls, inference_failure_on_untyped_parameter

class FavouriteCargoResponse {
  FavouriteCargoResponse({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  FavouriteCargoResponse.fromJson(Map json) {
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
    this.isCached,
  });

  MainData.fromJson(Map json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    isCached = json['is_cached'];
  }

  String? tableSlug;
  Data? data;
  bool? isCached;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['table_slug'] = tableSlug;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['is_cached'] = isCached;
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
        response?.add(FavouriteListResponse.fromJson(v));
      });
    }
  }

  num? count;
  List<FavouriteListResponse>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class FavouriteListResponse {
  FavouriteListResponse({
    this.additionalDate,
    this.addressId,
    this.addressId2,
    this.addressId2Data,
    this.addressIdData,
    this.addressIds,
    this.adr,
    this.agreementWithCarrierCompany,
    this.bargainType,
    this.bidAmount,
    this.bidCash,
    this.bidNovatNoncash,
    this.bidVatNoncash,
    this.bodyTypeIdData,
    this.cargoTypeId,
    this.cargoTypeIdData,
    this.comment,
    this.companyIdData,
    this.conditions,
    this.currencyId,
    this.currencyIdData,
    this.date,
    this.dimHeightSpecial,
    this.dimLengthSpecial,
    this.dimWidthSpecial,
    this.dimensionHeight,
    this.dimensionLength,
    this.dimensionWidth,
    this.driverComment,
    this.gpsMonitoring,
    this.guid,
    this.loadAroundTheClock,
    this.loadCapacity,
    this.loadLocation,
    this.loadTime,
    this.loadindType,
    this.logistikasendaninvitationtoorderDisable,
    this.logistikasendanofferforexactlyonedriverDisable,
    this.logistikasendlistofaddressnameDisable,
    this.map,
    this.mapId,
    this.mapIdData,
    this.measurementId,
    this.measurementIdData,
    this.note,
    this.numberOfCars,
    this.numberOfOrder,
    this.onMap,
    this.orderStatus,
    this.packageQuantity,
    this.packagesId,
    this.packagesIdData,
    this.paymentUnloading,
    this.paymentWithinDays,
    this.permissions,
    this.phone,
    this.photo,
    this.photosOrDocuments,
    this.prepaymentOfFuel,
    this.prepaymentPercentage,
    this.rateInterest,
    this.rateInterestAfterCompletion,
    this.requirements,
    this.shortName,
    this.status,
    this.strapsNumber,
    this.summa,
    this.takeAllLoads,
    this.takeAllUnloads,
    this.unloadAroundTheClock,
    this.unloadLocation,
    this.unloadTime,
    this.usersId,
    this.usersId2,
    this.usersId2Data,
    this.usersIdData,
    this.usersIds,
    this.vehicleId,
    this.vehicleIdData,
    this.vehicleTypeIdNaN,
    this.vehicleTypeIdNaNData,
    this.volumeM3,
    this.weight,
    this.workingdayType,
    this.isLiked,
    this.cityIdData,
    this.cityId2Data,
    this.distance,
  });

  FavouriteListResponse.fromJson(Map json) {
    additionalDate = json['additional_date'];
    addressId = json['address_id'];
    addressId2 = json['address_id_2'];
    addressId2Data = json['address_id_2_data'] != null
        ? AddressId2Data.fromJson(json['address_id_2_data'])
        : null;
    addressIdData = json['address_id_data'] != null
        ? AddressIdData.fromJson(json['address_id_data'])
        : null;
    if (json['address_ids'] != null) {
      addressIds = [];
      json['address_ids'].forEach((v) {
        addressIds?.add(v);
      });
    }
    adr = json['adr'];
    agreementWithCarrierCompany = json['agreement_with_carrier_company'];
    // bargainType =
    //     json['bargain_type'] != null ?
    //     json['bargain_type'].cast<String>() : [];
    bidAmount = json['bid_amount'];
    bidCash = json['bid_cash'];
    bidNovatNoncash = json['bid_novat_noncash'];
    bidVatNoncash = json['bid_vat_noncash'];
    bodyTypeIdData = json['body_type_id_data'];
    cargoTypeId = json['cargo_type_id'];
    cargoTypeIdData = json['cargo_type_id_data'] != null
        ? CargoTypeIdData.fromJson(json['cargo_type_id_data'])
        : null;
    comment = json['comment'];
    companyIdData = json['company_id_data'] != null
        ? CompanyIdData.fromJson(json['company_id_data'])
        : null;
    conditions = json['conditions'];
    currencyId = json['currency_id'];
    currencyIdData = json['currency_id_data'] != null
        ? CurrencyIdData.fromJson(json['currency_id_data'])
        : null;
    date = json['date'];
    dimHeightSpecial = json['dim_height_special'];
    dimLengthSpecial = json['dim_length_special'];
    dimWidthSpecial = json['dim_width_special'];
    dimensionHeight = json['dimension_height'];
    dimensionLength = json['dimension_length'];
    dimensionWidth = json['dimension_width'];
    driverComment = json['driver_comment'];
    gpsMonitoring = json['gps_monitoring'];
    guid = json['guid'];
    loadAroundTheClock = json['load_around_the_clock'];
    loadCapacity = json['load_capacity'];
    loadLocation = json['load_location'];
    loadTime = json['load_time'];
    loadindType = json['loadind_type'];
    logistikasendaninvitationtoorderDisable =
        json['logistika-send-an-invitation-to-order_disable'];
    logistikasendanofferforexactlyonedriverDisable =
        json['logistika-send-an-offer-for-exactly-one-driver_disable'];
    logistikasendlistofaddressnameDisable =
        json['logistika-send-list-of-address-name_disable'];
    map = json['map'];
    mapId = json['map_id'];
    mapIdData = json['map_id_data'] != null
        ? MapIdData.fromJson(json['map_id_data'])
        : null;
    measurementId = json['measurement_id'];
    measurementIdData = json['measurement_id_data'] != null
        ? MeasurementIdData.fromJson(json['measurement_id_data'])
        : null;
    note = json['note'];
    numberOfCars = json['number_of_cars'];
    numberOfOrder = json['number_of_order'];
    onMap = json['on_map'];
    // orderStatus =
    //     json['order_status'] != null ?
    //     json['order_status'].cast<String>() : [];
    packageQuantity = json['package_quantity'];
    packagesId = json['packages_id'];
    packagesIdData = json['packages_id_data'];
    paymentUnloading = json['payment_unloading'];
    paymentWithinDays = json['payment_within_days'];
    // permissions =
    //     json['permissions'] != null ?
    //     json['permissions'].cast<String>() : [];
    phone = json['phone'];
    photo = json['photo'];
    photosOrDocuments = json['photos_or_documents'];
    prepaymentOfFuel = json['prepayment_of_fuel'];
    prepaymentPercentage = json['prepayment_percentage'];
    rateInterest = json['rate_interest'];
    rateInterestAfterCompletion = json['rate_interest_after_completion'];
    // requirements =
    //     json['requirements'] != null ?
    //     json['requirements'].cast<String>() : [];
    shortName = json['short_name'];
    status = json['status'];
    strapsNumber = json['straps_number'];
    summa = json['summa'];
    takeAllLoads = json['take_all_loads'];
    takeAllUnloads = json['take_all_unloads'];
    unloadAroundTheClock = json['unload_around_the_clock'];
    unloadLocation = json['unload_location'];
    unloadTime = json['unload_time'];
    usersId = json['users_id'];
    usersId2 = json['users_id_2'];
    usersId2Data = json['users_id_2_data'] != null
        ? UsersId2Data.fromJson(json['users_id_2_data'])
        : null;
    usersIdData = json['users_id_data'] != null
        ? UsersIdData.fromJson(json['users_id_data'])
        : null;
    usersIds =
        json['users_ids'] != null ? json['users_ids'].cast<String>() : [];
    vehicleId = json['vehicle_id'];
    vehicleIdData = json['vehicle_id_data'] != null
        ? VehicleIdData.fromJson(json['vehicle_id_data'])
        : null;
    vehicleTypeIdNaN = json['vehicle_type_id_NaN'];
    vehicleTypeIdNaNData = json['vehicle_type_id_NaN_data'];
    volumeM3 = json['volume_m3'];
    weight = json['weight'];
    workingdayType = json['workingday_type'];
    cityIdData = json['city_id_data'] != null
        ? CityData.fromJson(json['city_id_data'])
        : null;
    cityId2Data = json['city_id_2_data'] != null
        ? CityData.fromJson(json['city_id_2_data'])
        : null;
    distance = json['distance'];
  }

  dynamic additionalDate;
  String? addressId;
  String? addressId2;
  AddressId2Data? addressId2Data;
  AddressIdData? addressIdData;
  List<dynamic>? addressIds;
  dynamic adr;
  bool? agreementWithCarrierCompany;
  List<String>? bargainType;
  dynamic bidAmount;
  num? bidCash;
  dynamic bidNovatNoncash;
  dynamic bidVatNoncash;
  dynamic bodyTypeIdData;
  String? cargoTypeId;
  CargoTypeIdData? cargoTypeIdData;
  String? comment;
  CompanyIdData? companyIdData;
  num? conditions;
  String? currencyId;
  CurrencyIdData? currencyIdData;
  String? date;
  dynamic dimHeightSpecial;
  num? dimLengthSpecial;
  dynamic dimWidthSpecial;
  dynamic dimensionHeight;
  dynamic dimensionLength;
  dynamic dimensionWidth;
  String? driverComment;
  bool? gpsMonitoring;
  String? guid;
  bool? loadAroundTheClock;
  dynamic loadCapacity;
  String? loadLocation;
  String? loadTime;
  String? loadindType;
  bool? logistikasendaninvitationtoorderDisable;
  bool? logistikasendanofferforexactlyonedriverDisable;
  bool? logistikasendlistofaddressnameDisable;
  String? map;
  String? mapId;
  MapIdData? mapIdData;
  String? measurementId;
  MeasurementIdData? measurementIdData;
  String? note;
  num? numberOfCars;
  String? numberOfOrder;
  bool? onMap;
  List<String>? orderStatus;
  num? packageQuantity;
  String? packagesId;
  dynamic packagesIdData;
  dynamic paymentUnloading;
  num? paymentWithinDays;
  List<String>? permissions;
  String? phone;
  String? photo;
  String? photosOrDocuments;
  bool? prepaymentOfFuel;
  num? prepaymentPercentage;
  dynamic rateInterest;
  dynamic rateInterestAfterCompletion;
  List<String>? requirements;
  String? shortName;
  String? status;
  dynamic strapsNumber;
  dynamic summa;
  bool? takeAllLoads;
  bool? takeAllUnloads;
  bool? unloadAroundTheClock;
  String? unloadLocation;
  String? unloadTime;
  String? usersId;
  String? usersId2;
  UsersId2Data? usersId2Data;
  UsersIdData? usersIdData;
  List<String>? usersIds;
  String? vehicleId;
  VehicleIdData? vehicleIdData;
  dynamic vehicleTypeIdNaN;
  dynamic vehicleTypeIdNaNData;
  num? volumeM3;
  num? weight;
  String? workingdayType;
  bool? isLiked;
  CityData? cityIdData;
  CityData? cityId2Data;
  num? distance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['additional_date'] = additionalDate;
    map['address_id'] = addressId;
    map['address_id_2'] = addressId2;
    if (addressId2Data != null) {
      map['address_id_2_data'] = addressId2Data?.toJson();
    }
    if (addressIdData != null) {
      map['address_id_data'] = addressIdData?.toJson();
    }
    if (addressIds != null) {
      map['address_ids'] = addressIds?.map((v) => v.toJson()).toList();
    }
    map['adr'] = adr;
    map['agreement_with_carrier_company'] = agreementWithCarrierCompany;
    map['bargain_type'] = bargainType;
    map['bid_amount'] = bidAmount;
    map['bid_cash'] = bidCash;
    map['bid_novat_noncash'] = bidNovatNoncash;
    map['bid_vat_noncash'] = bidVatNoncash;
    map['body_type_id_data'] = bodyTypeIdData;
    map['cargo_type_id'] = cargoTypeId;
    if (cargoTypeIdData != null) {
      map['cargo_type_id_data'] = cargoTypeIdData?.toJson();
    }
    map['comment'] = comment;
    map['company_id_data'] = companyIdData;
    map['conditions'] = conditions;
    map['currency_id'] = currencyId;
    if (currencyIdData != null) {
      map['currency_id_data'] = currencyIdData?.toJson();
    }
    map['date'] = date;
    map['dim_height_special'] = dimHeightSpecial;
    map['dim_length_special'] = dimLengthSpecial;
    map['dim_width_special'] = dimWidthSpecial;
    map['dimension_height'] = dimensionHeight;
    map['dimension_length'] = dimensionLength;
    map['dimension_width'] = dimensionWidth;
    map['driver_comment'] = driverComment;
    map['gps_monitoring'] = gpsMonitoring;
    map['guid'] = guid;
    map['load_around_the_clock'] = loadAroundTheClock;
    map['load_capacity'] = loadCapacity;
    map['load_location'] = loadLocation;
    map['load_time'] = loadTime;
    map['loadind_type'] = loadindType;
    map['logistika-send-an-invitation-to-order_disable'] =
        logistikasendaninvitationtoorderDisable;
    map['logistika-send-an-offer-for-exactly-one-driver_disable'] =
        logistikasendanofferforexactlyonedriverDisable;
    map['logistika-send-list-of-address-name_disable'] =
        logistikasendlistofaddressnameDisable;
    map['map'] = map;
    map['map_id'] = mapId;
    if (mapIdData != null) {
      map['map_id_data'] = mapIdData?.toJson();
    }
    map['measurement_id'] = measurementId;
    if (measurementIdData != null) {
      map['measurement_id_data'] = measurementIdData?.toJson();
    }
    map['note'] = note;
    map['number_of_cars'] = numberOfCars;
    map['number_of_order'] = numberOfOrder;
    map['on_map'] = onMap;
    map['order_status'] = orderStatus;
    map['package_quantity'] = packageQuantity;
    map['packages_id'] = packagesId;
    map['packages_id_data'] = packagesIdData;
    map['payment_unloading'] = paymentUnloading;
    map['payment_within_days'] = paymentWithinDays;
    map['permissions'] = permissions;
    map['phone'] = phone;
    map['photo'] = photo;
    map['photos_or_documents'] = photosOrDocuments;
    map['prepayment_of_fuel'] = prepaymentOfFuel;
    map['prepayment_percentage'] = prepaymentPercentage;
    map['rate_interest'] = rateInterest;
    map['rate_interest_after_completion'] = rateInterestAfterCompletion;
    map['requirements'] = requirements;
    map['short_name'] = shortName;
    map['status'] = status;
    map['straps_number'] = strapsNumber;
    map['summa'] = summa;
    map['take_all_loads'] = takeAllLoads;
    map['take_all_unloads'] = takeAllUnloads;
    map['unload_around_the_clock'] = unloadAroundTheClock;
    map['unload_location'] = unloadLocation;
    map['unload_time'] = unloadTime;
    map['users_id'] = usersId;
    map['users_id_2'] = usersId2;
    if (usersId2Data != null) {
      map['users_id_2_data'] = usersId2Data?.toJson();
    }
    if (usersIdData != null) {
      map['users_id_data'] = usersIdData?.toJson();
    }
    map['users_ids'] = usersIds;
    map['vehicle_id'] = vehicleId;
    if (vehicleIdData != null) {
      map['vehicle_id_data'] = vehicleIdData?.toJson();
    }
    map['vehicle_type_id_NaN'] = vehicleTypeIdNaN;
    map['vehicle_type_id_NaN_data'] = vehicleTypeIdNaNData;
    map['volume_m3'] = volumeM3;
    map['weight'] = weight;
    map['workingday_type'] = workingdayType;
    return map;
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

  CityData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    addressId = json['address_id'];
    city = json['city'];
    guid = json['guid'];
    name = json['name'];
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

class VehicleIdData {
  VehicleIdData({
    this.v,
    this.id,
    this.bid,
    this.bodyDimensions,
    this.capacity,
    this.carNumber,
    this.carPhoto,
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

  UsersIdData.fromJson(Map json) {
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

class UsersId2Data {
  UsersId2Data({
    this.v,
    this.id,
    this.adr,
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
    this.notificationsIds,
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

  UsersId2Data.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    // adr = json['adr'] != null ? json['adr'].cast<String>() : [];
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
    if (json['notifications_ids'] != null) {
      notificationsIds = [];
      json['notifications_ids'].forEach((v) {
        notificationsIds?.add(v);
      });
    }
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
  List<String>? adr;
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
  List<dynamic>? notificationsIds;
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
    map['adr'] = adr;
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
    if (notificationsIds != null) {
      map['notifications_ids'] =
          notificationsIds?.map((v) => v.toJson()).toList();
    }
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

class MeasurementIdData {
  MeasurementIdData({
    this.symbol,
    this.v,
    this.id,
    this.baseQuantity,
    this.baseUnit,
    this.guid,
  });

  MeasurementIdData.fromJson(Map json) {
    symbol = json['Symbol'];
    v = json['__v'];
    id = json['_id'];
    baseQuantity = json['base_quantity'] != null
        ? json['base_quantity'].cast<String>()
        : [];
    baseUnit = json['base_unit'];
    guid = json['guid'];
  }

  String? symbol;
  num? v;
  dynamic id;
  List<String>? baseQuantity;
  String? baseUnit;
  String? guid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Symbol'] = symbol;
    map['__v'] = v;
    map['_id'] = id;
    map['base_quantity'] = baseQuantity;
    map['base_unit'] = baseUnit;
    map['guid'] = guid;
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

class AddressIdData {
  AddressIdData({
    this.v,
    this.id,
    this.addressId,
    this.cargoIds,
    this.code,
    this.guid,
    this.name,
    this.nameEn,
    this.nameRu,
    this.responseIds,
    this.type,
  });

  AddressIdData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    addressId = json['address_id'];
    cargoIds =
        json['cargo_ids'] != null ? json['cargo_ids'].cast<String>() : [];
    code = json['code'];
    guid = json['guid'];
    name = json['name'];
    nameRu = json['name_ru'];
    nameEn = json['name_en'];
    responseIds =
        json['response_ids'] != null ? json['response_ids'].cast<String>() : [];
    type = json['type'] != null ? json['type'].cast<String>() : [];
  }

  num? v;
  dynamic id;
  String? addressId;
  List<String>? cargoIds;
  String? code;
  String? guid;
  String? name;
  String? nameRu;
  String? nameEn;

  List<String>? responseIds;
  List<String>? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['address_id'] = addressId;
    map['cargo_ids'] = cargoIds;
    map['code'] = code;
    map['guid'] = guid;
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
    this.addressId,
    this.cargoIds,
    this.code,
    this.guid,
    this.name,
    this.nameRu,
    this.nameEn,
    this.type,
  });

  AddressId2Data.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    addressId = json['address_id'];
    cargoIds =
        json['cargo_ids'] != null ? json['cargo_ids'].cast<String>() : [];
    code = json['code'];
    guid = json['guid'];
    name = json['name'];
    nameRu = json['name_ru'];
    nameEn = json['name_en'];
    type = json['type'] != null ? json['type'].cast<String>() : [];
  }

  num? v;
  dynamic id;
  String? addressId;
  List<String>? cargoIds;
  String? code;
  String? guid;
  String? name;
  String? nameRu;
  String? nameEn;
  List<String>? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['address_id'] = addressId;
    map['cargo_ids'] = cargoIds;
    map['code'] = code;
    map['guid'] = guid;
    map['name'] = name;
    map['name_ru'] = nameRu;
    map['name_en'] = nameEn;
    map['type'] = type;
    return map;
  }
}
