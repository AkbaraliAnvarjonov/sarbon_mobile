import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/registration/operator/register_operator_request_entity.dart';
import '../entities/registration/operator/register_operator_response_entity.dart';
import '../repository/auth_repository.dart';

class RegisterOperatorUseCase
    implements
        UseCase<RegisterOperatorResponseEntity, RegisterOperatorRequestEntity> {
  RegisterOperatorUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, RegisterOperatorResponseEntity>> call(
    RegisterOperatorRequestEntity params,
  ) async {
    final response = await authRepository.registerOperator(params);
    return response;
  }
}
