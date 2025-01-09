part of '../ca_for_sale_detail_page.dart';

class _DescriptionViewWidget extends StatelessWidget {
  const _DescriptionViewWidget({required this.carDescription});

  final String carDescription;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingHor12Ver8,
        child: Material(
          borderRadius: AppUtils.kBorderRadius8,
          color: context.colorScheme.surface,
          child: Padding(
            padding: AppUtils.kPaddingAll16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'description'.tr(),
                  style: context.textStyle.size15Weight500Black.copyWith(
                    fontSize: 17,
                  ),
                ),
                AppUtils.kGap8,
                Text(
                  carDescription,
                  style: context.textStyle.regularCaption2.copyWith(
                    color: context.color.greyText,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
