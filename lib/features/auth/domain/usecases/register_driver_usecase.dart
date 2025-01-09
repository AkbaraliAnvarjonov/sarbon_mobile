import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/registration/driver/register_driver_request_entity.dart';
import '../entities/registration/driver/register_driver_response_entity.dart';
import '../repository/auth_repository.dart';

class RegisterDriverUseCase implements UseCase<RegisterDriverResponseEntity, RegisterDriverRequestEntity> {
  RegisterDriverUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, RegisterDriverResponseEntity>> call(
    RegisterDriverRequestEntity params,
  ) async {
    final response = await authRepository.registerDriver(params);
    return response;
  }
}
