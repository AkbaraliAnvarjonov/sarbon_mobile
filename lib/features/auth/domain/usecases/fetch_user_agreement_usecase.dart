import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_agreement/user_agreement_entity.dart';
import '../repository/auth_repository.dart';

class FetchUserAgreementUseCase
    implements UseCase<UserAgreementEntity, NoParams> {
  FetchUserAgreementUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, UserAgreementEntity>> call(
    NoParams noParams,
  ) async {
    final response = await authRepository.fetchUserAgreement();
    return response;
  }
}
