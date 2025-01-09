import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/route/fetch_routes/fetch_routes_request.dart';
import '../entities/routes/fetch_routes_entity.dart';
import '../repository/home_repository.dart';

class FetchRoutesUseCase
    implements UseCase<FetchRoutesEntity, FetchRoutesParams> {
  FetchRoutesUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, FetchRoutesEntity>> call(
    FetchRoutesParams params,
  ) async {
    final response = await homeRepository.fetchRoutes(
      request: params.request,
    );

    return response;
  }
}

class FetchRoutesParams {
  const FetchRoutesParams({
    required this.request,
  });

  final FetchRoutesRequest request;
}
