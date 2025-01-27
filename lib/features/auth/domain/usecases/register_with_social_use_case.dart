import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/registration/social/register_social_request_entity.dart';
import '../entities/registration/social/register_social_response.dart';
import '../repository/auth_repository.dart';

class RegisterWithSocialUseCase implements UseCase<RegisterSocialResponseEntity, RegisterSocialRequestEntity> {
  RegisterWithSocialUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, RegisterSocialResponseEntity>> call(
    RegisterSocialRequestEntity params,
  ) async {
    final response = await authRepository.registerSocial(params);
    return response;
  }
}
