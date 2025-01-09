import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/get_addresses_response_entity.dart';
import '../repository/orders_repository.dart';

class GetAddressesDetailUseCase
    implements
        UseCase<GetDetailAddressesListResponseEntity,
            GetAddressesDetailParams> {
  GetAddressesDetailUseCase(this.ordersRepository);

  final OrdersRepository ordersRepository;

  @override
  Future<Either<Failure, GetDetailAddressesListResponseEntity>> call(
    GetAddressesDetailParams params,
  ) async {
    final response = await ordersRepository.getAddresses(
      guids: params.guids,
    );
    return response;
  }
}

class GetAddressesDetailParams {
  const GetAddressesDetailParams({
    required this.guids,
  });

  final List<String> guids;
}
