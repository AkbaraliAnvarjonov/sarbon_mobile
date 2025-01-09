class GetClientTypeRequestModel {
  const GetClientTypeRequestModel({
    this.password,
    this.username,
  });

  factory GetClientTypeRequestModel.fromJson(Map json) =>
      GetClientTypeRequestModel(
        password: json['password'],
        username: json['username'],
      );

  final String? password;
  final String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['password'] = password;
    map['username'] = username;
    return map;
  }
}
