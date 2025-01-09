part of '../driver_register_page.dart';

class _DriverRegisterErrorDialog extends StatelessWidget {
  const _DriverRegisterErrorDialog({
    required this.message,
  });

  final String message;

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
                message,
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
