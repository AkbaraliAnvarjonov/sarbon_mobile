import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/notification/put_notification_request.dart';
import '../repository/home_repository.dart';

class PutNotificationUseCase
    implements UseCase<dynamic, PutNotificationParams> {
  PutNotificationUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, dynamic>> call(
    PutNotificationParams params,
  ) async {
    final response = await homeRepository.putNotification(
      request: params.request,
    );
    return response;
  }
}

class PutNotificationParams {
  const PutNotificationParams({
    required this.request,
  });

  final PutNotificationRequest request;
}
