part of '../ca_for_sale_detail_page.dart';

class _UserInfoViewWidget extends StatelessWidget {
  const _UserInfoViewWidget({required this.saleCarDetail});

  final SaleCarsDetailPageArguments saleCarDetail;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingAll16,
        child: Material(
          borderRadius: AppUtils.kBorderRadius8,
          color: context.colorScheme.surface,
          child: Padding(
            padding: AppUtils.kPaddingAll16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Material(
                      borderRadius: AppUtils.kBorderRadius8,
                      color: context.colorScheme.primary.withOpacity(0.1),
                      child: Padding(
                        padding: AppUtils.kPaddingAll8,
                        child: SvgPicture.asset(
                          SvgImage.icHome,
                        ),
                      ),
                    ),
                    AppUtils.kGap12,
                    Text(
                      '${saleCarDetail.userName} ${saleCarDetail.userType}',
                      style: context.textStyle.size13Weight600Black,
                    ),
                  ],
                ),
                AppUtils.kGap8,
                Text(
                  'Рейтинг: ${saleCarDetail.rating}',
                  style: context.textStyle.size14Weight400Black,
                ),
              ],
            ),
          ),
        ),
      );
}
