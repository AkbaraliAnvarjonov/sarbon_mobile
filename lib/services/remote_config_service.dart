import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/extension/extension.dart';
import '../router/app_routes.dart';

sealed class RemoteConfigService {
  RemoteConfigService._();

  static FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  static Future<(AppUpdate, String, String)> isCallCheckAppVersion(
    BuildContext context,
  ) async {
    if (await networkInfo.isConnected) {
      print('Firebase initialize');
      try {
        await remoteConfig.setConfigSettings(
          RemoteConfigSettings(
            fetchTimeout: Duration.zero,
            minimumFetchInterval: Duration.zero,
          ),
        );
        await remoteConfig.fetchAndActivate();
        RemoteConfigValue? version;
        if (Platform.isAndroid) {
          version = remoteConfig.getAll()['android_driver'];
        } else {
          version = remoteConfig.getAll()['ios_driver'];
        }

        final isNotLast = isNotLastVersion(packageInfo.version, version);
        return isNotLast;
      } on Exception catch (e, s) {
        log('Firebase initialize error: $e $s');
        return (AppUpdate.none, '', '');
      }
    } else {
      // ignore: use_build_context_synchronously
      return context.pushNamed(Routes.noInternet).then(
        (value) {
          if (!context.mounted) {
            return (AppUpdate.none, '', '');
          }
          return isCallCheckAppVersion(context);
        },
      );
    }
  }

  static (AppUpdate, String, String) isNotLastVersion(
    String appVersion,
    RemoteConfigValue? employeeVersion,
  ) {
    if (employeeVersion == null) return (AppUpdate.none, '', '');
    final Map<String, dynamic> employeeVersionMap = jsonDecode(employeeVersion.asString());
    print('mana data $employeeVersionMap');
    final String version = employeeVersionMap['version'];
    final bool isForce = employeeVersionMap['is_force'];
    final int employee = version.replaceAll('.', '').toVersion;
    final int package = appVersion.replaceAll('.', '').toVersion;
    print('package $employee $package');

    if (package < employee && isForce) {
      return (AppUpdate.forceUpdate, appVersion, version);
    }
    if (package < employee && !isForce) {
      return (AppUpdate.softUpdate, appVersion, version);
    }
    return (AppUpdate.none, '', '');
  }
}

enum AppUpdate { forceUpdate, softUpdate, none }
