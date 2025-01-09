part of '../../domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
    required this.networkInfo,
  });

  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, GetNewsResponseEntity>> getAllNews({
    required int limit,
    required int offset,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.getAllNews(
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
  Future<Either<Failure, GetAddressesResponseEntity>> getAddresses({
    required int limit,
    required int offset,
    String? searchedText,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.getAddresses(
          limit: limit,
          offset: offset,
          searchedText: searchedText,
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
  Future<Either<Failure, GetSearchedCargoItemsResponseEntity>> getSearchedCargoItems({
    required GetSearchedCargoItemsRequestEntity requestEntity,
    required int limit,
    required int offset,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.getSearchedCargoItems(
          request: requestEntity.toModel,
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
  Future<Either<Failure, GetCargoDetailsResponseEntity?>> getCargoDetails({
    required String guid,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.getCargoDetails(
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
  Future<Either<Failure, GetVehicleTypesResponseEntity>> getVehicleTypes({
    required int limit,
    required int offset,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.getVehicleTypes(
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
  Future<Either<Failure, dynamic>> putOppositeOffer({
    required PutOppositeOfferRequestModel request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await homeRemoteDataSource.putOppositeOffer(
          requestModel: request,
        );
        return const Right(true);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> postOppositeOffer({
    required String orderId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.postOppositeOffer(
          orderId: orderId,
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
  Future<Either<Failure, CargoAddressesPointEntity>> getAddressesPoint({
    required List<String> guids,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.getAddressesPoint(
          request: CargoPointsAddressesRequest(
            data: MainData(
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
  Future<Either<Failure, bool>> createRoute({
    required CreateRouteRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await homeRemoteDataSource.createRoute(
          request: request,
        );
        return const Right(true);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, FetchRoutesEntity>> fetchRoutes({
    required FetchRoutesRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.fetchRoutes(
          request: request,
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
  Future<Either<Failure, bool>> deleteRoute({required String routeId}) async {
    if (await networkInfo.isConnected) {
      try {
        await homeRemoteDataSource.deleteRoute(
          routeId: routeId,
        );
        return const Right(true);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> updateRoute({
    required UpdateRouteRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await homeRemoteDataSource.updateRoute(
          request: request,
        );
        return const Right(true);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, NotificationResponseEntity>> fetchNotifications({
    required NotificationRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.fetchNotifications(
          request: request,
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
  Future<Either<Failure, bool>> putNotification({
    required PutNotificationRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await homeRemoteDataSource.putNotification(
          request: request,
        );
        return const Right(true);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> putFavouriteCargo({
    required PutFavouriteRequestHome request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await homeRemoteDataSource.putFavouriteCargo(
          request: request,
        );
        return const Right(true);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, TypesCargoEntity>> fetchTypesCargo() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.fetchCargoTypes();
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, TypesPaymentEntity>> fetchTypesPayment() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.fetchPaymentTypes();
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, GetSearchedCargoItemsResponseEntity>> fetchCargoFromFilter({
    required ApplyFilterRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.fetchCargoFromFilter(
          request: request,
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
  Future<Either<Failure, FetchCurrencyEntity>> fetchCurrency() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.fetchCurrency();
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, GetOrderByNotificationEntity?>> getOrderDetailsByNotification({
    required String guid,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.getOrderDetailsByNotification(
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
  Future<Either<Failure, GetDetailAddressesByNotificationEntity>> getAddressesDetailByNotification({
    required String guid,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.getAddressesByNotification(
          getAddressesRequest: GetAddressesRequestByNotification(
            data: MainNotificationData(
              objectIds: [guid],
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
  Future<Either<Failure, FetchAddressesPositionsNotificationEntity>> fetchAddressPositionsNotification({
    required String guid,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.fetchAddressesPositionsNotification(
          fetchAddressPositionRequest: FetchAddressPositionNotificationRequest(
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
  Future<Either<Failure, bool>> putOrder({
    required String orderId,
    required List<String> status,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.putOrderByNotification(
          orderId: orderId,
          status: status,
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
  Future<Either<Failure, FetchAddressesPositionsCargoEntity>> fetchAddressPositionsCargo({
    required String guid,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.fetchAddressesPositionsCargo(
          fetchAddressPositionRequest: FetchAddressPositionCargoRequest(
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
  Future<Either<Failure, GetSearchedCargoItemsResponseEntity>> getAllCargoItems(
      {required int limit, required int offset}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.getAllCargos(
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
  Future<Either<Failure, GetSearchedCargoItemsResponseEntity>> getAllCargoItemsWithoutFilter(
      {required int limit, required int offset}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeRemoteDataSource.getAllCargosWithoutFilter(
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
}
