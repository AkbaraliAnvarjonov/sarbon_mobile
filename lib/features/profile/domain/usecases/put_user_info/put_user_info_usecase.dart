import '../../../../../core/either/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../data/models/user_update/put_user_info_request.dart';
import '../../repository/profile_repository.dart';

class PutUserInfoUseCase implements UseCase<bool, PutUserInfoRequest> {
  PutUserInfoUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, bool>> call(
    PutUserInfoRequest params,
  ) async {
    final response = await profileRepository.updateUserInfo(
      request: params,
    );
    return response;
  }
}
