class GetClientTypeResponseModel {
  String? status;
  String? description;
  ClientTypeData? data;

  GetClientTypeResponseModel({
    this.status,
    this.description,
    this.data,
  });

  GetClientTypeResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? ClientTypeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['description'] = description;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ClientTypeData {
  List<Companies>? companies;
  String? userId;

  ClientTypeData({this.companies, this.userId});

  ClientTypeData.fromJson(Map<String, dynamic> json) {
    if (json['companies'] != null) {
      companies = <Companies>[];
      json['companies'].forEach((v) {
        companies!.add(Companies.fromJson(v));
      });
    }
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (companies != null) {
      data['companies'] = companies!.map((v) => v.toJson()).toList();
    }
    data['user_id'] = userId;
    return data;
  }
}

class Companies {
  String? id;
  String? name;
  String? ownerId;
  List<Projects>? projects;

  Companies({this.id, this.name, this.ownerId, this.projects});

  Companies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ownerId = json['owner_id'];
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['owner_id'] = ownerId;
    if (projects != null) {
      data['projects'] = projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Projects {
  String? id;
  String? companyId;
  String? name;
  String? domain;
  List<ResourceEnvironments>? resourceEnvironments;

  Projects({
    this.id,
    this.companyId,
    this.name,
    this.domain,
    this.resourceEnvironments,
  });

  Projects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    domain = json['domain'];
    if (json['resource_environments'] != null) {
      resourceEnvironments = <ResourceEnvironments>[];
      json['resource_environments'].forEach((v) {
        resourceEnvironments!.add(ResourceEnvironments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['name'] = name;
    data['domain'] = domain;
    if (resourceEnvironments != null) {
      data['resource_environments'] =
          resourceEnvironments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResourceEnvironments {
  String? id;
  String? projectId;
  String? resourceId;
  String? environmentId;
  bool? isConfigured;
  int? resourceType;
  int? serviceType;
  String? name;
  String? displayColor;
  String? description;
  ClientTypes? clientTypes;

  ResourceEnvironments({
    this.id,
    this.projectId,
    this.resourceId,
    this.environmentId,
    this.isConfigured,
    this.resourceType,
    this.serviceType,
    this.name,
    this.displayColor,
    this.description,
    this.clientTypes,
  });

  ResourceEnvironments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    resourceId = json['resource_id'];
    environmentId = json['environment_id'];
    isConfigured = json['is_configured'];
    resourceType = json['resource_type'];
    serviceType = json['service_type'];
    name = json['name'];
    displayColor = json['display_color'];
    description = json['description'];
    clientTypes = json['client_types'] != null
        ? ClientTypes.fromJson(json['client_types'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['project_id'] = projectId;
    data['resource_id'] = resourceId;
    data['environment_id'] = environmentId;
    data['is_configured'] = isConfigured;
    data['resource_type'] = resourceType;
    data['service_type'] = serviceType;
    data['name'] = name;
    data['display_color'] = displayColor;
    data['description'] = description;
    if (clientTypes != null) {
      data['client_types'] = clientTypes!.toJson();
    }
    return data;
  }
}

class ClientTypes {
  int? count;
  List<ClientType>? response;

  ClientTypes({this.count, this.response});

  ClientTypes.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['response'] != null) {
      response = <ClientType>[];
      json['response'].forEach((v) {
        response!.add(ClientType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClientType {
  String? confirmBy;
  String? defaultPage;
  String? guid;
  String? name;
  bool? selfRecover;
  bool? selfRegister;
  String? tableSlug;

  ClientType({
    this.confirmBy,
    this.defaultPage,
    this.guid,
    this.name,
    this.selfRecover,
    this.selfRegister,
    this.tableSlug,
  });

  ClientType.fromJson(Map<String, dynamic> json) {
    confirmBy = json['confirm_by'];
    defaultPage = json['default_page'];
    guid = json['guid'];
    name = json['name'];
    selfRecover = json['self_recover'];
    selfRegister = json['self_register'];
    tableSlug = json['table_slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['confirm_by'] = confirmBy;
    data['default_page'] = defaultPage;
    data['guid'] = guid;
    data['name'] = name;
    data['self_recover'] = selfRecover;
    data['self_register'] = selfRegister;
    data['table_slug'] = tableSlug;
    return data;
  }
}
