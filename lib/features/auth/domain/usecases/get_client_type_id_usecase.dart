import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/login/get_client_type_request_entity.dart';
import '../entities/login/get_client_type_response_entity.dart';
import '../repository/auth_repository.dart';

class GetClientTypeIdUseCase implements UseCase<GetClientTypeResponseEntity, GetClientTypeRequestEntity> {
  GetClientTypeIdUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, GetClientTypeResponseEntity>> call(
    GetClientTypeRequestEntity getClientTypeRequestEntity,
  ) async {
    final response = await authRepository.getClientTypeId(
      getClientTypeRequestEntity,
    );
    return response;
  }
}
