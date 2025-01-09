// import 'package:equatable/equatable.dart';
//
// import '../../../data/models/search/get_company_info_response_model.dart';
//
// class GetCompanyInfoResponseEntity extends Equatable {
//   const GetCompanyInfoResponseEntity({
//     required this.count,
//     required this.companies,
//   });
//
//   final int count;
//   final List<CompanyEntity> companies;
//
//   @override
//   List<Object?> get props => [companies];
// }
//
// class CompanyEntity {
//   final String? aliasName;
//   final String? bankDetails;
//   final String? buildingAddress;
//   final String? companyDirection;
//   final String? companyType;
//   final String? email;
//   final String? fullName;
//   final String? guid;
//   final String? name;
//   final String? phoneNumber;
//   final String? photoUrl;
//   final String? tin;
//
//   const CompanyEntity({
//     this.aliasName,
//     this.bankDetails,
//     this.buildingAddress,
//     this.companyDirection,
//     this.companyType,
//     this.email,
//     this.fullName,
//     this.guid,
//     this.name,
//     this.phoneNumber,
//     this.photoUrl,
//     this.tin,
//   });
// }
//
// extension GetCompanyInfoResponseEntityX on GetCompanyInfoResponseModel {
//   GetCompanyInfoResponseEntity toEntity() => GetCompanyInfoResponseEntity(
//         count: data?.data?.count ?? 0,
//         companies: data?.data?.response
//                 ?.map(
//                   (company) => CompanyEntity(
//                     aliasName: company.aliasName ?? '',
//                     bankDetails: company.bankDetails ?? '',
//                     buildingAddress: company.buildingAddress ?? '',
//                     companyDirection: company.companyDirection ?? '',
//                     companyType: company.companyType ?? '',
//                     email: company.email ?? '',
//                     fullName: company.fullName ?? '',
//                     guid: company.guid ?? '',
//                     name: company.name ?? '',
//                     phoneNumber: company.phoneNumber ?? '',
//                     photoUrl: company.photoUrl ?? '',
//                     tin: company.tin ?? '',
//                   ),
//                 )
//                 .toList() ??
//             [],
//       );
// }
