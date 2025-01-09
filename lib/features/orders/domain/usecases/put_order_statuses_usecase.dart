import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/orders_repository.dart';

class PutOrderStatusesUseCase implements UseCase<dynamic, PutOrderStatusesParams> {
  PutOrderStatusesUseCase(this.ordersRepository);

  final OrdersRepository ordersRepository;

  @override
  Future<Either<Failure, dynamic>> call(
    PutOrderStatusesParams params,
  ) async {
    final response = await ordersRepository.putOrderStatuses(
      orderId: params.orderId,
      statuses: params.statuses,
    );
    return response;
  }
}

class PutOrderStatusesParams {
  const PutOrderStatusesParams({
    required this.orderId,
    required this.statuses,
  });

  final String orderId;

  final List<String> statuses;
}
