import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/route/create_route/create_route_request.dart';
import '../repository/home_repository.dart';

class CreateRouteUseCase
    implements UseCase<bool, CreateRouteParams> {
  CreateRouteUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(
    CreateRouteParams params,
  ) async {
    final response = await homeRepository.createRoute(
      request: params.request,
    );
    return response;
  }
}

class CreateRouteParams {
  const CreateRouteParams({
    required this.request,
  });

  final CreateRouteRequest request;
}
