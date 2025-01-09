part of '../../domain/repository/main_repository.dart';

class MainRepositoryImpl implements MainRepository {
  MainRepositoryImpl({
    required this.mainRemoteDataSource,
    required this.networkInfo,
  });

  final MainRemoteDataSource mainRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, bool>> putTracking({
    required TrackingForApiRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await mainRemoteDataSource.putTracking(
          request: request,
        );
        return Right(response);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }
}
