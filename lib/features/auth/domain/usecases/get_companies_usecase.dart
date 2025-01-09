import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/login/get_companies_response_entity.dart';
import '../repository/auth_repository.dart';

class GetCompaniesUseCase
    implements UseCase<GetCompaniesResponseEntity, Map<String, dynamic>> {
  GetCompaniesUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, GetCompaniesResponseEntity>> call(
    Map<String, dynamic> params,
  ) async {
    final response = await authRepository.getCompaniesForRegistration(params);
    return response;
  }
}
