class GetOrdersResponseModel {
  String? status;
  String? description;
  Data? data;

  GetOrdersResponseModel({
    this.status,
    this.description,
    this.data,
  });

  GetOrdersResponseModel.fromJson(Map<String, dynamic> json) {
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
  OrdersData? data;

  Data({
    this.tableSlug,
    this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? OrdersData.fromJson(json['data']) : null;
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

class OrdersData {
  int? count;
  List<OrderItem>? response;

  OrdersData({
    this.count,
    this.response,
  });

  OrdersData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['response'] != null) {
      response = <OrderItem>[];
      json['response'].forEach((v) {
        response!.add(OrderItem.fromJson(v));
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

class OrderItem {
  String? addressId;
  String? addressId2;
  UserId2Data? userId2Data;
  List<String>? provisions;
  UsersId3Data? usersId3Data;
  AddressIdData? addressIdData;
  AddressIdData? addressId2Data;
  CurrencyIdData? currencyIdData;
  CompanyIdData? companyIdData;
  VehicleIdData? vehicleIdData;
  VehicleTypeIdData? vehicleTypeIdData;
  num? bidCash;
  num? dimWithSpecial;
  String? clientName;
  String? guid;
  num? numberOfCars;
  num? volumeM3;
  num? weight;
  List<String>? whoCancellation;
  List<String>? statuses;
  List<String>? indicateStatus;
  String? usersId3;
  String? cargoId;
  bool? request;
  CityData? cityIdData;
  CityData? cityId2Data;
  CargoIdData? cargoIdData;
  num? distance;

  OrderItem({
    this.addressId,
    this.addressId2,
    this.provisions,
    this.addressIdData,
    this.addressId2Data,
    this.currencyIdData,
    this.companyIdData,
    this.vehicleIdData,
    this.dimWithSpecial,
    this.bidCash,
    this.clientName,
    this.guid,
    this.numberOfCars,
    this.volumeM3,
    this.weight,
    this.statuses,
    this.userId2Data,
    this.indicateStatus,
    this.usersId3,
    this.vehicleTypeIdData,
    this.cargoId,
    this.usersId3Data,
    this.request,
    this.cityIdData,
    this.cityId2Data,
    this.cargoIdData,
    this.distance,
    this.whoCancellation,
  });

  OrderItem.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressId2 = json['address_id_2'];
    distance = json['distance'];

    provisions = json['provisions'].cast<String>();
    cargoIdData = json['cargo_id_data'] != null ? CargoIdData.fromJson(json['cargo_id_data']) : null;
    cityIdData = json['city_id_data'] != null ? CityData.fromJson(json['city_id_data']) : null;
    cityId2Data = json['city_id_2_data'] != null ? CityData.fromJson(json['city_id_2_data']) : null;
    addressIdData = json['address_id_data'] != null ? AddressIdData.fromJson(json['address_id_data']) : null;
    addressId2Data = json['address_id_2_data'] != null ? AddressIdData.fromJson(json['address_id_2_data']) : null;
    currencyIdData = json['currency_id_data'] != null ? CurrencyIdData.fromJson(json['currency_id_data']) : null;
    companyIdData = json['company_id_data'] != null ? CompanyIdData.fromJson(json['company_id_data']) : null;
    vehicleIdData = json['vehicle_id_data'] != null ? VehicleIdData.fromJson(json['vehicle_id_data']) : null;
    vehicleTypeIdData =
        json['vehicle_type_id_data'] != null ? VehicleTypeIdData.fromJson(json['vehicle_type_id_data']) : null;
    userId2Data = json['users_id_2_data'] != null ? UserId2Data.fromJson(json['users_id_2_data']) : null;
    usersId3Data = json['users_id_3_data'] != null ? UsersId3Data.fromJson(json['users_id_3_data']) : null;
    bidCash = json['bid_cash'];
    dimWithSpecial = json['dim_width_special'];
    if (json['users_id_2_data'] != null) {
      clientName = json?['users_id_2_data']['full_name'] ?? '';
    } else {
      clientName = '';
    }
    guid = json['guid'];
    numberOfCars = json['number_of_cars'];
    volumeM3 = json['volume_m3'];
    weight = json['weight'];
    whoCancellation = json['who_cancellation'] != null
        ? json['who_cancellation'] is String
            ? whoCancellation = [json['who_cancellation']]
            : whoCancellation = json['who_cancellation'].cast<String>()
        : [];
    statuses = json['response_status'] != null
        ? json['response_status'] is String
            ? statuses = [json['response_status']]
            : statuses = json['response_status'].cast<String>()
        : [];
    indicateStatus = json['indicate_status'] != null
        ? json['indicate_status'] is String
            ? indicateStatus = [json['indicate_status']]
            : indicateStatus = json['indicate_status'].cast<String>()
        : [];
    usersId3 = json['users_id_3'];
    cargoId = json['cargo_id'];
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
    if (vehicleIdData != null) {
      data['vehicle_id_data'] = vehicleIdData!.toJson();
    }
    data['bid_cash'] = bidCash;
    data['dim_width_special'] = dimWithSpecial;
    data['client_name'] = clientName;
    data['guid'] = guid;
    data['number_of_cars'] = numberOfCars;
    data['volume_m3'] = volumeM3;
    data['weight'] = weight;
    data['response_status'] = statuses;
    data['indicate_status'] = indicateStatus;
    data['users_id_3'] = usersId3;
    data['cargo_id'] = cargoId;
    data['request'] = request;
    return data;
  }
}

class CargoIdData {
  CargoIdData({
    this.v,
    this.id,
    this.carType,
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
    carType = json['car_type'];
    to = json['to'];
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
    acceptedOffers = json['accepted_offers'];
    numberOfOrder = json['number_of_order'];
    onMap = json['on_map'];
    orderStatus = json['order_status'] != null ? json['order_status'].cast<String>() : [];
    packageQuantity = json['package_quantity'];
    packagesId = json['packages_id'];
    paymentUnloading = json['payment_unloading'];
    paymentUponUnloading = json['payment_upon_unloading'];
    paymentWithinDays = json['payment_within_days'];
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
  num? v;
  dynamic id;
  dynamic additionalDate;
  String? carType;
  String? addressId;
  String? addressId2;
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

class UserId2Data {
  UserId2Data({
    this.v,
    this.id,
    this.carType,
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
    carType = json['car_type'];

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
  String? carType;

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
  String? aliasName;
  List<String>? companyType;
  String? fullName;
  String? name;

  CompanyIdData({
    this.aliasName,
    this.companyType,
    this.fullName,
    this.name,
  });

  CompanyIdData.fromJson(Map<String, dynamic> json) {
    aliasName = json['alias_name'];
    companyType = json['company_type'].cast<String>();
    fullName = json['full_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['alias_name'] = aliasName;
    data['company_type'] = companyType;
    data['full_name'] = fullName;
    data['name'] = name;
    return data;
  }
}

class VehicleIdData {
  String? name;
  String? carNumber;

  VehicleIdData({
    this.name,
    this.carNumber,
  });

  VehicleIdData.fromJson(Map<String, dynamic> json) {
    name = json['short_names'];
    carNumber = json['car_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['short_names'] = name;
    data['car_number'] = carNumber;
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
