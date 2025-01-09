part of '../../domain/repository/orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  OrdersRepositoryImpl({
    required this.ordersRemoteDataSource,
    required this.ordersLocalDataSource,
    required this.networkInfo,
  });

  final OrdersRemoteDataSource ordersRemoteDataSource;
  final OrdersLocalDataSource ordersLocalDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, GetOrdersResponseEntity>> getOrders({
    required List<String> ordersType,
    required int limit,
    required int offset,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await ordersRemoteDataSource.getOrders(
          ordersType: ordersType,
          limit: limit,
          offset: offset,
        );
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, GetOrderDetailsResponseEntity?>> getOrderDetails({
    required String guid,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await ordersRemoteDataSource.getOrderDetails(
          guid: guid,
        );
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> putOrderStatuses({
    required List<String> statuses,
    required String orderId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await ordersRemoteDataSource.putOrderStatuses(
          orderId: orderId,
          statuses: statuses,
        );
        return Right(response);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> postRatingReviews({
    required RatingReviewsRequestEntity requestEntity,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await ordersRemoteDataSource.postRatingReviews(
          request: requestEntity.toModel,
        );
        return Right(response);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> putOrder({
    required String orderId,
    required String carType,
    List<String>? whoCancellation,
    required List<String> status,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await ordersRemoteDataSource.putOrder(
          orderId: orderId,
          whoCancellation: whoCancellation,
          status: status,
          carType: carType,
        );
        return Right(response);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, GetDetailAddressesListResponseEntity>> getAddresses({
    required List<String> guids,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await ordersRemoteDataSource.getAddresses(
          getAddressesRequest: GetAddressesRequest(
            data: Data(
              objectIds: guids,
            ),
          ),
        );
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, FetchAddressesPositionsListEntity>> fetchAddressPositions({
    required String guid,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await ordersRemoteDataSource.fetchAddressesPositions(
          fetchAddressPositionRequest: FetchAddressPositionRequest(
            responseId: guid,
          ),
        );
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> putNewOrderStatuses({
    required String orderId,
    required num acceptedOffers,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await ordersRemoteDataSource.putNewOrderStatuses(
          orderId: orderId,
          acceptedOffers: acceptedOffers,
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
