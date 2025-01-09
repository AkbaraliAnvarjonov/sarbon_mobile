import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../constants/constants.dart';
import '../core/local_source/local_source.dart';
import '../core/platform/network_info.dart';
import '../features/auth/presentation/bloc/confirmation_user/confirmation_user_bloc.dart';
import '../features/auth/presentation/bloc/forgot_password/forgot_password_bloc.dart';
import '../features/auth/presentation/bloc/login/login_bloc.dart';
import '../features/auth/presentation/bloc/user_agreement/user_agreement_bloc.dart';
import '../features/auth/presentation/pages/login/cargo_detail/cargo_detail_page.dart';
import '../features/auth/presentation/pages/login/login_page.dart';
import '../features/auth/presentation/pages/login/sub_pages/forgot_password/forgot_password_page.dart';
import '../features/auth/presentation/pages/register/register_page.dart';
import '../features/auth/presentation/pages/register/sub_pages/user_agreement/user_agreement.dart';
import '../features/home/domain/entities/notification/notification_response_entity.dart';
import '../features/home/domain/entities/routes/fetch_routes_entity.dart';
import '../features/home/domain/entities/search/get_searched_cargo_items_request_entity.dart';
import '../features/home/presentation/args/news_page_arguments.dart';
import '../features/home/presentation/bloc/cargo_details/cargo_details_bloc.dart';
import '../features/home/presentation/bloc/home_bloc.dart';
import '../features/home/presentation/bloc/news/news_bloc.dart';
import '../features/home/presentation/bloc/notification/detail_notification/detail_notification_bloc.dart';
import '../features/home/presentation/bloc/notification/notification_bloc.dart';
import '../features/home/presentation/bloc/notification/order_from_notification/order_for_notification_bloc.dart';
import '../features/home/presentation/bloc/opposite_offer/opposite_offer_bloc.dart';
import '../features/home/presentation/bloc/route/add_route/add_route_bloc.dart';
import '../features/home/presentation/bloc/route/routes_bloc.dart';
import '../features/home/presentation/bloc/route/update_route/update_route_bloc.dart';
import '../features/home/presentation/bloc/searched_cargos/searched_cargos_bloc.dart';
import '../features/home/presentation/pages/cargo_detail/cargo_detail_page.dart';
import '../features/home/presentation/pages/news/news_page.dart';
import '../features/home/presentation/pages/notification/notification_page.dart';
import '../features/home/presentation/pages/notification/sub_pages/notification_detail/notification_detail_page.dart';
import '../features/home/presentation/pages/notification/sub_pages/order_by_notification/order_by_notification_page.dart';
import '../features/home/presentation/pages/opposite_offer_for_cargo/opposite_offer_page.dart';
import '../features/home/presentation/pages/opposite_offer_for_cargo/page_arguments/page_arguments.dart';
import '../features/home/presentation/pages/route/route_page.dart';
import '../features/home/presentation/pages/route/sub_pages/add_route/add_route_page.dart';
import '../features/home/presentation/pages/route/sub_pages/update_route/update_route_page.dart';
import '../features/home/presentation/pages/searched_cargo_result/searched_cargo_result_page.dart';
import '../features/main/presentation/pages/main_page.dart';
import '../features/orders/presentation/bloc/order_detail/order_details_bloc.dart';
import '../features/orders/presentation/pages/args/order_detail_page_argument.dart';
import '../features/orders/presentation/pages/order_detail/order_detail_page.dart';
import '../features/others/presentation/bloc/onboarding_bloc.dart';
import '../features/others/presentation/pages/internet_connection/internet_connection_page.dart';
import '../features/others/presentation/pages/onboarding/onboarding_page.dart';
import '../features/others/presentation/pages/splash/splash_page.dart';
import '../features/profile/domain/entities/announcement/get_active_inactive_announcement/get_active_inactive_announcement_entity.dart';
import '../features/profile/presentation/bloc/annnouncemant/announcement_bloc.dart';
import '../features/profile/presentation/bloc/calculator/calculator_bloc.dart';
import '../features/profile/presentation/bloc/complain/complain_bloc.dart';
import '../features/profile/presentation/bloc/create_announcement/create_announcement_bloc.dart';
import '../features/profile/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import '../features/profile/presentation/bloc/favourite_cargo/favourite_cargo_bloc.dart';
import '../features/profile/presentation/bloc/my_cars/add_car/add_car_bloc.dart';
import '../features/profile/presentation/bloc/my_cars/edit_car/edit_car_bloc.dart';
import '../features/profile/presentation/bloc/my_cars/my_cars_bloc.dart';
import '../features/profile/presentation/bloc/profile_bloc.dart';
import '../features/profile/presentation/bloc/reference_book/reference_book_bloc.dart';
import '../features/profile/presentation/bloc/sale_car/sale_car_bloc.dart';
import '../features/profile/presentation/bloc/update_active_announcement/update_active_announcement_bloc.dart';
import '../features/profile/presentation/bloc/update_archive_announcement/update_archive_announcement_bloc.dart';
import '../features/profile/presentation/pages/calculator/calculator_page.dart';
import '../features/profile/presentation/pages/calculator/page_args/calculate_route_page_arguments.dart';
import '../features/profile/presentation/pages/calculator/page_args/map_page_arguments.dart';
import '../features/profile/presentation/pages/calculator/sub_pages/calculate_route_page.dart';
import '../features/profile/presentation/pages/calculator/sub_pages/map_page.dart';
import '../features/profile/presentation/pages/complain/complain_page.dart';
import '../features/profile/presentation/pages/edit_profile/edit_profile_page.dart';
import '../features/profile/presentation/pages/favourite/favourite_page.dart';
import '../features/profile/presentation/pages/my_cars/add_car/add_car_page.dart';
import '../features/profile/presentation/pages/my_cars/edit_car/edit_car_page.dart';
import '../features/profile/presentation/pages/my_cars/my_cars_page.dart';
import '../features/profile/presentation/pages/pages_arguments/edit_page_args.dart';
import '../features/profile/presentation/pages/pages_arguments/sale_cars_detail_page_argument.dart';
import '../features/profile/presentation/pages/reference_book/reference_book_page.dart';
import '../features/profile/presentation/pages/sale_cars/sale_cars_page.dart';
import '../features/profile/presentation/pages/sale_cars/sale_cars_sub_pages/my_announcement/announcement_tab_pages/sub_pages/create_new_announcement_page.dart';
import '../features/profile/presentation/pages/sale_cars/sale_cars_sub_pages/my_announcement/announcement_tab_pages/sub_pages/update_active_announcement_page.dart';
import '../features/profile/presentation/pages/sale_cars/sale_cars_sub_pages/my_announcement/announcement_tab_pages/sub_pages/update_archive_announcement_page.dart';
import '../features/profile/presentation/pages/sale_cars/sale_cars_sub_pages/my_announcement/my_announcement_page.dart';
import '../features/profile/presentation/pages/sale_cars/sale_cars_sub_pages/search_car/ca_for_sale_detail_page.dart';
import '../features/profile/presentation/pages/sale_cars/sale_cars_sub_pages/search_car/search_car_page.dart';
import '../injector_container.dart';
import '../services/location_service.dart';

part 'name_routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final packageInfo = sl<PackageInfo>();
final networkInfo = sl<NetworkInfo>();
final localSource = sl<LocalSource>();
final location = sl<LocationService>();

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
late StatefulNavigationShell shellRootNavigator;

final Chuck chuck = Chuck(navigatorKey: rootNavigatorKey);

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.initial,
  // errorBuilder: (context, state) => BlocProvider(
  //   create: (context) => sl<LoginBloc>(),
  //   child: const LoginPage(),
  // ),
  // errorPageBuilder: (context, state) => const Page(name: Routes.noInternet),
  redirect: (context, state) {
    final hasProfile = localSource.hasProfile;
    final hasUrl = state.uri.toString().contains(Routes.cargoDetailDeepLink);
    // final isDeepLink = state.uri.toString().contains(Constants.deepBaseLink);


    /// deeplink logic
    // if (isDeepLink) {
    //   if (state.uri.pathSegments.isNotEmpty) {
    //     if (!hasProfile) {
    //       return '${Routes.login}${!hasUrl ? "" : '/${Routes.cargoDetailsForUnregisterUserpLink}${state.uri.pathSegments.last}'}';
    //     }
    //     if (hasProfile) {
    //       return '${Routes.main}${!hasUrl ? "" : '/${Routes.cargoDetailDeepLink}${state.uri.pathSegments.last}'}';
    //     }
    //   }
    // }
    return null;
  },
  routes: <RouteBase>[
    GoRoute(
      path: Routes.initial,
      name: Routes.initial,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const SplashPage(),
    ),
    GoRoute(
      path: Routes.noInternet,
      name: Routes.noInternet,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const InternetConnectionPage(),
    ),
    GoRoute(
      path: Routes.onBoarding,
      name: Routes.onBoarding,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider(
        create: (context) => sl<OnBoardingBloc>(),
        child: const OnBoardingPage(),
      ),
    ),
    GoRoute(
      path: Routes.login,
      name: Routes.login,
      routes: [
        GoRoute(
          path: Routes.cargoDetailsForUnregisterUser,
          name: Routes.cargoDetailsForUnregisterUser,
          parentNavigatorKey: rootNavigatorKey,
          builder: (_, state) {
            final String? id = state.pathParameters['id'];
            return BlocProvider(
              create: (context) => sl<CargoDetailsBloc>(),
              child: CargoDetailForUnregisterUserPage(
                cargoId: id ?? '',
              ),
            );
          },
        ),
      ],
      // parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider(
        create: (context) => sl<LoginBloc>(),
        child: const LoginPage(),
      ),
    ),
    GoRoute(
      path: Routes.forgotPassword,
      name: Routes.forgotPassword,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider(
        create: (context) => sl<ForgotPasswordBloc>(),
        child: const ForgotPasswordPage(),
      ),
    ),
    GoRoute(
      path: Routes.register,
      name: Routes.register,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider(
        create: (context) => sl<ConfirmationUserBloc>(),
        child: const RegisterPage(),
      ),
    ),
    GoRoute(
      path: Routes.userAgreement,
      name: Routes.userAgreement,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider(
        create: (context) => sl<UserAgreementBloc>()
          ..add(
            const FetchUserAgreementEvent(),
          ),
        child: const UserAgreementPage(),
      ),
    ),

    GoRoute(
      name: Routes.main,
      path: Routes.main,
      routes: [
        GoRoute(
          path: Routes.cargoDetailDeep,
          name: Routes.cargoDetailDeep,
          parentNavigatorKey: rootNavigatorKey,
          builder: (_, state) {
            final String? id = state.pathParameters['id'];
            return BlocProvider(
              create: (context) => sl<CargoDetailsBloc>(),
              child: CargoDetailPage(
                cargoId: id ?? '',
              ),
            );
          },
        ),
      ],
      pageBuilder: (_, state) => CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 1200),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(
              create: (_) => sl<HomeBloc>(),
            ),
            BlocProvider<ProfileBloc>(
              create: (_) => sl<ProfileBloc>(),
            ),
          ],
          child: const MainPage(),
        ),
        transitionsBuilder: (_, animation, __, child) => FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: Routes.news,
      name: Routes.news,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, state) => BlocProvider(
        create: (context) => sl<NewsBloc>(),
        child: NewsPage(
          args: (state.extra != null && (state.extra is NewsPageArguments))
              ? state.extra! as NewsPageArguments
              : const NewsPageArguments(),
        ),
      ),
    ),
    GoRoute(
      path: Routes.searchedCargoResult,
      name: Routes.searchedCargoResult,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, state) => BlocProvider(
        create: (context) => sl<SearchedCargosBloc>(),
        child: SearchedCargoResultsPage(
          requestEntity: (state.extra != null && (state.extra is GetSearchedCargoItemsRequestEntity))
              ? state.extra! as GetSearchedCargoItemsRequestEntity
              : const GetSearchedCargoItemsRequestEntity(),
        ),
      ),
    ),
    GoRoute(
      path: Routes.cargoDetails,
      name: Routes.cargoDetails,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, state) => BlocProvider(
        create: (context) => sl<CargoDetailsBloc>(),
        child: CargoDetailPage(
          cargoId: ((state.extra != null) && (state.extra is String)) ? state.extra! as String : '',
        ),
      ),
    ),
    GoRoute(
      path: Routes.oppositeOffer,
      name: Routes.oppositeOffer,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, state) => BlocProvider(
        create: (context) => sl<OppositeOfferBloc>(),
        child: OppositeOfferPage(
          oppositeOfferArgs: state.extra! as OppositeOfferPageArguments,
        ),
      ),
    ),
    GoRoute(
      path: Routes.editProfile,
      name: Routes.editProfile,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider(
        create: (context) => sl<EditProfileBloc>(),
        child: const EditProfilePage(),
      ),
    ),
    GoRoute(
      path: Routes.myCars,
      name: Routes.myCars,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider(
        create: (context) => sl<MyCarsBloc>(),
        child: const MyCarsPage(),
      ),
    ),
    GoRoute(
      path: Routes.addCar,
      name: Routes.addCar,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider(
        create: (context) => sl<AddCarBloc>(),
        child: const AddCarPage(),
      ),
    ),
    GoRoute(
      path: Routes.editCar,
      name: Routes.editCar,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, args) => BlocProvider(
        create: (context) => sl<EditCarBloc>(),
        child: EditCarPage(
          arguments: args.extra! as EditCarPageArguments,
        ),
      ),
    ),

    GoRoute(
      path: Routes.carSale,
      name: Routes.carSale,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const SaleCarsPage(),
    ),
    GoRoute(
      path: Routes.searchSaleCars,
      name: Routes.searchSaleCars,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider(
        create: (context) => sl<SaleCarBloc>(),
        child: const SearchSaleCarPage(),
      ),
    ),
    GoRoute(
      path: Routes.myAnnouncement,
      name: Routes.myAnnouncement,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider(
        create: (context) => sl<AnnouncementBloc>()
          ..add(
            const GetActiveAnnouncementEvent(),
          )
          ..add(
            const GetInActiveAnnouncementEvent(),
          ),
        child: const MyAnnouncementPage(),
      ),
    ),
    GoRoute(
      path: Routes.carSaleDetails,
      name: Routes.carSaleDetails,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, state) => CarForSaleDetailPage(
        saleCarDetail: state.extra! as SaleCarsDetailPageArguments,
      ),
    ),
    GoRoute(
      path: Routes.createNewAnnouncement,
      name: Routes.createNewAnnouncement,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, state) => BlocProvider(
        create: (context) => sl<CreateAnnouncementBloc>()..add(const GetInformationEvent()),
        child: const CreateNewAnnouncementPage(),
      ),
    ),
    GoRoute(
      path: Routes.updateActiveAnnouncement,
      name: Routes.updateActiveAnnouncement,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, args) => BlocProvider(
        create: (context) => sl<UpdateActiveAnnouncementBloc>()
          ..add(
            const GetInformationUpdateActiveEvent(),
          ),
        child: UpdateActiveAnnouncementPage(
          announcement: args.extra! as GetActiveInActiveAnnouncementListEntity,
        ),
      ),
    ),
    GoRoute(
      path: Routes.updateArchiveAnnouncement,
      name: Routes.updateArchiveAnnouncement,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, args) => BlocProvider(
        create: (context) => sl<UpdateArchiveAnnouncementBloc>()
          ..add(
            const GetInformationUpdateArchiveEvent(),
          ),
        child: UpdateArchiveAnnouncementPage(
          announcement: args.extra! as GetActiveInActiveAnnouncementListEntity,
        ),
      ),
    ),
    GoRoute(
      path: Routes.route,
      name: Routes.route,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider(
        create: (_) => sl<RoutesBloc>()..add(const FetchRoutesEvent()),
        child: const RoutePage(),
      ),
    ),
    GoRoute(
      path: Routes.addRoute,
      name: Routes.addRoute,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, args) => BlocProvider(
        create: (context) => sl<AddRouteBloc>()..add(const FetchAddressesEvent()),
        child: const AddRoutePage(),
      ),
    ),
    GoRoute(
      path: Routes.updateRoute,
      name: Routes.updateRoute,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, args) => BlocProvider(
        create: (context) => sl<UpdateRouteBloc>()
          ..add(
            const FetchAddressesForUpdateRouteEvent(),
          ),
        child: UpdateRoutePage(
          route: args.extra! as RouteEntity,
        ),
      ),
    ),
    GoRoute(
      path: Routes.notification,
      name: Routes.notification,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider(
        create: (context) => sl<NotificationBloc>()
          ..add(
            const FetchNotificationEvent(),
          ),
        child: const NotificationPage(),
      ),
    ),
    GoRoute(
      path: Routes.notificationDetails,
      name: Routes.notificationDetails,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, args) => BlocProvider(
        create: (context) => sl<DetailNotificationBloc>()
          ..add(
            PutSingleNotificationEvent(
              guid: (args.extra! as NotificationEntity).id,
            ),
          ),
        child: NotificationDetailPage(
          notification: args.extra! as NotificationEntity,
        ),
      ),
    ),
    GoRoute(
      path: Routes.orderByNotification,
      name: Routes.orderByNotification,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, args) => BlocProvider(
        create: (context) => sl<OrderForNotificationBloc>()
          ..add(
            GetOrderDetailsByNotificationEvent(
              guid: args.extra! as String,
            ),
          ),
        child: OrderByNotificationPage(
          orderId: args.extra! as String,
        ),
      ),
    ),

    GoRoute(
      path: Routes.calculator,
      name: Routes.calculator,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider(
        create: (context) => CalculatorBloc(),
        child: const CalculatorPage(),
      ),
    ),
    GoRoute(
      path: Routes.mapForCalculator,
      name: Routes.mapForCalculator,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, args) => MapForCalculatorPage(
        arguments: args.extra! as MapPageArguments,
      ),
    ),
    GoRoute(
      path: Routes.calculateRoute,
      name: Routes.calculateRoute,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, args) => CalculateRoutePage(
        arguments: args.extra! as CalculateRoutePageArguments,
      ),
    ),
    GoRoute(
      path: Routes.referenceBook,
      name: Routes.referenceBook,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, args) => BlocProvider(
        create: (context) => sl<ReferenceBookBloc>()
          ..add(
            const FetchReferenceBookEvent(),
          ),
        child: const ReferenceBookPage(),
      ),
    ),
    GoRoute(
      path: Routes.complain,
      name: Routes.complain,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, args) => BlocProvider(
        create: (context) => sl<ComplainBloc>(),
        child: const ComplainPage(),
      ),
    ),
    GoRoute(
      path: Routes.favourites,
      name: Routes.favourites,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, args) => BlocProvider(
        create: (context) => sl<FavouriteCargoBloc>()
          ..add(
            const FetchFavouriteCargoEvent(),
          ),
        child: const FavouritePage(),
      ),
    ),

    /// Orders bottom menu item pages
    GoRoute(
      path: Routes.orderDetails,
      name: Routes.orderDetails,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, state) => BlocProvider(
        create: (context) => sl<OrderDetailsBloc>(),
        child: OrderDetailPage(
          args: ((state.extra != null) && (state.extra is OrderDetailsPageArgument))
              ? state.extra! as OrderDetailsPageArgument
              : null,
        ),
      ),
    ),
  ],
);
