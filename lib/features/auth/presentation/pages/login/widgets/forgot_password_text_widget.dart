part of '../login_page.dart';

class _ForgotPasswordTextWidget extends StatelessWidget {
  const _ForgotPasswordTextWidget();

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () async {
            await context.push(Routes.forgotPassword);
          },
          child: Text(
            'forgot_password_or_login'.tr(),
            style: context.textStyle.size14Weight500Black.copyWith(
              color: context.colorScheme.primary,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      );
}
