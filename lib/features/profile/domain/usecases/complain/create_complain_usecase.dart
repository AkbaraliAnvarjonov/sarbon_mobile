import '../../../../../core/either/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../data/models/complain/create_complain_request.dart';
import '../../repository/profile_repository.dart';

class CreateComplainUseCase implements UseCase<dynamic, CreateComplainRequest> {
  CreateComplainUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, dynamic>> call(
    CreateComplainRequest params,
  ) async {
    final response = await profileRepository.createComplain(
      request: params,
    );
    return response;
  }
}
