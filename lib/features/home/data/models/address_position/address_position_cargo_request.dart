class FetchAddressPositionCargoRequest {
  FetchAddressPositionCargoRequest({
    this.responseId,
  });

  FetchAddressPositionCargoRequest.fromJson(Map json) {
    responseId = json['cargo_id'];
  }

  String? responseId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cargo_id'] = responseId;
    return map;
  }
}
