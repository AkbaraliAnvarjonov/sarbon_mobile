class DispatcherModel {
  final String status;
  final String description;
  final DispatcherData data;
  final String customMessage;

  DispatcherModel({
    required this.status,
    required this.description,
    required this.data,
    required this.customMessage,
  });

  factory DispatcherModel.fromJson(Map<String, dynamic> json) {
    return DispatcherModel(
      status: json['status'] ?? '',
      description: json['description'] ?? '',
      data: DispatcherData.fromJson(json['data'] ?? {}),
      customMessage: json['custom_message'] ?? '',
    );
  }
}

class DispatcherData {
  final String tableSlug;
  final DispatcherResponse data;

  DispatcherData({
    required this.tableSlug,
    required this.data,
  });

  factory DispatcherData.fromJson(Map<String, dynamic> json) {
    return DispatcherData(
      tableSlug: json['table_slug'] ?? '',
      data: DispatcherResponse.fromJson(json['data'] ?? {}),
    );
  }
}

class DispatcherResponse {
  final int count;
  final List<DispatcherDriver> response;

  DispatcherResponse({
    required this.count,
    required this.response,
  });

  factory DispatcherResponse.fromJson(Map<String, dynamic> json) {
    return DispatcherResponse(
      count: json['count'] ?? 0,
      response: (json['response'] as List<dynamic>? ?? [])
          .map((e) => DispatcherDriver.fromJson(e ?? {}))
          .toList(),
    );
  }
}

class DispatcherDriver {
  final String firmId;
  final String guid;
  final String usersId;
  final String usersId2;
  final String usersId3;

  DispatcherDriver({
    required this.firmId,
    required this.guid,
    required this.usersId,
    required this.usersId2,
    required this.usersId3,
  });

  factory DispatcherDriver.fromJson(Map<String, dynamic> json) {
    return DispatcherDriver(
      firmId: json['firm_id'] ?? '',
      guid: json['guid'] ?? '',
      usersId: json['users_id'] ?? '',
      usersId2: json['users_id_2'] ?? '',
      usersId3: json['users_id_3'] ?? '',
    );
  }
}
