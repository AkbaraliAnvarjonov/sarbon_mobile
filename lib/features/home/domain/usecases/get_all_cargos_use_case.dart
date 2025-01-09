import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/search/get_searched_cargo_items_request_entity.dart';
import '../entities/search/get_searched_cargo_items_response_entity.dart';
import '../repository/home_repository.dart';

class GetAllCargosUseCase implements UseCase<GetSearchedCargoItemsResponseEntity, GetAllCargoItemsParams> {
  GetAllCargosUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, GetSearchedCargoItemsResponseEntity>> call(
    GetAllCargoItemsParams params,
  ) async {
    final response = await homeRepository.getAllCargoItems(
      limit: params.limit,
      offset: params.offset,
    );
    return response;
  }
}

class GetAllCargoItemsParams {
  const GetAllCargoItemsParams({
    required this.limit,
    required this.offset,
  });

  final int limit;
  final int offset;
}
