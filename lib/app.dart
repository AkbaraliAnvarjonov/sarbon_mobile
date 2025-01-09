import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/extension/extension.dart';
import 'core/l10n/app_localizations.dart';
import 'core/theme/themes.dart';
import 'features/main/presentation/bloc/main_bloc.dart';
import 'injector_container.dart';
import 'router/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<MainBloc>(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: scaffoldMessengerKey,

          /// theme style
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  textScaler: TextScaler.linear(
                      MediaQuery.textScaleFactorOf(context) > 1.2 ? 1.2 : MediaQuery.textScaleFactorOf(context))),
              child: child!,
            );
          },
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: context.options.themeMode,

          /// locale
          locale: context.options.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,

          /// pages
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
        ),
      );
}
