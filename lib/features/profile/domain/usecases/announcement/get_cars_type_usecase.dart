import '../../../../../core/either/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/announcement/type_car/type_cars_entity.dart';
import '../../repository/profile_repository.dart';

class GetCarTypesUseCase implements UseCase<TypeCarsEntity, NoParams> {
  GetCarTypesUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, TypeCarsEntity>> call(
    NoParams params,
  ) async {
    final response = await profileRepository.getTypeCars();
    return response;
  }
}
