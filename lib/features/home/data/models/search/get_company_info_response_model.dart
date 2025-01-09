// class GetCompanyInfoResponseModel {
//   String? status;
//   String? description;
//   Data? data;
//
//   GetCompanyInfoResponseModel({
//     this.status,
//     this.description,
//     this.data,
//   });
//
//   GetCompanyInfoResponseModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     description = json['description'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['description'] = description;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String? tableSlug;
//   CompanyData? data;
//
//   Data({
//     this.tableSlug,
//     this.data,
//   });
//
//   Data.fromJson(Map<String, dynamic> json) {
//     tableSlug = json['table_slug'];
//     data = json['data'] != null ? CompanyData.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['table_slug'] = tableSlug;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class CompanyData {
//   int? count;
//   List<Company>? response;
//
//   CompanyData({this.count, this.response});
//
//   CompanyData.fromJson(Map<String, dynamic> json) {
//     count = json['count'];
//     if (json['response'] != null) {
//       response = <Company>[];
//       json['response'].forEach((v) {
//         response!.add(Company.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['count'] = count;
//     if (response != null) {
//       data['response'] = response!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Company {
//   String? aliasName;
//   String? bankDetails;
//   String? buildingAddress;
//   String? companyDirection;
//   String? companyType;
//   String? email;
//   String? fullName;
//   String? guid;
//   String? name;
//   String? phoneNumber;
//   String? photoUrl;
//   String? tin;
//
//   Company({
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
//
//   Company.fromJson(Map<String, dynamic> json) {
//     aliasName = json['alias_name'];
//     bankDetails = json['bank_details'];
//     buildingAddress = json['building_address'];
//     companyDirection = json['company_direction'];
//     companyType = json['company_type'];
//     email = json['email'];
//     fullName = json['full_name'];
//     guid = json['guid'];
//     name = json['name'];
//     phoneNumber = json['phone_number'];
//     photoUrl = json['photo_url'];
//     tin = json['tin'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['alias_name'] = aliasName;
//     data['bank_details'] = bankDetails;
//     data['building_address'] = buildingAddress;
//     data['company_direction'] = companyDirection;
//     data['company_type'] = companyType;
//     data['email'] = email;
//     data['full_name'] = fullName;
//     data['guid'] = guid;
//     data['name'] = name;
//     data['phone_number'] = phoneNumber;
//     data['photo_url'] = photoUrl;
//     data['tin'] = tin;
//     return data;
//   }
// }
