// ignore_for_file: avoid_redundant_argument_values

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sarbon_mobile/features/auth/domain/usecases/check_user_usecase.dart';
import 'package:sarbon_mobile/features/auth/domain/usecases/register_with_social_use_case.dart';
import 'package:sarbon_mobile/features/profile/domain/usecases/check_vehicle_number_usecase.dart';

import '../features/profile/presentation/bloc/my_cars/add_car/add_car_bloc.dart';
import 'core/connectivity/internet_connection_checker.dart';
import 'core/local_source/local_source.dart';
import 'core/platform/network_info.dart';
import 'features/auth/data/data_source/local/auth_local_data_source.dart';
import 'features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecases/fetch_user_agreement_usecase.dart';
import 'features/auth/domain/usecases/get_client_type_id_usecase.dart';
import 'features/auth/domain/usecases/get_companies_usecase.dart';
import 'features/auth/domain/usecases/get_trailer_type_usecase.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/put_fcm_token_usecase.dart';
import 'features/auth/domain/usecases/register_driver_usecase.dart';
import 'features/auth/domain/usecases/register_operator_usecase.dart';
import 'features/auth/domain/usecases/send_code_usecase.dart';
import 'features/auth/domain/usecases/update_user_password_usecase.dart';
import 'features/auth/domain/usecases/verify_otp_usecase.dart';
import 'features/auth/presentation/bloc/confirmation_user/confirmation_user_bloc.dart';
import 'features/auth/presentation/bloc/forgot_password/forgot_password_bloc.dart';
import 'features/auth/presentation/bloc/login/login_bloc.dart';
import 'features/auth/presentation/bloc/user_agreement/user_agreement_bloc.dart';
import 'features/home/data/data_source/local/home_local_data_source.dart';
import 'features/home/data/data_source/remote/home_remote_data_source.dart';
import 'features/home/domain/repository/home_repository.dart';
import 'features/home/domain/usecases/address_position_cargo_usecase.dart';
import 'features/home/domain/usecases/create_route_usecase.dart';
import 'features/home/domain/usecases/delete_route_usecase.dart';
import 'features/home/domain/usecases/fetch_address_positions_notification_usecase.dart';
import 'features/home/domain/usecases/fetch_currency_usecase.dart';
import 'features/home/domain/usecases/fetch_notification_usecase.dart';
import 'features/home/domain/usecases/fetch_routes_usecase.dart';
import 'features/home/domain/usecases/filter/apply_filter_usecase.dart';
import 'features/home/domain/usecases/filter/fetch_type_cargo_usecase.dart';
import 'features/home/domain/usecases/filter/fetch_type_payment_usecase.dart';
import 'features/home/domain/usecases/get_addresses_by_notification_uscase.dart';
import 'features/home/domain/usecases/get_addresses_point_usecase.dart';
import 'features/home/domain/usecases/get_addresses_usecase.dart';
import 'features/home/domain/usecases/get_all_cargos_use_case.dart';
import 'features/home/domain/usecases/get_all_cargos_without_filter_usecase.dart';
import 'features/home/domain/usecases/get_all_news_usecase.dart';
import 'features/home/domain/usecases/get_cargo_details_usecase.dart';
import 'features/home/domain/usecases/get_order_details_notification_usecase.dart';
import 'features/home/domain/usecases/get_searched_cargo_items_usecase.dart';
import 'features/home/domain/usecases/get_vehicle_types_usecase.dart';
import 'features/home/domain/usecases/post_opposite_offer_usecase.dart';
import 'features/home/domain/usecases/put_favourite_cargo_home_usecase.dart';
import 'features/home/domain/usecases/put_notification_usecase.dart';
import 'features/home/domain/usecases/put_opposite_offer_usecase.dart';
import 'features/home/domain/usecases/put_order_by_notification_usecase.dart';
import 'features/home/domain/usecases/update_route_usecase.dart';
import 'features/home/presentation/bloc/cargo_details/cargo_details_bloc.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/bloc/news/news_bloc.dart';
import 'features/home/presentation/bloc/notification/detail_notification/detail_notification_bloc.dart';
import 'features/home/presentation/bloc/notification/notification_bloc.dart';
import 'features/home/presentation/bloc/notification/order_from_notification/order_for_notification_bloc.dart';
import 'features/home/presentation/bloc/opposite_offer/opposite_offer_bloc.dart';
import 'features/home/presentation/bloc/route/add_route/add_route_bloc.dart';
import 'features/home/presentation/bloc/route/routes_bloc.dart';
import 'features/home/presentation/bloc/route/update_route/update_route_bloc.dart';
import 'features/home/presentation/bloc/searched_cargos/searched_cargos_bloc.dart';
import 'features/main/data/data_source/main_remote_data_source.dart';
import 'features/main/domain/repository/main_repository.dart';
import 'features/main/presentation/bloc/main_bloc.dart';
import 'features/orders/data/data_source/local/orders_local_data_source.dart';
import 'features/orders/data/data_source/remote/orders_remote_data_source.dart';
import 'features/orders/domain/repository/orders_repository.dart';
import 'features/orders/domain/usecases/fetch_address_positions_usecase.dart';
import 'features/orders/domain/usecases/get_addresses_data_uscase.dart';
import 'features/orders/domain/usecases/get_order_details_usecase.dart';
import 'features/orders/domain/usecases/get_orders_usecase.dart';
import 'features/orders/domain/usecases/post_rating_reviews_usecase.dart';
import 'features/orders/domain/usecases/put_new_order_status_usecase.dart';
import 'features/orders/domain/usecases/put_order_statuses_usecase.dart';
import 'features/orders/domain/usecases/put_order_usecase.dart';
import 'features/orders/presentation/bloc/order_detail/order_details_bloc.dart';
import 'features/orders/presentation/bloc/orders_bloc.dart';
import 'features/others/presentation/bloc/onboarding_bloc.dart';
import 'features/profile/data/data_source/local/profile_local_data_source.dart';
import 'features/profile/data/data_source/remote/profile_remote_data_source.dart';
import 'features/profile/domain/repository/profile_repository.dart';
import 'features/profile/domain/usecases/announcement/create_announcement.dart';
import 'features/profile/domain/usecases/announcement/get_active_announcement_usecase.dart';
import 'features/profile/domain/usecases/announcement/get_addresses_usecase.dart';
import 'features/profile/domain/usecases/announcement/get_cars_type_usecase.dart';
import 'features/profile/domain/usecases/announcement/get_currency_type_usecase.dart';
import 'features/profile/domain/usecases/announcement/get_inactive_announcement_usecase.dart';
import 'features/profile/domain/usecases/announcement/update_announcement.dart';
import 'features/profile/domain/usecases/complain/create_complain_usecase.dart';
import 'features/profile/domain/usecases/create_car_usecase.dart';
import 'features/profile/domain/usecases/delete_car_uscase.dart';
import 'features/profile/domain/usecases/delete_user_usecase.dart';
import 'features/profile/domain/usecases/favourite_cargo/fetch_favourite_cargo_uscase.dart';
import 'features/profile/domain/usecases/favourite_cargo/put_favourite_cargo_usecase.dart';
import 'features/profile/domain/usecases/get_cargo_types_usecase.dart';
import 'features/profile/domain/usecases/get_fuel_usecase.dart';
import 'features/profile/domain/usecases/get_load_types_usecase.dart';
import 'features/profile/domain/usecases/get_trailer_types_usecase.dart';
import 'features/profile/domain/usecases/get_user_cars_usecase.dart';
import 'features/profile/domain/usecases/get_user_info_usecase.dart';
import 'features/profile/domain/usecases/put_user_info/put_user_info_usecase.dart';
import 'features/profile/domain/usecases/reference_book_usecase/reference_book_usecase.dart';
import 'features/profile/domain/usecases/sale_cars/cars_sale_search_usecase.dart';
import 'features/profile/domain/usecases/sale_cars/recommendation_cars_uscase.dart';
import 'features/profile/domain/usecases/update_car_usecase.dart';
import 'features/profile/presentation/bloc/annnouncemant/announcement_bloc.dart';
import 'features/profile/presentation/bloc/complain/complain_bloc.dart';
import 'features/profile/presentation/bloc/create_announcement/create_announcement_bloc.dart';
import 'features/profile/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import 'features/profile/presentation/bloc/favourite_cargo/favourite_cargo_bloc.dart';
import 'features/profile/presentation/bloc/my_cars/edit_car/edit_car_bloc.dart';
import 'features/profile/presentation/bloc/my_cars/my_cars_bloc.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'features/profile/presentation/bloc/reference_book/reference_book_bloc.dart';
import 'features/profile/presentation/bloc/sale_car/sale_car_bloc.dart';
import 'features/profile/presentation/bloc/update_active_announcement/update_active_announcement_bloc.dart';
import 'features/profile/presentation/bloc/update_archive_announcement/update_archive_announcement_bloc.dart';
import 'router/app_routes.dart';
import 'services/location_service.dart';

final sl = GetIt.instance;
late Box<dynamic> _box;

Future<void> init() async {
  /// External
  await initHive();

  /// Core
  sl
    ..registerSingleton<LocalSource>(LocalSource(_box))
    ..registerSingletonAsync(() async {
      final locationService = LocationServiceImpl();
      await locationService.hasPermission();
      return locationService;
    })
    ..registerLazySingleton(
      () => InternetConnectionChecker.createInstance(
        checkInterval: const Duration(seconds: 3),
      ),
    )
    ..registerSingletonAsync<PackageInfo>(PackageInfo.fromPlatform)
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// Dio
  sl.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        contentType: 'application/json',
        sendTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      )
      ..interceptors.addAll(
        [
          LogInterceptor(
            request: kDebugMode,
            requestHeader: kDebugMode,
            requestBody: kDebugMode,
            responseHeader: kDebugMode,
            responseBody: kDebugMode,
            error: kDebugMode,
            logPrint: (object) {
              if (kDebugMode) {
                log('dio: $object');
              }
            },
          ),
          if (localSource.hasChuck) chuck.getDioInterceptor(),
        ],
      ),
  );

  sl<Dio>().interceptors.addAll(
    [
      RetryInterceptor(
        dio: sl<Dio>(),
        toNoInternetPageNavigator: () async => rootNavigatorKey.currentContext!.pushNamed(
          Routes.noInternet,
        ),
        accessTokenGetter: () => localSource.accessToken,
        refreshTokenFunction: () async {
          await localSource.clear().then(
            (value) {
              rootNavigatorKey.currentContext!.goNamed(Routes.initial);
            },
          );
        },
        logPrint: (message) {
          if (kDebugMode) {
            log('dio: $message');
          }
        },
      ),
    ],
  );

  /// features
  mainFeature();
  authFeature();
  onBoardingFeature();

  /// Home page features
  homeFeature();
  newsFeature();
  searchedCargoItemsFeature();
  cargoDetailsFeature();
  oppositeOfferFeature();
  routeFeature();
  notificationFeature();

  /// Orders page features
  ordersFeature();

  /// Profile page features
  profileFeature();
  editProfileFeature();
  myCarsFeature();
  saleCarsFeature();
  announcementFeature();
  favouriteCargoFeature();
  referenceBookFeature();
  complaintFeature();
}

void mainFeature() {
  sl
    ..registerFactory(
      () => MainBloc(
        // putTrackingUseCase: sl(),
        getOrdersUseCase: sl(),
        mainRemoteDataSource: sl(),
      ),
    )

    ///Repositories
    ..registerLazySingleton<MainRepository>(
      () => MainRepositoryImpl(
        mainRemoteDataSource: sl(),
        networkInfo: sl(),
      ),
    )

    /// Data and Network
    ..registerLazySingleton<MainRemoteDataSource>(
      () => MainRemoteDataSourceImpl(sl()),
    );
}

void authFeature() {
  /// use cases
  sl
    ..registerFactory(
      () => LoginBloc(
        loginUseCase: sl(),
        getClientTypeIdUseCase: sl(),
        putFcmTokenUseCase: sl(),
        registerWithSocialUseCase: sl(),
      ),
    )
    ..registerFactory(
      () => ConfirmationUserBloc(
        getTrailerTypeUsecase: sl(),
        sendCodeUseCase: sl(),
        verifyOtpUseCase: sl(),
        getCompaniesUseCase: sl(),
        registerDriverUseCase: sl(),
        registerOperatorUseCase: sl(),
        checkUserUseCase: sl(),
        registerWithSocialUseCase: sl(),
      ),
    )
    ..registerFactory(
      () => ForgotPasswordBloc(
        sendCodeUseCase: sl(),
        verifyOtpUseCase: sl(),
        updateUserPasswordUseCase: sl(),
      ),
    )
    ..registerFactory(
      () => UserAgreementBloc(
        fetchUserAgreementUseCase: sl(),
      ),
    )

    /// Use cases
    ..registerLazySingleton(() => GetCompaniesUseCase(sl()))
    ..registerLazySingleton(() => GetClientTypeIdUseCase(sl()))
    ..registerLazySingleton(() => LoginUseCase(sl()))
    ..registerLazySingleton(() => GetTrailerTypeUsecase(sl()))
    ..registerLazySingleton(() => PutFcmTokenUseCase(sl()))
    ..registerLazySingleton(() => RegisterDriverUseCase(sl()))
    ..registerLazySingleton(() => RegisterOperatorUseCase(sl()))
    ..registerLazySingleton(() => SendCodeUseCase(sl()))
    ..registerLazySingleton(() => CheckUserUseCase(sl()))
    ..registerLazySingleton(() => RegisterWithSocialUseCase(sl()))
    ..registerLazySingleton(() => VerifyOtpUseCase(sl()))
    ..registerLazySingleton(() => UpdateUserPasswordUseCase(sl()))
    ..registerLazySingleton(() => FetchUserAgreementUseCase(sl()))

    /// repositories
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        networkInfo: sl(),
        authLocalDataSource: sl(),
        authRemoteDataSource: sl(),
      ),
    )

    /// data and network
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(_box),
    );
}

void onBoardingFeature() {
  sl.registerFactory(OnBoardingBloc.new);
}

/// Home page features

void homeFeature() {
  /// use cases
  sl.registerFactory(
    () => HomeBloc(
      putFavouriteCargoUseCase: sl(),
      getAllNewsUseCase: sl(),
      getAddressesUseCase: sl(),
      getAllCargosUseCase: sl(),
      fetchTypeCargoUseCase: sl(),
      fetchTypePaymentUseCase: sl(),
      fetchCargoFromFilterUseCase: sl(),
      getAllCargosWithoutFilterUseCase: sl(),
      getUserCarsUseCase: sl(),
    ),
  );

  sl
    ..registerLazySingleton(() => GetAllNewsUseCase(sl()))
    ..registerLazySingleton(() => GetAddressesUseCase(sl()))
    ..registerLazySingleton(() => GetAllCargosUseCase(sl()))
    ..registerLazySingleton(() => GetAllCargosWithoutFilterUseCase(sl()))

    /// repositories
    ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        networkInfo: sl(),
        homeLocalDataSource: sl(),
        homeRemoteDataSource: sl(),
      ),
    )

    /// data and network
    ..registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(_box),
    );
}

void routeFeature() {
  sl
    ..registerFactory(
      () => AddRouteBloc(
        getAddressesUseCase: sl(),
        createRouteRequestUseCase: sl(),
        getVehicleTypesUseCase: sl(),
      ),
    )
    ..registerFactory(
      () => RoutesBloc(
        fetchRoutesUseCase: sl(),
        deleteRouteUseCase: sl(),
      ),
    )
    ..registerFactory(
      () => UpdateRouteBloc(
        getAddressesUseCase: sl(),
        updateRouteUseCase: sl(),
        getVehicleTypesUseCase: sl(),
      ),
    )

    /// Use cases
    ..registerLazySingleton(() => CreateRouteUseCase(sl()))
    ..registerLazySingleton(() => FetchRoutesUseCase(sl()))
    ..registerLazySingleton(() => DeleteRouteUseCase(sl()))
    ..registerLazySingleton(() => UpdateRouteUseCase(sl()));
}

void notificationFeature() {
  sl
    ..registerFactory(
      () => NotificationBloc(
        fetchNotificationUseCase: sl(),
      ),
    )
    ..registerFactory(
      () => DetailNotificationBloc(
        putNotificationUseCase: sl(),
      ),
    )
    ..registerFactory(
      () => OrderForNotificationBloc(
        getOrderByNotificationUseCase: sl(),
        getAddressesUseCase: sl(),
        fetchAddressesPositionsUseCase: sl(),
        putOrderUseCase: sl(),
      ),
    )

    /// Use cases
    ..registerLazySingleton(() => FetchNotificationUseCase(sl()))
    ..registerLazySingleton(() => GetOrderByNotificationUseCase(sl()))
    ..registerLazySingleton(() => GetAddressesByNotificationUseCase(sl()))
    ..registerLazySingleton(
      () => FetchAddressesPositionsByNotificationUseCase(sl()),
    )
    ..registerLazySingleton(() => PutOrderByNotificationUseCase(sl()))
    ..registerLazySingleton(() => PutNotificationUseCase(sl()));
}

void newsFeature() {
  sl.registerFactory(() => NewsBloc(getAllNewsUseCase: sl()));
}

void searchedCargoItemsFeature() {
  sl
    ..registerFactory(
      () => SearchedCargosBloc(
        getSearchedCargoItemsUseCase: sl(),
        putFavouriteCargoUseCase: sl(),
        fetchTypeCargoUseCase: sl(),
        fetchTypePaymentUseCase: sl(),
        fetchCargoFromFilterUseCase: sl(),
      ),
    )
    ..registerLazySingleton(() => GetSearchedCargoItemsUseCase(sl()))
    ..registerLazySingleton(() => FetchTypePaymentUseCase(sl()))
    ..registerLazySingleton(() => FetchTypeCargoUseCase(sl()))
    ..registerLazySingleton(() => FetchCargoFromFilterUseCase(sl()))
    ..registerLazySingleton(() => PutFavouriteCargoHomeUseCase(sl()));
}

void cargoDetailsFeature() {
  sl.registerFactory(
    () => CargoDetailsBloc(
      getCargoDetailsUseCase: sl(),
      getAddressesUseCase: sl(),
      getOrdersUseCase: sl(),
      fetchAddressesPositionsByCargoUseCase: sl(),
    ),
  );

  sl
    ..registerLazySingleton(() => GetCargoDetailsUseCase(sl()))
    ..registerLazySingleton(() => FetchAddressesPositionsByCargoUseCase(sl()))
    ..registerLazySingleton(() => GetCargoAddressesPointUseCase(sl()));
}

void oppositeOfferFeature() {
  sl
    ..registerFactory(
      () => OppositeOfferBloc(
        getVehicleTypesUseCase: sl(),
        putOppositeOfferUseCase: sl(),
        postOppositeOfferUseCase: sl(),
        fetchCurrencyUseCase: sl(),
        mainRemoteDataSource: sl(),
      ),
    )

    /// Use cases
    ..registerLazySingleton(() => GetVehicleTypesUseCase(sl()))
    ..registerLazySingleton(() => PutOppositeOfferUseCase(sl()))
    ..registerLazySingleton(() => FetchCurrencyUseCase(sl()))
    ..registerLazySingleton(() => PostOppositeOfferUseCase(sl()));
}

/// Orders page features

void ordersFeature() {
  /// use cases
  sl.registerFactory(
    () => OrdersBloc(
      getOrdersUseCase: sl(),
      putOrderUseCase: sl(),
      putOrderStatusesUseCase: sl(),
      postRatingReviewsUseCase: sl(),
      putNewOrderStatusesUseCase: sl(),
      ordersRemoteDataSource: sl(),
    ),
  );

  /// repositories
  sl
    ..registerLazySingleton<OrdersRepository>(
      () => OrdersRepositoryImpl(
        networkInfo: sl(),
        ordersLocalDataSource: sl(),
        ordersRemoteDataSource: sl(),
      ),
    )
    ..registerFactory(
      () => OrderDetailsBloc(
        getOrderDetailsUseCase: sl(),
        putOrderStatusesUseCase: sl(),
        postRatingReviewsUseCase: sl(),
        getAddressesUseCase: sl(),
        fetchAddressesPositionsUseCase: sl(),
      ),
    )

    /// data and network
    ..registerLazySingleton(() => GetOrdersUseCase(sl()))
    ..registerLazySingleton(() => PutOrderUseCase(sl()))
    ..registerLazySingleton(() => PutNewOrderStatusesUseCase(sl()))
    ..registerLazySingleton(() => GetOrderDetailsUseCase(sl()))
    ..registerLazySingleton(() => PutOrderStatusesUseCase(sl()))
    ..registerLazySingleton(() => GetAddressesDetailUseCase(sl()))
    ..registerLazySingleton(() => FetchAddressesPositionsUseCase(sl()))
    ..registerLazySingleton(() => PostRatingReviewsUseCase(sl()))
    ..registerLazySingleton<OrdersRemoteDataSource>(
      () => OrdersRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton<OrdersLocalDataSource>(
      () => OrdersLocalDataSourceImpl(_box),
    );
}

/// Profile page features
void profileFeature() {
  sl.registerFactory(
    () => ProfileBloc(
      getUserInfoUseCase: sl(),
      deleteUserUseCase: sl(),
    ),
  );

  /// use cases
  sl.registerLazySingleton(() => GetUserInfoUseCase(sl()));
  sl.registerLazySingleton(() => DeleteUserUseCase(sl()));

  /// repositories
  sl
    ..registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(
        networkInfo: sl(),
        profileLocalDataSource: sl(),
        profileRemoteDataSource: sl(),
      ),
    )

    /// data and network
    ..registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton<ProfileLocalDataSource>(
      () => ProfileLocalDataSourceImpl(_box),
    );
}

void editProfileFeature() {
  sl
    ..registerFactory(
      () => EditProfileBloc(
        putUserInfoUseCase: sl(),
      ),
    )

    /// Use cases
    ..registerLazySingleton(() => PutUserInfoUseCase(sl()));
}

void myCarsFeature() {
  sl
    ..registerFactory(() => MyCarsBloc(getUserCarsUseCase: sl()))
    ..registerFactory(
      () => AddCarBloc(
        getCargoTypesUseCase: sl(),
        getTrailerTypesUseCase: sl(),
        getLoadTypesUseCase: sl(),
        addCarUseCase: sl(),
        getFuelTypesUseCase: sl(),
        checkVehicleNumberUseCase: sl(),
      ),
    )
    ..registerFactory(
      () => EditCarBloc(
        getCargoTypesUseCase: sl(),
        getTrailerTypesUseCase: sl(),
        getLoadTypesUseCase: sl(),
        updateCarUseCase: sl(),
        deleteCarUseCase: sl(),
      ),
    )
    ..registerLazySingleton(() => GetCargoTypesUseCase(sl()))
    ..registerLazySingleton(() => GetTrailerTypesProfileUseCase(sl()))
    ..registerLazySingleton(() => GetLoadTypesUseCase(sl()))
    ..registerLazySingleton(() => CheckVehicleNumberUseCase(sl()))
    ..registerLazySingleton(() => GetUserCarsUseCase(sl()))
    ..registerLazySingleton(() => UpdateCarUseCase(sl()))
    ..registerLazySingleton(() => DeleteCarUseCase(sl()))
    ..registerLazySingleton(() => CreateCarUseCase(sl()))
    ..registerLazySingleton(() => GetFuelTypesUseCase(sl()));
}

void saleCarsFeature() {
  sl.registerFactory(
    () => SaleCarBloc(
      getRecommendationCarsUseCase: sl(),
      getCarsSaleSearchUseCase: sl(),
    ),
  );

  sl
    ..registerLazySingleton(() => GetRecommendationCarsUseCase(sl()))
    ..registerLazySingleton(() => GetCarsSaleSearchUseCase(sl()));
}

void announcementFeature() {
  sl
    ..registerFactory(
      () => CreateAnnouncementBloc(
        getCarTypesUseCase: sl(),
        getAddressesSaleCarUseCase: sl(),
        getCurrencyTypesUseCase: sl(),
        createAnnouncementUseCase: sl(),
      ),
    )
    ..registerFactory(
      () => AnnouncementBloc(
        getActiveAnnouncementUseCase: sl(),
        getInActiveAnnouncementUseCase: sl(),
      ),
    )
    ..registerFactory(
      () => UpdateArchiveAnnouncementBloc(
        getCarTypesUseCase: sl(),
        getAddressesSaleCarUseCase: sl(),
        getCurrencyTypesUseCase: sl(),
        updateAnnouncementUseCase: sl(),
      ),
    )
    ..registerFactory(
      () => UpdateActiveAnnouncementBloc(
        getCarTypesUseCase: sl(),
        getAddressesSaleCarUseCase: sl(),
        getCurrencyTypesUseCase: sl(),
        updateAnnouncementUseCase: sl(),
      ),
    );

  sl
    ..registerLazySingleton(() => GetCarTypesUseCase(sl()))
    ..registerLazySingleton(() => GetAddressesSaleCarUseCase(sl()))
    ..registerLazySingleton(() => GetCurrencyTypesUseCase(sl()))
    ..registerLazySingleton(() => CreateAnnouncementUseCase(sl()))
    ..registerLazySingleton(() => GetActiveAnnouncementUseCase(sl()))
    ..registerLazySingleton(() => GetInActiveAnnouncementUseCase(sl()))
    ..registerLazySingleton(() => UpdateAnnouncementUseCase(sl()));
}

void favouriteCargoFeature() {
  sl
    ..registerFactory(
      () => FavouriteCargoBloc(
        fetchFavouriteCargoUseCase: sl(),
        putFavouriteCargoUseCase: sl(),
      ),
    )

    /// Use cases
    ..registerLazySingleton(() => FetchFavouriteCargoUseCase(sl()))
    ..registerLazySingleton(() => PutFavouriteCargoUseCase(sl()));
}

void referenceBookFeature() {
  sl
    ..registerFactory(
      () => ReferenceBookBloc(
        fetchReferenceBookUseCase: sl(),
      ),
    )

    /// Use cases
    ..registerLazySingleton(() => FetchReferenceBookUseCase(sl()));
}

void complaintFeature() {
  sl
    ..registerFactory(
      () => ComplainBloc(
        createComplainUseCase: sl(),
      ),
    )
    ..registerLazySingleton(() => CreateComplainUseCase(sl()));
}

Future<void> initHive() async {
  const boxName = 'sarbon_mobile_box';
  final Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  _box = await Hive.openBox<dynamic>(boxName);
}
