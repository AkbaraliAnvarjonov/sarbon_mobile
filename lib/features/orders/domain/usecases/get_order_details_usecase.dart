import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/get_order_details_response_entity.dart';
import '../repository/orders_repository.dart';

class GetOrderDetailsUseCase
    implements UseCase<GetOrderDetailsResponseEntity?, GetOrderDetailsParams> {
  GetOrderDetailsUseCase(this.ordersRepository);

  final OrdersRepository ordersRepository;

  @override
  Future<Either<Failure, GetOrderDetailsResponseEntity?>> call(
    GetOrderDetailsParams params,
  ) async {
    final response = await ordersRepository.getOrderDetails(
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
