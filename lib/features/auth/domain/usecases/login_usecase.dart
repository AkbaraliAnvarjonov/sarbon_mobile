import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/login/login_request_entity.dart';
import '../entities/login/login_response_entity.dart';
import '../repository/auth_repository.dart';

class LoginUseCase implements UseCase<LoginResponseEntity, LoginRequestEntity> {
  LoginUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, LoginResponseEntity>> call(
    LoginRequestEntity loginRequestEntity,
  ) async {
    final response = await authRepository.login(loginRequestEntity);
    return response;
  }
}
