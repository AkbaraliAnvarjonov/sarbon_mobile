import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/search/get_searched_cargo_items_request_entity.dart';
import '../entities/search/get_searched_cargo_items_response_entity.dart';
import '../repository/home_repository.dart';

class GetSearchedCargoItemsUseCase
    implements
        UseCase<GetSearchedCargoItemsResponseEntity,
            GetSearchedCargoItemsParams> {
  GetSearchedCargoItemsUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, GetSearchedCargoItemsResponseEntity>> call(
    GetSearchedCargoItemsParams params,
  ) async {
    final response = await homeRepository.getSearchedCargoItems(
      requestEntity: params.requestEntity,
      limit: params.limit,
      offset: params.offset,
    );
    return response;
  }
}

class GetSearchedCargoItemsParams {
  const GetSearchedCargoItemsParams({
    required this.requestEntity,
    required this.limit,
    required this.offset,
  });

  final GetSearchedCargoItemsRequestEntity requestEntity;
  final int limit;
  final int offset;
}
