import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/registration/driver/trailer_type_response_entity.dart';
import '../repository/auth_repository.dart';

class GetTrailerTypeUsecase implements UseCase<TrailerTypeResponseEntity, Map<String, dynamic>> {
  GetTrailerTypeUsecase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, TrailerTypeResponseEntity>> call(
    Map<String, dynamic> params,
  ) async {
    final response = await authRepository.getTrailerType();
    return response;
  }
}
