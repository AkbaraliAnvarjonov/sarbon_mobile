part of '../ca_for_sale_detail_page.dart';

class _CarPriceAndCallButtonViewWidget extends StatelessWidget {
  const _CarPriceAndCallButtonViewWidget({
    required this.saleCarDetail,
  });

  final SaleCarsDetailPageArguments saleCarDetail;

  @override
  Widget build(BuildContext context) => Material(
        color: context.colorScheme.surface,
        child: SafeArea(
          child: Padding(
            padding: AppUtils.kPaddingAll16,
            child: ElevatedButton(
              onPressed: () async {
                await UrlLauncher.switchPhoneNumber(
                  saleCarDetail.userNumber,
                );
              },
              child: Text('call'.tr()),
            ),
          ),
        ),
      );
}
