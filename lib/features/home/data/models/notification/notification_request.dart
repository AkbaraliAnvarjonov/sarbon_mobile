class NotificationRequest {
  NotificationRequest({
    this.usersId,
  });

  NotificationRequest.fromJson(Map json) {
    usersId = json['user_id'];
  }

  String? usersId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = usersId;
    return map;
  }
}
