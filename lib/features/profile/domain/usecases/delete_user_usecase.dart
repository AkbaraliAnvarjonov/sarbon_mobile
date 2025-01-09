import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/profile_repository.dart';

class DeleteUserUseCase implements UseCase<bool, String> {
  DeleteUserUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, bool>> call(
    String userId,
  ) async {
    final response = await profileRepository.deleteUser(
      userId: userId,
    );
    return response;
  }
}
