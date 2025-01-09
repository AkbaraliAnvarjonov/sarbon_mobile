class RatingReviewRequestModel {
  RatingReviewData? data;

  RatingReviewRequestModel({this.data});

  RatingReviewRequestModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? RatingReviewData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  Map<String, dynamic> toJsonOpenFunc(String guid) {
    final Map<String, dynamic> data = <String, dynamic>{
      'data': {
        'object_data': {},
      }
    };
    if (this.data != null) {
      data['data']['object_data'] = this.data!.toJsonOpenFunc(guid);
    }
    return data;
  }
}

class RatingReviewData {
  String? companyId;
  num? grade;
  String? rewiv;
  String? usersId;
  List<String>? reviewStatus;
  String? usersId2;
  List<String>? status;

  RatingReviewData({
    this.companyId,
    this.grade,
    this.rewiv,
    this.usersId,
    this.reviewStatus,
    this.usersId2,
    this.status = const [],
  });

  RatingReviewData.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    grade = json['grade'];
    rewiv = json['rewiv'];
    usersId = json['users_id'];
    reviewStatus = json['review_status'];
    usersId2 = json['users_id_2'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_id'] = companyId;
    data['grade'] = grade;
    data['rewiv'] = rewiv;
    data['users_id'] = usersId;
    data['review_status'] = reviewStatus;
    data['users_id_2'] = usersId2;
    data['status'] = status;
    return data;
  }

  Map<String, dynamic> toJsonOpenFunc(String guid) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_id'] = companyId;
    data['grade'] = grade;
    data['rewiv'] = rewiv;
    data['users_id'] = usersId;
    data['review_status'] = reviewStatus;
    data['users_id_2'] = usersId2;
    data['status'] = status;
    data['guid'] = guid;
    return data;
  }
}
