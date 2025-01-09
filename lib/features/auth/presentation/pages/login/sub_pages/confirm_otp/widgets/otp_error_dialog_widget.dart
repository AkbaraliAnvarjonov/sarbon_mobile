part of '../../forgot_password/forgot_password_page.dart';

class _OtpErrorDialogWidget extends StatelessWidget {
  const _OtpErrorDialogWidget();

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
            'this_phone_number_has_not_been_previously_registered'
                .tr(),
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
