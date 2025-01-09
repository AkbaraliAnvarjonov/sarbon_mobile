class PutNotificationRequest {
  PutNotificationRequest({
    this.data,
  });

  PutNotificationRequest.fromJson(Map json) {
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
    this.isRead,
    this.guid,
  });

  Data.fromJson(Map json) {
    isRead =
        json['is_read'];
    guid = json['guid'];
  }

  bool? isRead;
  String? guid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_read'] = isRead;
    map['guid'] = guid;
    return map;
  }
}
