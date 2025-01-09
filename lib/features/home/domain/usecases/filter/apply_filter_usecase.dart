import '../../../../../core/either/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../data/models/apply_filter/apply_filter_request.dart';
import '../../entities/search/get_searched_cargo_items_response_entity.dart';
import '../../repository/home_repository.dart';

class FetchCargoFromFilterUseCase
    implements
        UseCase<GetSearchedCargoItemsResponseEntity,
            FetchCargoFromFilterParams> {
  FetchCargoFromFilterUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, GetSearchedCargoItemsResponseEntity>> call(
    FetchCargoFromFilterParams params,
  ) async {
    final response = await homeRepository.fetchCargoFromFilter(
      request: params.request,
    );
    return response;
  }
}

class FetchCargoFromFilterParams {
  const FetchCargoFromFilterParams({
    required this.request,
  });

  final ApplyFilterRequest request;
}
