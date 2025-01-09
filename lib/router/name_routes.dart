part of 'app_routes.dart';

sealed class Routes {
  Routes._();

  static const String initial = '/';

  static const String main = '/main';
  static const String onBoarding = '/boarding';
  static const String login = '/login';
  static const String forgotPassword = '/forgot_password';
  static const String register = '/register';
  static const String userAgreement = '/user_agreement';

  /// Home
  static const String news = '/news';
  static const String searchedCargoResult = '/searched_cargo_result';
  static const String cargoDetails = '/cargo_details';
  static const String cargoDetailsForUnregisterUser = 'cargo_details_un/:id';
  static const String cargoDetailsForUnregisterUserpLink = 'cargo_details_un/';
  static const String cargoDetailDeep = 'cargo_details_deep/:id';
  static const String cargoDetailDeepLink = 'cargo_details_deep/';
  static const String oppositeOffer = '/opposite_offer';
  static const String orderDetails = '/order_details';
  static const String route = '/route';
  static const String addRoute = '/add_route';
  static const String updateRoute = '/update_route';
  static const String notification = '/notification';
  static const String notificationDetails = '/notification_details';
  static const String orderByNotification = '/order_by_notification';

  /// Profile
  static const String editProfile = '/edit_profile';
  static const String myCars = '/my_cars';
  static const String addCar = '/add_car';
  static const String editCar = '/edit_car';
  static const String carSale = '/car_sale';
  static const String carSaleDetails = '/car_sale_details';
  static const String searchSaleCars = '/search_sale_cars';
  static const String myAnnouncement = '/my_announcement';
  static const String createNewAnnouncement = '/create_new_announcement';
  static const String updateActiveAnnouncement = '/update_active_announcement';
  static const String updateArchiveAnnouncement =
      '/update_inactive_announcement';
  static const String calculator = '/calculator';
  static const String mapForCalculator = '/map_for_calculator';
  static const String calculateRoute = '/calculate_route';
  static const String referenceBook = '/reference_book';
  static const String complain = '/complain';
  static const String favourites = '/favourites';

  /// internet connection
  static const String noInternet = '/no-internet';
}
