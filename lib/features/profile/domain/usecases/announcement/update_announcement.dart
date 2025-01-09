import '../../../../../core/either/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../data/models/announcement/create_announcement/create_announcement_request.dart';
import '../../repository/profile_repository.dart';

class UpdateAnnouncementUseCase
    implements UseCase<bool, CreateAndUpdateAnnouncementRequest> {
  UpdateAnnouncementUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, bool>> call(
    CreateAndUpdateAnnouncementRequest params,
  ) async {
    final response =
        await profileRepository.updateAnnouncement(request: params);
    return response;
  }
}
