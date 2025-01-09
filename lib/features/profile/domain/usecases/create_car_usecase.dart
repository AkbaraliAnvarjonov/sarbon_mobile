import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/create_car_request_entity.dart';
import '../repository/profile_repository.dart';

class CreateCarUseCase implements UseCase<dynamic, CreateCarRequestEntity> {
  CreateCarUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, dynamic>> call(
    CreateCarRequestEntity params,
  ) async {
    final response = await profileRepository.createCar(requestEntity: params);
    return response;
  }
}
