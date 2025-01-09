class GetDetailAddressesByNotification {
  GetDetailAddressesByNotification({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  GetDetailAddressesByNotification.fromJson(Map json) {
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
    this.status,
    this.data,
    this.attributes,
    this.serverError,
  });

  MainData.fromJson(Map json) {
    status = json['status'];
    data = json['data'] != null ? SecondData.fromJson(json['data']) : null;
    attributes = json['attributes'];
    serverError = json['server_error'];
  }

  String? status;
  SecondData? data;
  dynamic attributes;
  String? serverError;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['attributes'] = attributes;
    map['server_error'] = serverError;
    return map;
  }
}

class SecondData {
  SecondData({
    this.data,
  });

  SecondData.fromJson(Map json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.response,
  });

  Data.fromJson(Map json) {
    if (json['response'] != null) {
      response = [];
      json['response'].forEach((v) {
        response?.add(MainResponse.fromJson(v));
      });
    }
  }

  List<MainResponse>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class MainResponse {
  MainResponse({
    this.cargoIds,
    this.code,
    this.guid,
    this.logistikasendaninvitationtoorderDisable,
    this.name,
    this.responseIds,
    this.type,
  });

  MainResponse.fromJson(Map json) {
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

  List<String>? cargoIds;
  String? code;
  String? guid;
  bool? logistikasendaninvitationtoorderDisable;
  String? name;
  List<String>? responseIds;
  List<String>? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
