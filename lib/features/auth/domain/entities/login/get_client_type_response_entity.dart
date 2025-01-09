import 'package:equatable/equatable.dart';

import '../../../data/models/login/get_client_type_response_model.dart';

class GetClientTypeResponseEntity extends Equatable {
  const GetClientTypeResponseEntity({
    this.companyId,
    this.clientTypeId,
  });

  final String? companyId;
  final String? clientTypeId;

  @override
  List<Object?> get props => [companyId, clientTypeId];
}

extension GetClientTypeResponseEntityX on GetClientTypeResponseModel {
  GetClientTypeResponseEntity toEntity() => GetClientTypeResponseEntity(
        companyId: data?.companies?.first.id ?? '',
        clientTypeId:
            data?.companies?.first.projects?.first.resourceEnvironments?.first.clientTypes?.response?.first.guid ?? '',
      );
}
