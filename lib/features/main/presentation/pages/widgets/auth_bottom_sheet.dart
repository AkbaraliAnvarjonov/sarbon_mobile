import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarbon_mobile/core/extension/extension.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../router/app_routes.dart';

class AuthBottomSheet extends StatelessWidget {
  const AuthBottomSheet({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingHorizontal24,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppUtils.kGap12,
            Text(
              'Авторизуйтесь для продолжения',
              style: context.textStyle.size15Weight600Black.copyWith(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            AppUtils.kGap24,
            Text(
              'Доступно только зарегистрированным пользователям. Войдите или создайте аккаунт, чтобы продолжить',
              style: context.textStyle.size14Weight400Black,
              textAlign: TextAlign.center,
            ),
            AppUtils.kGap32,
            AppUtils.kGap8,
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
            AppUtils.kGap12,
            SafeArea(
              child: ElevatedButton(
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
            ),
          ],
        ),
      );
}
