class CarsSaleSearchRequest {
  CarsSaleSearchRequest({
    this.offset,
    this.search,
    this.limit,
    this.name,
    this.withRelations,
  });

  CarsSaleSearchRequest.fromJson(Map json) {
    offset = json['offset'];
    search = json['search'];
    limit = json['limit'];
    name = json['name'] ?? [];
    withRelations = json['with_relations'];
  }

  num? offset;
  String? search;
  num? limit;
  List<String>? name;
  bool? withRelations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offset'] = offset;
    map['search'] = search;
    map['limit'] = limit;
    map['name'] = name;
    map['with_relations'] = withRelations;
    map['status'] = ['active'];
    return map;
  }
}
