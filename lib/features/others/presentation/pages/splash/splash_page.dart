import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../constants/constants.dart';
import '../../../../../constants/image_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../core/widgets/bottom_sheet/update_app_sheet.dart';
import '../../../../../router/app_routes.dart';
import '../../../../../services/remote_config_service.dart';

part 'mixins/splash_mixin.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SplashMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.colorScheme.primary,
        body: Center(
          child: Image.asset(
            PngImage.appLogo,
            height: 60,
            width: 230,
            fit: BoxFit.fitWidth,
          ),
        ),
      );
}
