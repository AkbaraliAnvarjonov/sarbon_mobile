import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/get_load_types_response_entity.dart';
import '../repository/profile_repository.dart';

class GetLoadTypesUseCase
    implements UseCase<GetLoadTypesResponseEntity, NoParams> {
  GetLoadTypesUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, GetLoadTypesResponseEntity>> call(
    NoParams params,
  ) async {
    final response = await profileRepository.getLoadTypes();
    return response;
  }
}
