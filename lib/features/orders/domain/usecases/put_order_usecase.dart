import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/orders_repository.dart';

class PutOrderUseCase implements UseCase<dynamic, PutOrderParams> {
  PutOrderUseCase(this.ordersRepository);

  final OrdersRepository ordersRepository;

  @override
  Future<Either<Failure, dynamic>> call(
    PutOrderParams params,
  ) async {
    final response = await ordersRepository.putOrder(
      orderId: params.orderId,
      status: params.status,
      whoCancellation: params.whoCancellation,
      carType: params.carType,
    );
    return response;
  }
}

class PutOrderParams {
  const PutOrderParams({
    required this.orderId,
    required this.status,
    required this.carType,
    this.whoCancellation,
  });

  final String orderId;
  final String carType;
  final List<String>? whoCancellation;
  final List<String> status;
}
