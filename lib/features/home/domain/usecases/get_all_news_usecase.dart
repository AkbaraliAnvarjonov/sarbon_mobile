import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/news/get_news_response_entity.dart';
import '../repository/home_repository.dart';

class GetAllNewsUseCase
    implements UseCase<GetNewsResponseEntity, GetAllNewsParams> {
  GetAllNewsUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, GetNewsResponseEntity>> call(
    GetAllNewsParams params,
  ) async {
    final response = await homeRepository.getAllNews(
      limit: params.limit,
      offset: params.offset,
    );
    return response;
  }
}

class GetAllNewsParams {
  const GetAllNewsParams({
    required this.limit,
    required this.offset,
  });

  final int limit;
  final int offset;
}
