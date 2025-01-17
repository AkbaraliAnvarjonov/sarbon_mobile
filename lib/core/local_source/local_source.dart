import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../constants/constants.dart';

final class LocalSource {
  LocalSource(this.box);

  final Box<dynamic> box;

  Future<void> setLocale(String locale) async {
    await box.put(AppKeys.locale, locale);
  }

  String get locale => box.get(AppKeys.locale, defaultValue: 'ru');

  ThemeMode get themeMode => switch (box.get(AppKeys.themeMode)) {
        'system' => ThemeMode.system,
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.system,
      };

  Locale get localeObj => switch (locale) {
        'ru' => Constants.ruLan,
        'uz' => Constants.uzLan,
        'tr' => Constants.trLan,
        'en' => Constants.enLan,
        'ch' => Constants.chLan,
        _ => Constants.ruLan,
      };

  String get localeName => '${localeObj.languageCode}_${localeObj.countryCode}';

  Future<void> setUser({
    required String imageUrl,
    required String name,
    required String phoneNumber,
    required String email,
    required String password,
    required String login,
    String? id,
    String? firmId,
    String? vehicleId,
  }) async {
    final data = {
      AppKeys.hasProfile: true,
      AppKeys.imageUrl: imageUrl,
      AppKeys.fullname: name,
      AppKeys.phone: phoneNumber,
      AppKeys.email: email,
      AppKeys.password: password,
      AppKeys.login: login,
      if (id != null) AppKeys.userId: id,
      if (firmId != null) AppKeys.firmId: firmId,
      if (vehicleId != null) AppKeys.vehicleId: vehicleId,
    };

    await Future.wait(data.entries.map((entry) => box.put(entry.key, entry.value)));
  }

  Future<void> setVehicleId(String vehicleId) async {
    await box.put(AppKeys.vehicleId, vehicleId);
  }

  String get vehicleId => box.get(AppKeys.vehicleId, defaultValue: '');

  Future<void> setThemeMode(ThemeMode mode) async {
    await box.put(AppKeys.themeMode, mode.name);
  }

  int get badgeNumberRoutes => box.get(
        AppKeys.badgeNumberRoutes,
        defaultValue: 0,
      );

  Future<void> setBadgeNumberRoutes(int pageNumber) async {
    await box.put(AppKeys.badgeNumberRoutes, pageNumber);
  }

  String get imageUrl => box.get(AppKeys.imageUrl, defaultValue: '') as String;

  Future<void> setSearchSavedList(List<String> searchSavedList) async {
    await box.put(AppKeys.searchSavedList, searchSavedList);
  }

  Future<void> setShowBoarding({required bool value}) async {
    await box.put(AppKeys.showBoarding, value);
  }

  bool showBoarding() => box.get(AppKeys.showBoarding, defaultValue: true);

  Future<void> setHasProfile({required bool hasProfile}) async {
    await box.put(AppKeys.hasProfile, hasProfile);
  }

  Future<void> setHasChuck({required bool hasChuck}) async {
    await box.put(AppKeys.hasChuck, hasChuck);
  }

  bool get hasChuck => box.get(AppKeys.hasChuck, defaultValue: false);

  List<String> get searchSavedList => box.get(
        AppKeys.searchSavedList,
        defaultValue: <String>[],
      );

  bool get hasProfile => box.get(AppKeys.hasProfile, defaultValue: false);

  Future<void> setFirstTime({required bool firstTime}) async {
    await box.put(AppKeys.firstTime, firstTime);
  }

  Future<void> setFavouriteCargoes(List<String> favouriteCargoes) async {
    await box.put(AppKeys.favouriteCargoes, favouriteCargoes);
  }

  List<String> get favouriteCargoes => box.get(AppKeys.favouriteCargoes, defaultValue: <String>[]);

  bool get firstTime => box.get(AppKeys.firstTime, defaultValue: false);

  Future<void> setAccessToken(String accessToken) async {
    await box.put(AppKeys.accessToken, accessToken);
  }

  String get accessToken => box.get(AppKeys.accessToken, defaultValue: '');

  Future<void> setSmsId(String smsId) async {
    await box.put(AppKeys.smsId, smsId);
  }

  String get smsId => box.get(AppKeys.smsId, defaultValue: '');

  Future<void> deleteSmsId() async {
    await box.delete(AppKeys.smsId);
  }

  Future<void> deleteUserImage() async {
    await box.delete(AppKeys.imageUrl);
  }

  Future<void> setUserId(String userId) async {
    await box.put(AppKeys.userId, userId);
  }

  String get userId => box.get(AppKeys.userId, defaultValue: '');

  Future<void> setFullName(String firstName) async {
    await box.put(AppKeys.fullname, firstName);
  }

  String get fullName => box.get(AppKeys.fullname, defaultValue: '');

  Future<void> setLastName(String lastName) async {
    await box.put(AppKeys.lastname, lastName);
  }

  String get lastName => box.get(AppKeys.lastname, defaultValue: '');

  Future<void> setEmail(String email) async {
    await box.put(AppKeys.email, email);
  }

  String get email => box.get(AppKeys.email, defaultValue: '');

  String get firmId => box.get(AppKeys.firmId, defaultValue: '');

  String get phoneNumber => box.get(AppKeys.phone, defaultValue: '');

  String get login => box.get(AppKeys.login, defaultValue: '');

  Future<void> setPassword(String password) async {
    await box.put(AppKeys.password, password);
  }

  String? get password => box.get(AppKeys.password);

  Box get prefers => box;

  Future<void> clear() async {
    await box.delete(AppKeys.accessToken);
    await box.delete(AppKeys.userId);
    await box.delete(AppKeys.fullname);
    await box.delete(AppKeys.lastname);
    await box.delete(AppKeys.email);
    await box.delete(AppKeys.password);
    await box.delete(AppKeys.hasProfile);
    await box.delete(AppKeys.badgeNumberRoutes);
    await box.delete(AppKeys.favouriteCargoes);
    await box.delete(AppKeys.imageUrl);
    await box.delete(AppKeys.phone);
    await box.delete(AppKeys.login);
  }
}
