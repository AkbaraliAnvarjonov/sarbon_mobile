class UserCheckModel {
  final String status;
  final String description;
  final DataModel data;
  final String customMessage;

  UserCheckModel({
    required this.status,
    required this.description,
    required this.data,
    required this.customMessage,
  });

  factory UserCheckModel.fromJson(Map<String, dynamic> json) {
    return UserCheckModel(
      status: json['status'] ?? '',
      description: json['description'] ?? '',
      data: DataModel.fromJson(json['data'] ?? {}),
      customMessage: json['custom_message'] ?? '',
    );
  }
}

class DataModel {
  final String status;
  final NestedDataModel data;
  final String attributes;
  final String serverError;

  DataModel({
    required this.status,
    required this.data,
    required this.attributes,
    required this.serverError,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      status: json['status'] ?? '',
      data: NestedDataModel.fromJson(json['data'] ?? {}),
      attributes: json['attributes']?.toString() ?? '',
      serverError: json['server_error'] ?? '',
    );
  }
}

class NestedDataModel {
  final List<dynamic> response;

  NestedDataModel({
    required this.response,
  });

  factory NestedDataModel.fromJson(Map<String, dynamic> json) {
    return NestedDataModel(
      response: json['response'] ?? [],
    );
  }
}
