class FetchAddressPositionNotificationRequest {
  FetchAddressPositionNotificationRequest({
    this.responseId,
  });

  FetchAddressPositionNotificationRequest.fromJson(Map json) {
    responseId = json['response_id'];
  }

  String? responseId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response_id'] = responseId;
    return map;
  }
}
