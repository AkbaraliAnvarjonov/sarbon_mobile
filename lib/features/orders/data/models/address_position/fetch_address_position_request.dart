class FetchAddressPositionRequest {
  FetchAddressPositionRequest({
    this.responseId,
  });

  String? responseId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cargo_id'] = responseId;
    return map;
  }
}
