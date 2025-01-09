import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/notification/get_order_by_notification_entity/get_order_by_notification_entity.dart';
import '../repository/home_repository.dart';

class GetOrderByNotificationUseCase
    implements UseCase<GetOrderByNotificationEntity?, GetOrderDetailsParams> {
  GetOrderByNotificationUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, GetOrderByNotificationEntity?>> call(
    GetOrderDetailsParams params,
  ) async {
    final response = await homeRepository.getOrderDetailsByNotification(
      guid: params.guid,
    );
    return response;
  }
}

class GetOrderDetailsParams {
  const GetOrderDetailsParams({
    required this.guid,
  });

  final String guid;
}
