class FilteredCargoResponseModel {
  final String status;
  final String description;
  final CargoData data;
  final String customMessage;

  FilteredCargoResponseModel({
    required this.status,
    required this.description,
    required this.data,
    required this.customMessage,
  });

  factory FilteredCargoResponseModel.fromJson(Map<String, dynamic> json) {
    return FilteredCargoResponseModel(
      status: json['status'] ?? '',
      description: json['description'] ?? '',
      data: CargoData.fromJson(json['data'] ?? {}),
      customMessage: json['custom_message'] ?? '',
    );
  }
}

class CargoData {
  final String status;
  final CargoDetails data;
  final String? attributes;
  final String serverError;

  CargoData({
    required this.status,
    required this.data,
    this.attributes,
    required this.serverError,
  });

  factory CargoData.fromJson(Map<String, dynamic> json) {
    return CargoData(
      status: json['status'] ?? '',
      data: CargoDetails.fromJson(json['data'] ?? {}),
      attributes: json['attributes'],
      serverError: json['server_error'] ?? '',
    );
  }
}

class CargoDetails {
  final List<Count> count;
  final List<ResponseData> response;

  CargoDetails({
    required this.count,
    required this.response,
  });

  factory CargoDetails.fromJson(Map<String, dynamic> json) {
    return CargoDetails(
      count: (json['count'] as List<dynamic>?)?.map((e) => Count.fromJson(e)).toList() ?? [],
      response: (json['response'] as List<dynamic>?)?.map((e) => ResponseData.fromJson(e)).toList() ?? [],
    );
  }
}

class Count {
  final int totalCount;

  Count({required this.totalCount});

  factory Count.fromJson(Map<String, dynamic> json) {
    return Count(
      totalCount: json['totalCount'] ?? 0,
    );
  }
}

class ResponseData {
  final bool asSoonAsA;
  final bool asSoonAsB;
  final num rating;
  final num distance;
  final int bidCash;
  final String carType;
  final List<String> cargoType;
  final String countryCodeFrom;
  final String countryCodeTo;
  final String createdAt;
  final String currencyId;
  final List<CurrencyData> currencyIdData;
  final List<CustomerData> customerData;
  final String date;
  final String flagDo;
  final String flagOt;
  final String from;
  final String guid;
  final String loadTime;
  final String mapId;
  final String numberOfOrder;
  final List<String> orderStatus;
  final String paymentType;
  final int prepaymentPercentage;
  final String productType;
  final String status;
  final String to;
  final String usersId;
  final String vehicleTypeId;
  final int volumeM3;
  final int weight;

  ResponseData({
    required this.asSoonAsA,
    required this.asSoonAsB,
    required this.bidCash,
    required this.carType,
    required this.rating,
    required this.distance,
    required this.cargoType,
    required this.countryCodeFrom,
    required this.countryCodeTo,
    required this.createdAt,
    required this.currencyId,
    required this.currencyIdData,
    required this.customerData,
    required this.date,
    required this.flagDo,
    required this.flagOt,
    required this.from,
    required this.guid,
    required this.loadTime,
    required this.mapId,
    required this.numberOfOrder,
    required this.orderStatus,
    required this.paymentType,
    required this.prepaymentPercentage,
    required this.productType,
    required this.status,
    required this.to,
    required this.usersId,
    required this.vehicleTypeId,
    required this.volumeM3,
    required this.weight,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      asSoonAsA: json['as_soon_as_a'] ?? false,
      asSoonAsB: json['as_soon_as_b'] ?? false,
      bidCash: json['bid_cash'] ?? 0,
      rating: json['rating'] ?? 0,
      distance: json['distance'] ?? 0,
      carType: json['car_type'] ?? '',
      cargoType: List<String>.from(json['cargo_type'] ?? []),
      countryCodeFrom: json['country_code_from'] ?? '',
      countryCodeTo: json['country_code_to'] ?? '',
      createdAt: json['createdAt'] ?? '',
      currencyId: json['currency_id'] ?? '',
      currencyIdData: (json['currency_id_data'] as List<dynamic>?)?.map((e) => CurrencyData.fromJson(e)).toList() ?? [],
      customerData: (json['customer_data'] as List<dynamic>?)?.map((e) => CustomerData.fromJson(e)).toList() ?? [],
      date: json['date'] ?? '',
      flagDo: json['flag_do'] ?? '',
      flagOt: json['flag_ot'] ?? '',
      from: json['from'] ?? '',
      guid: json['guid'] ?? '',
      loadTime: json['load_time'] ?? '',
      mapId: json['map_id'] ?? '',
      numberOfOrder: json['number_of_order'] ?? '',
      orderStatus: List<String>.from(json['order_status'] ?? []),
      paymentType: json['payment_type'] ?? '',
      prepaymentPercentage: json['prepayment_percentage'] ?? 0,
      productType: json['product_type'] ?? '',
      status: json['status'] ?? '',
      to: json['to'] ?? '',
      usersId: json['users_id'] ?? '',
      vehicleTypeId: json['vehicle_type_id'] ?? '',
      volumeM3: json['volume_m3'] ?? 0,
      weight: json['weight'] ?? 0,
    );
  }
}

class CurrencyData {
  final String code;
  final String guid;

  CurrencyData({required this.code, required this.guid});

  factory CurrencyData.fromJson(Map<String, dynamic> json) {
    return CurrencyData(
      code: json['code'] ?? '',
      guid: json['guid'] ?? '',
    );
  }
}

class CustomerData {
  final String fullName;
  final String guid;
  final String phone;
  final String photo;

  CustomerData({
    required this.fullName,
    required this.guid,
    required this.phone,
    required this.photo,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) {
    return CustomerData(
      fullName: json['full_name'] ?? '',
      guid: json['guid'] ?? '',
      phone: json['phone'] ?? '',
      photo: json['photo'] ?? '',
    );
  }
}
