class NotificationResponse {
  NotificationResponse({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  NotificationResponse.fromJson(Map json) {
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
        response?.add(NotificationListResponse.fromJson(v));
      });
    }
  }

  num? count;
  List<NotificationListResponse>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class NotificationListResponse {
  NotificationListResponse({
    this.guid,
    this.image,
    this.isRead,
    this.noteId,
    this.notification,
    this.offer,
    this.cargoId,
    this.time,
    this.title,
    this.type,
    this.userId,
  });

  NotificationListResponse.fromJson(Map json) {
    guid = json['guid'];
    image = json['image'];
    isRead = json['is_read'];
    noteId = json['note_id'];
    notification = json['notification'];
    offer = json['offer'];
    cargoId = json['cargo_id'];
    time = json['time'];
    title = json['title'];
    type = json['type'];
    userId = json['user_id'];
  }

  String? guid;
  String? image;
  bool? isRead;
  String? noteId;
  String? notification;
  String? offer;
  String? cargoId;
  String? time;
  String? title;
  String? type;
  String? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['guid'] = guid;
    map['image'] = image;
    map['is_read'] = isRead;
    map['note_id'] = noteId;
    map['notification'] = notification;
    map['offer'] = offer;
    map['cargo_id'] = cargoId;
    map['time'] = time;
    map['title'] = title;
    map['type'] = type;
    map['user_id'] = userId;
    return map;
  }
}
