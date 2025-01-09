part of '../ca_for_sale_detail_page.dart';

class _CarInfoViewWidget extends StatelessWidget {
  const _CarInfoViewWidget({
    required this.saleCarDetail,
  });

  final SaleCarsDetailPageArguments saleCarDetail;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingAll16,
        child: Material(
          color: context.colorScheme.surface,
          borderRadius: AppUtils.kBorderRadius8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: CachedNetworkImage(
                  imageUrl: saleCarDetail.imageUrls,
                  width: context.kSize.width,
                  height: 182,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: context.color.greyText,
                  ),
                ),
              ),
              Padding(
                padding: AppUtils.kPaddingAll16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          saleCarDetail.carName,
                          style: context.textStyle.splashTitle.copyWith(
                            fontSize: 17,
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          '${saleCarDetail.carPrice.toInt().moneyFormat} ${saleCarDetail.currency}',
                          style: context.textStyle.splashTitle.copyWith(
                            fontSize: 15,
                            color: context.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    AppUtils.kGap16,
                    AppUtils.kDivider,
                    AppUtils.kGap8,
                    Row(
                      children: [
                        Text(
                          '${'type_vehicle'.tr()}: ',
                          style: context.textStyle.regularCaption1.copyWith(
                            color: context.color.lightGray,
                          ),
                        ),
                        AppUtils.kGap8,
                        Text(
                          saleCarDetail.type,
                          style: context.textStyle.regularCaption1.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        AppUtils.kSpacer,
                        Column(
                          children: [
                            Text(
                              saleCarDetail.location,
                              style: context.textStyle.regularCaption1.copyWith(
                                color: context.color.yellow,
                              ),
                            ),
                            AppUtils.kGap8,
                            Text(
                              '${saleCarDetail.date.date()} ${saleCarDetail.date.timeParseHourMinute()}',
                              style: context.textStyle.regularCaption1.copyWith(
                                color: context.color.greyText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppUtils.kGap8,
                    AppUtils.kDivider,
                    AppUtils.kGap16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: context.kSize.width * 0.5,
                          child: Text(
                            saleCarDetail.userName,
                            style: context.textStyle.regularCaption1.copyWith(
                              color: context.colorScheme.primary,
                            ),
                          ),
                        ),
                        Text(
                          saleCarDetail.userNumber,
                          style: context.textStyle.regularCaption1.copyWith(
                            color: context.color.yellow,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
