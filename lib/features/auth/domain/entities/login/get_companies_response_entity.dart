import 'package:equatable/equatable.dart';

import '../../../data/models/login/get_companies_response_model.dart';

class GetCompaniesResponseEntity extends Equatable {
  const GetCompaniesResponseEntity({
    this.companies,
  });

  final List<CompanyItem>? companies;

  @override
  List<Object?> get props => [companies];
}

class CompanyItem {
  String? fullName;
  String? guid;

  CompanyItem({
    this.fullName,
    this.guid,
  });
}

extension GetCompaniesResponseEntityX on GetCompaniesResponseModel {
  GetCompaniesResponseEntity toEntity() => GetCompaniesResponseEntity(
        companies: data?.data?.response
                ?.map(
                  (company) => CompanyItem(
                    fullName: company.fullName ?? '',
                    guid: company.guid ?? '',
                  ),
                )
                .toList() ??
            [],
      );
}
