import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/orders_repository.dart';

class PutNewOrderStatusesUseCase
    implements UseCase<bool, PutNewOrderStatusesParams> {
  PutNewOrderStatusesUseCase(this.ordersRepository);

  final OrdersRepository ordersRepository;

  @override
  Future<Either<Failure, bool>> call(
    PutNewOrderStatusesParams params,
  ) async {
    final response = await ordersRepository.putNewOrderStatuses(
      orderId: params.orderId,
      acceptedOffers: params.acceptedOffers,
    );
    return response;
  }
}

class PutNewOrderStatusesParams {
  const PutNewOrderStatusesParams({
    required this.orderId,
    required this.acceptedOffers,
  });

  final String orderId;
  final num acceptedOffers;
}
