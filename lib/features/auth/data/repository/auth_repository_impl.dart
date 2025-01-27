part of '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
    required this.networkInfo,
  });

  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, SendCodeResponseEntity>> sendCodeOtp({
    required SendCodeRequestEntity requestEntity,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.sendCode(
          requestEntity.toModel,
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
  Future<Either<Failure, CheckUserResponseEntity>> checkUser({
    required CheckUserRequestEntity requestEntity,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.checkUser(
          requestEntity.toModel,
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
  Future<Either<Failure, bool>> verifyOtp({
    required VerifyOtpRequestModel requestEntity,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.verifyOtp(
          requestEntity,
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
  Future<Either<Failure, RegisterDriverResponseEntity>> registerDriver(
    RegisterDriverRequestEntity requestEntity,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.registerDriver(
          requestEntity.toModel,
        );
        return Right(response.toEntity());
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, RegisterSocialResponseEntity>> registerSocial(
    RegisterSocialRequestEntity requestEntity,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.registerSocial(
          requestEntity.toModel,
        );
        return Right(response.toEntity());
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, RegisterOperatorResponseEntity>> registerOperator(
    RegisterOperatorRequestEntity requestEntity,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.registerOperator(
          requestEntity.toModel,
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
  Future<Either<Failure, GetClientTypeResponseEntity>> getClientTypeId(
    GetClientTypeRequestEntity requestEntity,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.getClientType(
          requestEntity.toModel,
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
  Future<Either<Failure, LoginResponseEntity>> login(
    LoginRequestEntity requestEntity,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.login(
          requestEntity.toModel,
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
  Future<Either<Failure, GetCompaniesResponseEntity>> getCompaniesForRegistration(
    Map<String, dynamic> request,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.getCompaniesForRegistration(
          request,
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
  Future<Either<Failure, bool>> putFcmToken({
    required String fcmToken,
    required String loginId,
    required String userId,
    required String registerId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.putFcmToken(
          fcmToken: fcmToken,
          loginId: loginId,
          userId: userId,
          registerId: registerId,
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
  Future<Either<Failure, bool>> putUserPassword({
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.putUserPassword(
          password: password,
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
  Future<Either<Failure, UserAgreementEntity>> fetchUserAgreement() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.fetchUserAgreement();
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, TrailerTypeResponseEntity>> getTrailerType() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.getTrailerTypes();
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }
}
