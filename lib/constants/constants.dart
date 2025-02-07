import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../core/mixins/location_mixin.dart';
import '../features/profile/data/models/eco_standart_type.dart';
import '../router/app_routes.dart';

sealed class Constants {
  Constants._();

  static const Points point = Points(latitude: 41.339153, longitude: 69.21571);

  static const String baseUrl = 'https://api.admin.furgo.uz/';
  static const String authUrl = 'https://api.auth.furgo.uz/v2/';

  static const String deepBaseLink = 'https://links.sarbon.me';
  static const String deepLink = '$deepBaseLink/${Routes.cargoDetailDeepLink}';
  static const String androidAppLink = 'https://play.google.com/store/apps/details?id=uz.udevs.sarbon_mobile';
  static const String iosAppLink = 'https://apps.apple.com/uz/app/furgo/id6475668788';
  static final String appLink = Platform.isIOS ? iosAppLink : androidAppLink;

  static const String apiKey = 'P-LVV522r72r72mHNTNZ1w0FimKLFSCOqT';
  static const String projectId = 'f539f64b-961e-4c6c-8534-140091f7f27b';
  static const String environmentId = '11b59b25-8772-456a-84e1-20bdfdd32506';

  static const String cdnImage = 'https://cdn.u-code.io/ucode/';
  static const String cdnDocs = 'https://test.cdn.iiv.udevs.io/docs/';
  static const String cdnUpm = 'https://cdn.upm.udevs.io/';
  static const String uploadUrl = 'https://api.admin.u-code.io/v1/';

  static const String clientTypeDriverId = 'a1d98b5f-93f1-413a-8515-c99d4f4d6dc5';
  static const String roleDriverId = '921464fa-8308-46b7-9b66-363acf654e40';

  static const String clientTypeOperatorId = '2ae57983-f68f-487a-b76c-c7166c35dbba';
  static const String roleOperatorId = '785678f2-fae7-4a00-8766-99ea67d3784f';
  static const String functionId = 'c104fc61-593d-4857-91e0-20df002303ff';

  static Options requestOptions = Options(
    contentType: 'application/json',
    sendTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {
      'environment-id': '11b59b25-8772-456a-84e1-20bdfdd32506',
      'resource-id': 'e32ba3ac-a552-4e42-a3c9-04e3ac1a4ac3',
    },
  );

  static Options requestOptionsWithoutIds = Options(
    contentType: 'application/json',
    sendTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {
      'authorization': 'API-KEY',
      'X-API-KEY': Constants.apiKey,
    },
  );

  static const ruLan = Locale('ru', 'RU');
  static const uzLan = Locale('uz', 'UZ');
  static const trLan = Locale('tr', 'TR');
  static const enLan = Locale('en', 'EN');
  static const chLan = Locale('zh', 'CN');

  static List<EcoStandartType> ecoStandartTypes = [
    EcoStandartType(name: 'EURO 1', value: 'EURO_1'),
    EcoStandartType(name: 'EURO 2', value: 'EURO_2'),
    EcoStandartType(name: 'EURO 3', value: 'EURO_3'),
    EcoStandartType(name: 'EURO 4', value: 'EURO_4'),
    EcoStandartType(name: 'EURO 5', value: 'EURO_5'),
    EcoStandartType(name: 'EURO 6', value: 'EURO_6'),
  ];

  static final countries = [
    {
      'name': 'Uzbekistan',
      'name_ru': 'Узбекистан',
      'code': 'UZ',
      'vehicle_plate_regex': RegExp(r'^[0-9]{2}[A-Z]{2}[0-9]{3}[A-Z]{1}$'),
    },
    {
      'name': 'Kazakhstan',
      'name_ru': 'Казахстан',
      'code': 'KZ',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{1}\d{3}[A-Z]{2}\d{2,3}$'),
    },
    {
      'name': 'Kyrgyzstan',
      'name_ru': 'Кыргызстан',
      'code': 'KG',
      'vehicle_plate_regex': RegExp(r'^[0-9]{2}\s[\u0410-\u042F]{2}\s[0-9]{4}$'),
    },
    {
      'name': 'Tajikistan',
      'name_ru': 'Таджикистан',
      'code': 'TJ',
      'vehicle_plate_regex': RegExp(r'^[0-9]{2}\s[\u0410-\u042F]{2}\s[0-9]{4}$'),
    },
    {
      'name': 'Turkmenistan',
      'name_ru': 'Туркменистан',
      'code': 'TM',
      'vehicle_plate_regex': RegExp(r'^[0-9]{2}\s[\u0410-\u042F]{2}\s[0-9]{4}$'),
    },
    {
      'name': 'Russia',
      'name_ru': 'Россия',
      'code': 'RU',
      'vehicle_plate_regex': RegExp(
          r'^[\u0410-\u0412\u0415\u041a\u041c\u041d\u041e\u0420\u0421\u0422\u0423\u0425]{1}\d{3}[\u0410-\u0412\u0415\u041a\u041c\u041d\u041e\u0420\u0421\u0422\u0423\u0425]{2}\d{2,3}$'),
    },
    {
      'name': 'Armenia',
      'name_ru': 'Армения',
      'code': 'AM',
      'vehicle_plate_regex': RegExp(r'^[0-9]{2}[A-Z]{2}[0-9]{3}$'),
    },
    {
      'name': 'Azerbaijan',
      'name_ru': 'Азербайджан',
      'code': 'AZ',
      'vehicle_plate_regex': RegExp(r'^[0-9]{2}-[A-Z]{2}-[0-9]{3}$'),
    },
    {
      'name': 'Georgia',
      'name_ru': 'Грузия',
      'code': 'GE',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}\d{3}[A-Z]{2}$'),
    },
    {
      'name': 'Ukraine',
      'name_ru': 'Украина',
      'code': 'UA',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}\d{4}[A-Z]{2}$'),
    },
    {
      'name': 'Belarus',
      'name_ru': 'Беларусь',
      'code': 'BY',
      'vehicle_plate_regex': RegExp(r'^[0-9]{4}\s[\u0410-\u042F]{2}-[0-9]{1}$'),
    },
    {
      'name': 'Moldova',
      'name_ru': 'Молдова',
      'code': 'MD',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{3}\d{3}$'),
    },
    {
      'name': 'Albania',
      'name_ru': 'Албания',
      'code': 'AL',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}\d{4}[A-Z]{1}$'),
    },
    {
      'name': 'Andorra',
      'name_ru': 'Андорра',
      'code': 'AD',
      'vehicle_plate_regex': RegExp(r'^AD\d{4}$'),
    },
    {
      'name': 'Austria',
      'name_ru': 'Австрия',
      'code': 'AT',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{1,3}\d{1,4}[A-Z]{1,2}$'),
    },
    {
      'name': 'Belgium',
      'name_ru': 'Бельгия',
      'code': 'BE',
      'vehicle_plate_regex': RegExp(r'^[1-9]{1}[A-Z]{3}\d{3}$'),
    },
    {
      'name': 'Bosnia and Herzegovina',
      'name_ru': 'Босния и Герцеговина',
      'code': 'BA',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}\d{3}[A-Z]{2}$'),
    },
    {
      'name': 'Bulgaria',
      'name_ru': 'Болгария',
      'code': 'BG',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{1,2}\d{4}[A-Z]{1,2}$'),
    },
    {
      'name': 'Croatia',
      'name_ru': 'Хорватия',
      'code': 'HR',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}\d{3}-\d{2}$'),
    },
    {
      'name': 'Cyprus',
      'name_ru': 'Кипр',
      'code': 'CY',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{3}\d{3}$'),
    },
    {
      'name': 'Czech Republic',
      'name_ru': 'Чехия',
      'code': 'CZ',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}-\d{5}$'),
    },
    {
      'name': 'Denmark',
      'name_ru': 'Дания',
      'code': 'DK',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}\d{5}$'),
    },
    {
      'name': 'Estonia',
      'name_ru': 'Эстония',
      'code': 'EE',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{3}-\d{3}$'),
    },
    {
      'name': 'Finland',
      'name_ru': 'Финляндия',
      'code': 'FI',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{3}-\d{3}$'),
    },
    {
      'name': 'France',
      'name_ru': 'Франция',
      'code': 'FR',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}-\d{3}-[A-Z]{2}$'),
    },
    {
      'name': 'Germany',
      'name_ru': 'Германия',
      'code': 'DE',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{1,3}-[A-Z]{1,2}\d{1,4}$'),
    },
    {
      'name': 'Greece',
      'name_ru': 'Греция',
      'code': 'GR',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{3}-\d{4}$'),
    },
    {
      'name': 'Hungary',
      'name_ru': 'Венгрия',
      'code': 'HU',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{3}-\d{3}$'),
    },
    {
      'name': 'Iceland',
      'name_ru': 'Исландия',
      'code': 'IS',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{1,2}\d{3}$'),
    },
    {
      'name': 'Ireland',
      'name_ru': 'Ирландия',
      'code': 'IE',
      'vehicle_plate_regex': RegExp(r'^\d{2}-[A-Z]{1,2}-\d{1,5}$'),
    },
    {
      'name': 'Italy',
      'name_ru': 'Италия',
      'code': 'IT',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}\d{3}[A-Z]{2}$'),
    },
    {
      'name': 'Latvia',
      'name_ru': 'Латвия',
      'code': 'LV',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}-\d{4}$'),
    },
    {
      'name': 'Liechtenstein',
      'name_ru': 'Лихтенштейн',
      'code': 'LI',
      'vehicle_plate_regex': RegExp(r'^FL-\d{1,5}$'),
    },
    {
      'name': 'Lithuania',
      'name_ru': 'Литва',
      'code': 'LT',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{3}\d{3}$'),
    },
    {
      'name': 'Luxembourg',
      'name_ru': 'Люксембург',
      'code': 'LU',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}-\d{5}$'),
    },
    {
      'name': 'Malta',
      'name_ru': 'Мальта',
      'code': 'MT',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{3}\d{4}$'),
    },
    {
      'name': 'Netherlands',
      'name_ru': 'Нидерланды',
      'code': 'NL',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{1,2}\d{2,3}[A-Z]{1,2}$'),
    },
    {
      'name': 'North Macedonia',
      'name_ru': 'Северная Македония',
      'code': 'MK',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}-\d{3}-\d{2}$'),
    },
    {
      'name': 'Norway',
      'name_ru': 'Норвегия',
      'code': 'NO',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{1,3}-\d{1,4}$'),
    },
    {
      'name': 'Poland',
      'name_ru': 'Польша',
      'code': 'PL',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{1,3}\d{4}[A-Z]{1,2}$'),
    },
    {
      'name': 'Portugal',
      'name_ru': 'Португалия',
      'code': 'PT',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}\d{3}[A-Z]{2}$'),
    },
    {
      'name': 'Romania',
      'name_ru': 'Румыния',
      'code': 'RO',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}-\d{4}$'),
    },
    {
      'name': 'San Marino',
      'name_ru': 'Сан-Марино',
      'code': 'SM',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{1,2}\d{3}$'),
    },
    {
      'name': 'Serbia',
      'name_ru': 'Сербия',
      'code': 'RS',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}-\d{3}-\d{2}$'),
    },
    {
      'name': 'Slovakia',
      'name_ru': 'Словакия',
      'code': 'SK',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{1,2}\d{2,3}[A-Z]{1,2}$'),
    },
    {
      'name': 'Slovenia',
      'name_ru': 'Словения',
      'code': 'SI',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}-\d{3}$'),
    },
    {
      'name': 'Spain',
      'name_ru': 'Испания',
      'code': 'ES',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{4}-\d{4}$'),
    },
    {
      'name': 'Sweden',
      'name_ru': 'Швеция',
      'code': 'SE',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{1,3}-\d{1,4}$'),
    },
    {
      'name': 'Switzerland',
      'name_ru': 'Швейцария',
      'code': 'CH',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}\d{4}[A-Z]{1}$'),
    },
    {
      'name': 'Turkey',
      'name_ru': 'Турция',
      'code': 'TR',
      'vehicle_plate_regex': RegExp(r'^[0-9]{2}-[A-Z]{1}[0-9]{2}-[A-Z]{1,2}$'),
    },
    {
      'name': 'United Kingdom',
      'name_ru': 'Великобритания',
      'code': 'GB',
      'vehicle_plate_regex': RegExp(r'^[A-Z]{2}-\d{4}-[A-Z]{2}$'),
    },
    {
      'name': 'Vatican City',
      'name_ru': 'Ватикан',
      'code': 'VA',
      'vehicle_plate_regex': RegExp(r'^V-1-\d{1,4}$'),
    },
  ];
}

sealed class Urls {
  Urls._();

  static const openFunction = 'v1/invoke_function';
  static const objectSlim = 'v2/object-slim/get-list/';
  static const v2Items = 'v2/items/';
  static const fileUpload = 'v1/files/folder_upload';
}

sealed class TableSlugs {
  TableSlugs._();

  static const String sendCode = 'send-code';
  static const String verifyOtp = 'login/with-option';
  static const String firm = 'firm';
  static const String register = 'register';
  static const String getClientTypeId = 'multi-company/one-login';
  static const String login = 'login';
  static const String news = 'news';
  static const String users = 'users';
  static const String carSale = 'car_sale';
  static const String city = 'city';
  static const String dispatcherDrivers = 'dispatcher_drivers';
  static const String cargoItems = 'cargo';
  static const String cargoFilter = '/logistika-get-cargo-with-filter';
  static const String vehicle = 'vehicle';
  static const String oppositeOffer = 'cargo';
  static const String orders = 'response';
  static const String order = 'order';
  static const String response = 'response';
  static const String trailerType = 'trailer_type';
  static const String fuel = 'fuel';
  static const String cargoType = 'cargo_type';
  static const String loadType = 'load_type';
  static const String review = 'review';
  static const String calculateUserRating = '/logistika-calculate-user-rating';
  static const String vehicleType = 'vehicle_type';
  static const String currency = 'currency';
  static const String route = 'route';
  static const String note = 'note';
  static const String directory = 'directory';
  static const String complain = 'complain';
  static const String period = 'period';
  static const String map = 'map';
  static const String logistikaLogistikaNotification = 'logistika-logistika-notification';
  static const String logistikaSendListOfAddressName = 'logistika-send-list-of-address-name';
  static const String logistikaCheckCargoStatus = '/logistika-check-cargo-status';
  static const String logistikaDriverGpsTracking = 'logistika-driver-gps-tracking';
  static const String logistikaGetCurrentLocation = 'logistika-get-current-location';
  static const String gpsHistory = 'gps_history';
}

class Validations {
  Validations._();

  static const somethingWentWrong = 'Something went wrong!';
}

sealed class AppKeys {
  AppKeys._();

  static const String showBoarding = 'show_boarding';
  static const String hasProfile = 'has_profile';
  static const String locale = 'locale';
  static const String accessToken = 'access_token';
  static const String userId = 'user_id';
  static const String dispatcherId = 'dispatcher_id';
  static const String fullname = 'firstname';
  static const String lastname = 'lastname';
  static const String email = 'email';
  static const String password = 'password';
  static const String themeMode = 'theme_mode';
  static const String searchSavedList = 'search_saved_list';
  static const String firstTime = 'first_time';
  static const String smsId = 'sms_id';
  static const String badgeNumberRoutes = 'badge_number_routes';
  static const String favouriteCargoes = 'favouriteCargoes';
  static const String imageUrl = 'imageUrl';
  static const String phone = 'phone';
  static const String login = 'login';
  static const String firmId = 'firmId';
  static const String vehicleId = 'login';
  static const String hasChuck = 'hasChuck';
}
