part of '../login_page.dart';

class _NoAccountTextWidget extends StatelessWidget {
  const _NoAccountTextWidget();

  @override
  Widget build(BuildContext context) => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'do_not_have_an_account'.tr(),
          style: context.textStyle.size14Weight400Black.copyWith(
            color: context.color.gray700,
          ),
          children: [
            TextSpan(
              text: 'register'.tr(),
              style: context.textStyle.size14Weight500Black.copyWith(
                color: context.colorScheme.primary,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await context.push(Routes.register);
                },
            ),
          ],
        ),
      );
}
