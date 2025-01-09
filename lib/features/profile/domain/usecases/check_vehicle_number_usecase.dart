import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/profile_repository.dart';

class CheckVehicleNumberUseCase implements UseCase<bool, String> {
  CheckVehicleNumberUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, bool>> call(String vehicleNumber) async {
    final response = await profileRepository.checkVehicleNumber(vehicleNumber: vehicleNumber);
    return response;
  }
}
