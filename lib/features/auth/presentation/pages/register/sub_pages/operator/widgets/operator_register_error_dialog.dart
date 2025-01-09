part of '../operator_register_page.dart';

class _OperatorRegisterErrorDialog extends StatelessWidget {
  const _OperatorRegisterErrorDialog();

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
                'an_error_occurred_during_registration'.tr(),
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
