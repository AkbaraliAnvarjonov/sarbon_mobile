import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarbon_mobile/core/extension/extension.dart';

import '../../../../../constants/image_constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../router/app_routes.dart';

class SelectAuthPage extends StatelessWidget {
  const SelectAuthPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Positioned(
                top: 140,
                child: Image.asset(PngImage.firstPageImage),
              ),
              Positioned(
                top: 30,
                child: Image.asset(PngImage.appLogoColored, height: 60, width: 230),
              ),
              Positioned(
                top: 120,
                left: 16,
                right: 16,
                child: Padding(
                  padding: AppUtils.kPaddingHorizontal16,
                  child: Text(
                    'Получите выгодные заказы уже сегодня!',
                    style: context.textStyle.appBarTitle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.color.textColor2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (!context.mounted) return;
                    await context.push(Routes.register);
                  },
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(
                      context.color.textColor2,
                    ),
                    backgroundColor: WidgetStateProperty.all(
                      context.color.textColor2,
                    ),
                  ),
                  child: Text(
                    'register'.tr(),
                    style: context.textStyle.bodyCallout.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
                AppUtils.kGap8,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEDEFF5),
                    foregroundColor: context.color.textColor2,
                    shape: RoundedRectangleBorder(
                      borderRadius: AppUtils.kBorderRadius12,
                      side: BorderSide(
                        color: context.color.quatGrey,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (!context.mounted) return;
                    await context.push(Routes.login);
                  },
                  child: Text(
                    'login'.tr(),
                    style: context.textStyle.bodyCallout.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                AppUtils.kGap8,
                ElevatedButton(
                  onPressed: () {
                    context.goNamed(Routes.main);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEDEFF5),
                    foregroundColor: context.color.textColor2,
                    shape: RoundedRectangleBorder(
                      borderRadius: AppUtils.kBorderRadius12,
                      side: BorderSide(
                        color: context.color.quatGrey,
                      ),
                    ),
                  ),
                  child: Text(
                    'Пропустить',
                    style: context.textStyle.bodyCallout.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
