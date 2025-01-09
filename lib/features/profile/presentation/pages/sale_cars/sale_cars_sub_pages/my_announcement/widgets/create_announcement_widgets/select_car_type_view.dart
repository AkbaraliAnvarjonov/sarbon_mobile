part of '../../announcement_tab_pages/sub_pages/create_new_announcement_page.dart';

class _SelectCarTypeViewWidget extends StatelessWidget {
  const _SelectCarTypeViewWidget();

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        'select_type_vehicle'.tr(),
        style: context.textStyle.size14Weight500Black.copyWith(
                    color: context.color.gray700,
                  ),
      ),
      AppUtils.kGap6,
      const _SelectCarTypeWidget(),
    ],
  );
}
