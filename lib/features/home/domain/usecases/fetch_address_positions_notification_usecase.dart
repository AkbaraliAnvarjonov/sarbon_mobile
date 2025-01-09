import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/notification/get_order_by_notification_entity/fetch_address_positions_notification_entity.dart';
import '../repository/home_repository.dart';

class FetchAddressesPositionsByNotificationUseCase
    implements
        UseCase<FetchAddressesPositionsNotificationEntity,
            FetchAddressesPositionsParams> {
  FetchAddressesPositionsByNotificationUseCase(this.ordersRepository);

  final HomeRepository ordersRepository;

  @override
  Future<Either<Failure, FetchAddressesPositionsNotificationEntity>> call(
    FetchAddressesPositionsParams params,
  ) async {
    final response = await ordersRepository.fetchAddressPositionsNotification(
      guid: params.guid,
    );
    return response;
  }
}

class FetchAddressesPositionsParams {
  const FetchAddressesPositionsParams({
    required this.guid,
  });

  final String guid;
}
