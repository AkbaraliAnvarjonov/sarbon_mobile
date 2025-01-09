import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/home_repository.dart';

class DeleteRouteUseCase implements UseCase<bool, DeleteRouteParams> {
  DeleteRouteUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(DeleteRouteParams params) async {
    final response = await homeRepository.deleteRoute(routeId: params.routeId);
    return response;
  }
}

class DeleteRouteParams {
  const DeleteRouteParams({required this.routeId});

  final String routeId;
}
