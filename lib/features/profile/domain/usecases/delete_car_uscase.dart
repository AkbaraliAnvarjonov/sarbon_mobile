import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/profile_repository.dart';

class DeleteCarUseCase implements UseCase<bool, String> {
  DeleteCarUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, bool>> call(
    String carId,
  ) async {
    final response = await profileRepository.deleteCar(carId: carId);
    return response;
  }
}
