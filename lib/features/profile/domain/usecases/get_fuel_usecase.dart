import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/get_trailer_types_response_entity.dart';
import '../repository/profile_repository.dart';

class GetFuelTypesUseCase
    implements UseCase<GetTrailerTypesResponseEntity, NoParams> {
  GetFuelTypesUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, GetTrailerTypesResponseEntity>> call(
      NoParams params,
      ) async {
    final response = await profileRepository.getFuelTypes();
    return response;
  }
}
