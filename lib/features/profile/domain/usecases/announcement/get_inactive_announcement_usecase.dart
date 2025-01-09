import '../../../../../core/either/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../router/app_routes.dart';
import '../../../data/models/announcement/get_active_announcemant/get_active_announcement_request.dart';
import '../../entities/announcement/get_active_inactive_announcement/get_active_inactive_announcement_entity.dart';
import '../../repository/profile_repository.dart';

class GetInActiveAnnouncementUseCase
    implements UseCase<GetActiveInActiveAnnouncementEntity, NoParams> {
  GetInActiveAnnouncementUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, GetActiveInActiveAnnouncementEntity>> call(
      NoParams params,
      ) async {
    final response = await profileRepository.getActiveAnnouncement(
      request: GetActiveAnnouncementRequest(
        limit: 100,
        offset: 0,
        status: ['in_active'],
        usersId: localSource.userId,
        withRelations: true,
        search: '',
      ),
    );
    return response;
  }
}
