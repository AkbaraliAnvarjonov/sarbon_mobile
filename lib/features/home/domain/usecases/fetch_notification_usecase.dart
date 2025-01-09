import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../router/app_routes.dart';
import '../../data/models/notification/notification_request.dart';
import '../entities/notification/notification_response_entity.dart';
import '../repository/home_repository.dart';

class FetchNotificationUseCase
    implements UseCase<NotificationResponseEntity, NoParams> {
  FetchNotificationUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, NotificationResponseEntity>> call(
    NoParams params,
  ) async {
    final response = await homeRepository.fetchNotifications(
      request: NotificationRequest(
        usersId: localSource.userId,
      ),
    );
    return response;
  }
}
