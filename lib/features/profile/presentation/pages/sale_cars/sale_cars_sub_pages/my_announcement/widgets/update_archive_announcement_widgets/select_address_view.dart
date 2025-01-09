part of '../../announcement_tab_pages/sub_pages/update_archive_announcement_page.dart';

class _SelectAddressViewWidget extends StatelessWidget {
  const _SelectAddressViewWidget();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'select_address'.tr(),
            style: context.textStyle.size14Weight500Black.copyWith(
                    color: context.color.gray700,
                  ),
          ),
          AppUtils.kGap6,
          const _SelectAddressWidget(),
        ],
      );
}
