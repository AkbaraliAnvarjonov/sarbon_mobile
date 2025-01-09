import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/route/update_route/update_route_request.dart';
import '../repository/home_repository.dart';

class UpdateRouteUseCase implements UseCase<bool, UpdateRouteParams> {
  UpdateRouteUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(
    UpdateRouteParams params,
  ) async {
    final response = await homeRepository.updateRoute(
      request: params.request,
    );
    return response;
  }
}

class UpdateRouteParams {
  const UpdateRouteParams({
    required this.request,
  });

  final UpdateRouteRequest request;
}
