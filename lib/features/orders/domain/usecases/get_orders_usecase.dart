import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/get_orders_response_entity.dart';
import '../repository/orders_repository.dart';

class GetOrdersUseCase
    implements UseCase<GetOrdersResponseEntity, GetOrdersParams> {
  GetOrdersUseCase(this.ordersRepository);

  final OrdersRepository ordersRepository;

  @override
  Future<Either<Failure, GetOrdersResponseEntity>> call(
    GetOrdersParams params,
  ) async {
    final response = await ordersRepository.getOrders(
      limit: params.limit,
      offset: params.offset,
      ordersType: params.ordersType,
    );
    return response;
  }
}

class GetOrdersParams {
  const GetOrdersParams({
    required this.limit,
    required this.offset,
    required this.ordersType,
  });

  final int limit;
  final int offset;
  final List<String> ordersType;
}
