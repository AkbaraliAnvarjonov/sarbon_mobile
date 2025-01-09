class RecommendationCarsRequest {
  RecommendationCarsRequest({
    this.offset,
    this.search,
    this.limit,
    this.withRelations,
  });

  RecommendationCarsRequest.fromJson(Map json) {
    offset = json['offset'];
    search = json['search'];
    limit = json['limit'];
    withRelations = json['with_relations'];
  }

  num? offset;
  String? search;
  num? limit;
  bool? withRelations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offset'] = offset;
    map['search'] = search;
    map['limit'] = limit;
    map['with_relations'] = withRelations;
    map['status'] = ['active'];
    return map;
  }
}
