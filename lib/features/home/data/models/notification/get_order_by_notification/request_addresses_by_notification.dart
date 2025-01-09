class GetAddressesRequestByNotification {
  GetAddressesRequestByNotification({
    this.data,
  });

  GetAddressesRequestByNotification.fromJson(Map json) {
    data = json['data'] != null ? MainNotificationData.fromJson(json['data']) : null;
  }

  MainNotificationData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class MainNotificationData {
  MainNotificationData({
    this.objectIds,
  });

  MainNotificationData.fromJson(Map json) {
    objectIds =
        json['object_ids'] != null ? json['object_ids'].cast<String>() : [];
  }

  List<String>? objectIds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['object_ids'] = objectIds;
    return map;
  }
}
