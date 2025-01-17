import '../../../../../core/utils/utils.dart';

class TypesPaymentResponse {
  TypesPaymentResponse({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  TypesPaymentResponse.fromJson(Map json) {
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
        response?.add(TypePaymentList.fromJson(v));
      });
    }
  }

  num? count;
  List<TypePaymentList>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class TypePaymentList {
  TypePaymentList({
    this.guid,
    this.paymentType,
  });

  TypePaymentList.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    paymentType = getLocalizedName(json, 'payment_type');
    paymentType = json['payment_type'];
  }

  String? guid;
  String? paymentType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['guid'] = guid;
    map['payment_type'] = paymentType;
    return map;
  }
}
