import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/get_cargo_types_response_entity.dart';
import '../repository/profile_repository.dart';

class GetCargoTypesUseCase
    implements UseCase<GetCargoTypesResponseEntity, NoParams> {
  GetCargoTypesUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, GetCargoTypesResponseEntity>> call(
    NoParams params,
  ) async {
    final response = await profileRepository.getCargoTypes();
    return response;
  }
}
