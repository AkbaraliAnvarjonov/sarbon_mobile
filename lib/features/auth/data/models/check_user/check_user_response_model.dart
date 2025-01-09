class CheckUserResponseModel {
  String? status;
  String? description;
  Data? data;

  CheckUserResponseModel({
    this.status,
    this.description,
    this.data,
  });

  CheckUserResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? Data.fromJson(json['data']['data']) : null;
  }
}

class Data {
  int? count;
  List<dynamic>? users;

  Data({
    this.count,
    this.users,
  });

  Data.fromJson(Map<String, dynamic> json) {
    users = json['response'];
    count = json['count'];
  }
}
