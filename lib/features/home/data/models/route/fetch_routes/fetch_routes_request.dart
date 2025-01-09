class FetchRoutesRequest {
  FetchRoutesRequest({
    this.usersId,
    this.withRelations,
  });

  FetchRoutesRequest.fromJson(Map json) {
    usersId = json['users_id'];
    withRelations = json['with_relations'];
  }

  String? usersId;
  bool? withRelations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['users_id'] = usersId;
    map['with_relations'] = withRelations;
    return map;
  }
}
