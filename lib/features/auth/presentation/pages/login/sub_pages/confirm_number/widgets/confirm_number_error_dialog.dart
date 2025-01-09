part of '../../forgot_password/forgot_password_page.dart';

class _ConfirmNumberErrorDialog extends StatelessWidget {
  const _ConfirmNumberErrorDialog();

  @override
  Widget build(BuildContext context) => Dialog(
        child: Container(
          padding: AppUtils.kPaddingAll16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('error'.tr(), textAlign: TextAlign.center),
              AppUtils.kGap12,
              Text(
                'something_wrong'.tr(),
                style: context.textStyle.size14Weight400Black,
                textAlign: TextAlign.center,
              ),
              AppUtils.kGap12,
              ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('try_again'.tr()),
              ),
            ],
          ),
        ),
      );
}
