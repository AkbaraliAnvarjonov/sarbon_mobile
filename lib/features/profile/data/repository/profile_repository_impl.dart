part of '../../domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({
    required this.profileRemoteDataSource,
    required this.profileLocalDataSource,
    required this.networkInfo,
  });

  final ProfileRemoteDataSource profileRemoteDataSource;
  final ProfileLocalDataSource profileLocalDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, GetUserCarsResponseEntity>> getUserCars({
    required int limit,
    required int offset,
    required String userId,
    required List<String> status,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.getUserCars(
          limit: limit,
          offset: offset,
          userId: userId,
          status: status,
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
  Future<Either<Failure, GetCargoTypesResponseEntity>> getCargoTypes() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.getCargoTypes();
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, GetLoadTypesResponseEntity>> getLoadTypes() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.getLoadTypes();
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, GetTrailerTypesResponseEntity>> getTrailerTypes() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.getTrailerTypes();
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> checkVehicleNumber({required String vehicleNumber}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.checkVehicleNumber(vehicleNumber: vehicleNumber);
        return Right(response);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, GetTrailerTypesResponseEntity>> getFuelTypes() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.getFuelTypes();
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> createCar({
    required CreateCarRequestEntity requestEntity,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.createCar(
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
  Future<Either<Failure, GetUserInfoResponseEntity>> getUserInfo({
    required String userId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.getUserInfo(
          userId: userId,
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
  Future<Either<Failure, RecommendationCarsEntity>> recommendationCars({
    required RecommendationCarsRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.getRecommendationCars(
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
  Future<Either<Failure, SaleCarsSearchResultEntity>> getSaleCarsSearchResult({
    required CarsSaleSearchRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.getSaleCarsSearchResult(
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
  Future<Either<Failure, TypeCarsEntity>> getTypeCars() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.getTypeCars();
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, TypeCurrencyEntity>> getTypeCurrency() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.getTypeCurrency();
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, AddressesEntity>> getAddresses() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.getAddresses();
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> createAnnouncement({
    required CreateAndUpdateAnnouncementRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await profileRemoteDataSource.createAnnouncement(request: request);
        return const Right(true);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, GetActiveInActiveAnnouncementEntity>> getActiveAnnouncement({
    required GetActiveAnnouncementRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.getActiveAnnouncement(
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
  Future<Either<Failure, bool>> updateAnnouncement({
    required CreateAndUpdateAnnouncementRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await profileRemoteDataSource.updateAnnouncement(request: request);
        return const Right(true);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> updateCar({
    required CreateUpdateCarRequestModel request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await profileRemoteDataSource.updateCar(
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
  Future<Either<Failure, bool>> deleteCar({required String carId}) async {
    if (await networkInfo.isConnected) {
      try {
        await profileRemoteDataSource.deleteCar(
          carId: carId,
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
  Future<Either<Failure, FavouriteCargoResponseEntity>> fetchFavouriteCargo({
    required FavouriteCargoRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.fetchFavouriteCargo(
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
  Future<Either<Failure, bool>> putFavouriteCargo({
    required PutFavouriteRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await profileRemoteDataSource.putFavouriteCargo(
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
  Future<Either<Failure, ReferenceBookEntity>> fetchReferenceBook() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.fetchReferenceBook();
        return Right(response.toEntity);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> createComplain({
    required CreateComplainRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.createComplain(
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

  @override
  Future<Either<Failure, bool>> updateUserInfo({
    required PutUserInfoRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await profileRemoteDataSource.putUserInfo(
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
  Future<Either<Failure, bool>> deleteUser({required String userId}) async {
    if (await networkInfo.isConnected) {
      try {
        await profileRemoteDataSource.deleteUser(
          userId: userId,
        );
        return const Right(true);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }
}
