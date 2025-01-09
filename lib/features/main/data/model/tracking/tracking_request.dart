import 'dart:convert';

class TrackingRequest {
  TrackingRequest({
    this.userId,
    this.lat,
    this.long,
    this.updateTime,
    this.os,
    this.version,
    this.battery,
    this.gps,
  });

  TrackingRequest.fromJson(Map json) {
    userId = json['user_id'];
    lat = json['lat'];
    long = json['long'];
    updateTime = json['update_time'];
    os = json['os'];
    version = json['version'];
    battery = json['battery'];
    gps = json['gps'];
  }

  String? userId;
  num? lat;
  num? long;
  String? updateTime;
  String? os;
  String? version;
  int? battery;
  bool? gps;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['lat'] = lat;
    map['long'] = long;
    map['update_time'] = updateTime;
    map['os'] = os;
    map['version'] = version;
    map['battery'] = battery;
    map['gps'] = gps;
    return map;
  }
}

class TrackingForApiRequest {
  TrackingForApiRequest({
    this.data,
  });

  TrackingForApiRequest.fromJson(Map json) {
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
    this.objectData,
  });

  Data.fromJson(Map json) {
    objectData = json['object_data'] != null
        ? ObjectData.fromJson(json['object_data'])
        : null;
  }

  ObjectData? objectData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (objectData != null) {
      map['object_data'] = objectData?.toJson();
    }
    return map;
  }
}

class ObjectData {
  ObjectData({
    this.driverLastSeen,
  });

  ObjectData.fromJson(Map json) {
    driverLastSeen = json['driver_last_seen'] != null
        ? json['driver_last_seen'].cast<String>()
        : [];
  }

  List<String>? driverLastSeen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    final driverLastSeenMap =
        driverLastSeen?.map((e) => jsonDecode(e)).toList();
    map['driver_last_seen'] = jsonEncode(driverLastSeenMap);
    return map;
  }
}
