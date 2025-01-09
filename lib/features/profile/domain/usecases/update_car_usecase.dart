import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/create_car_request_model.dart';
import '../repository/profile_repository.dart';

class UpdateCarUseCase implements UseCase<bool, CreateUpdateCarRequestModel> {
  UpdateCarUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, bool>> call(
    CreateUpdateCarRequestModel params,
  ) async {
    final response = await profileRepository.updateCar(request: params);
    return response;
  }
}
