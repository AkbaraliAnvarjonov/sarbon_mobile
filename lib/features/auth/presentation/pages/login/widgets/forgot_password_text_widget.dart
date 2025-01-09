part of '../login_page.dart';

class _ForgotPasswordTextWidget extends StatelessWidget {
  const _ForgotPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
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
      );
}
