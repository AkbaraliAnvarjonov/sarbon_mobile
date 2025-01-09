import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/notification/get_order_by_notification_entity/get_addresses_notification_entity.dart';
import '../repository/home_repository.dart';

class GetAddressesByNotificationUseCase
    implements
        UseCase<GetDetailAddressesByNotificationEntity,
            GetAddressesDetailParams> {
  GetAddressesByNotificationUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, GetDetailAddressesByNotificationEntity>> call(
    GetAddressesDetailParams params,
  ) async {
    final response = await homeRepository.getAddressesDetailByNotification(
      guid: params.guid,
    );
    return response;
  }
}

class GetAddressesDetailParams {
  const GetAddressesDetailParams({
    required this.guid,
  });

  final String guid;
}
