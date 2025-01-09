// import '../../../../core/either/either.dart';
// import '../../../../core/error/failure.dart';
// import '../../../../core/usecase/usecase.dart';
// import '../entities/search/get_company_info_response_entity.dart';
// import '../repository/profile_repository.dart';
//
// class GetCompanyInfoUseCase
//     implements UseCase<GetCompanyInfoResponseEntity, GetCompanyInfoParams> {
//   GetCompanyInfoUseCase(this.homeRepository);
//
//   final HomeRepository homeRepository;
//
//   @override
//   Future<Either<Failure, GetCompanyInfoResponseEntity>> call(
//     GetCompanyInfoParams params,
//   ) async {
//     final response = await homeRepository.getCompanyInfo(
//       guid: params.guid,
//     );
//     return response;
//   }
// }
//
// class GetCompanyInfoParams {
//   const GetCompanyInfoParams({
//     required this.guid,
//   });
//
//   final String guid;
// }
