class GetActiveAnnouncementRequest {
  GetActiveAnnouncementRequest({
      this.offset, 
      this.search, 
      this.limit, 
      this.usersId, 
      this.status, 
      this.withRelations,});

  GetActiveAnnouncementRequest.fromJson(Map json) {
    offset = json['offset'];
    search = json['search'];
    limit = json['limit'];
    usersId = json['users_id'];
    status = json['status'] != null ? json['status'].cast<String>() : [];
    withRelations = json['with_relations'];
  }
  num? offset;
  String? search;
  num? limit;
  String? usersId;
  List<String>? status;
  bool? withRelations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offset'] = offset;
    map['search'] = search;
    map['limit'] = limit;
    map['users_id'] = usersId;
    map['status'] = status;
    map['with_relations'] = withRelations;
    return map;
  }

}