import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:permission_handler/permission_handler.dart';

import 'app.dart';
import 'app_options.dart';
import 'core/utils/utils.dart';
import 'injector_container.dart' as di;
import 'router/app_routes.dart';
import 'services/notification_service.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Permission.notification.isDenied.then(
    (value) {
      if (value) {
        Permission.notification.request();
      }
    },
  );

  await notificationInitialize();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // Pass all uncaught asynchronous errors that aren't handled by the
  // Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  /// bloc logger
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }

  await di.init();

  /// global CERTIFICATE_VERIFY_FAILEd_KEY
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    ModelBinding(
      initialModel: AppOptions(
        themeMode: ThemeMode.light,
        // themeMode: localSource.themeMode,
        locale: Locale(localSource.locale),
      ),
      child: const App(),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      super.createHttpClient(context)..badCertificateCallback = (cert, host, port) => true;
}

/// flutter pub run flutter_launcher_icons:main
/// flutter run -d windows
/// flutter build apk --release
/// flutter build apk --split-per-abi
/// flutter build appbundle --release
/// flutter pub run build_runner watch --delete-conflicting-outputs
/// flutter pub ipa
/// dart fix --apply
