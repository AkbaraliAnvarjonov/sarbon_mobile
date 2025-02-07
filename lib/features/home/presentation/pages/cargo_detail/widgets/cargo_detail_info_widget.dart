part of '../cargo_detail_page.dart';

class _CargoDetailInfoWidget extends StatelessWidget {
  const _CargoDetailInfoWidget({
    required this.details,
  });

  final GetCargoDetailsResponseEntity? details;

  @override
  Widget build(BuildContext context) => Material(
        borderRadius: AppUtils.kBorderRadius12,
        color: context.colorScheme.surface,
        child: Column(
          children: [
            Padding(
              padding: AppUtils.kPaddingVertical16,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(SvgImage.icTruckFilled),
                  AppUtils.kGap16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        details?.vehicleDataEntity?.name ?? '',
                        style: context.textStyle.size14Weight500Black.copyWith(
                          fontSize: 17,
                        ),
                      ),
                      AppUtils.kGap4,
                      Text(
                        '${details?.numberOfCars.toString() ?? '0'} машина',
                        style: context.textStyle.size14Weight400Black,
                      )
                    ],
                  )
                ],
              ),
            ),
            AppUtils.kDivider,
            Padding(
              padding: AppUtils.kPaddingVertical16,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(SvgImage.icBox),
                  AppUtils.kGap16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            SvgImage.dumbellIcon,
                            height: 16,
                            width: 16,
                            colorFilter: ColorFilter.mode(
                              context.color.dark1,
                              BlendMode.srcIn,
                            ),
                          ),
                          Text(
                            ' ${details?.weight} т.  ',
                            style: context.textStyle.size14Weight500Black.copyWith(
                              fontSize: 17,
                            ),
                          ),
                          SvgPicture.asset(
                            SvgImage.kubIcon,
                            height: 16,
                            width: 16,
                            colorFilter: ColorFilter.mode(
                              context.color.dark1,
                              BlendMode.srcIn,
                            ),
                          ),
                          Text(
                            ' ${details?.volumeM3} м³',
                            style: context.textStyle.size14Weight500Black.copyWith(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      AppUtils.kGap4,
                      Text(
                        '${details?.cargoTypeDetailsData?.name ?? ''}, ${(details?.hasAdditionalLoad ?? false) ? 'additional_loading_possible'.tr() : 'additional_loading_not_possible'.tr()}',
                        style: context.textStyle.size14Weight400Black,
                      ),
                    ],
                  )
                ],
              ),
            ),
            AppUtils.kDivider,
            Padding(
              padding: AppUtils.kPaddingVertical16,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(SvgImage.icPrice),
                  AppUtils.kGap16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${details?.bidCash?.toInt().moneyFormat} ${details?.currencyDataEntity?.code}',
                        style: context.textStyle.size14Weight500Black.copyWith(
                          fontSize: 17,
                        ),
                      ),
                      AppUtils.kGap4,
                      Text(
                        details?.companyDataEntity?.paymentType ?? '',
                        style: context.textStyle.size14Weight400Black,
                      )
                    ],
                  ),
                  AppUtils.kSpacer,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'prepayment'.tr(),
                        style: context.textStyle.size14Weight400Black.copyWith(color: const Color(0xFF7E7B86)),
                      ),
                      AppUtils.kGap4,
                      Text(
                        '${details?.companyDataEntity?.rateInterest.toString() ?? ''} ${details?.currencyDataEntity?.code ?? ''}',
                        style: context.textStyle.size14Weight400Black,
                      )
                    ],
                  ),
                ],
              ),
            ),
            AppUtils.kDivider,
            if ((details?.comment ?? '').isNotEmpty)
              Padding(
                padding: AppUtils.kPaddingVertical16,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(SvgImage.icComment),
                    AppUtils.kGap16,
                    Expanded(
                      child: HtmlWidget(
                        details?.comment ?? '',
                        textStyle: context.textStyle.size14Weight400Black,
                      ),
                    ),
                  ],
                ),
              ),
            AppUtils.kGap16,
          ],
        ),
      );
}

class _CargoDetailInfoTitleWidget extends StatelessWidget {
  const _CargoDetailInfoTitleWidget({
    required this.isCmr,
    required this.isT1,
    required this.isTir,
    required this.adr,
  });

  final bool isCmr;
  final bool isT1;
  final bool isTir;
  final List<String> adr;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          if (isCmr)
            Padding(
              padding: AppUtils.kPaddingL8,
              child: Material(
                color: context.colorScheme.primary,
                borderRadius: AppUtils.kBorderRadius4,
                child: Padding(
                  padding: AppUtils.kPaddingHor12Ver4,
                  child: Text(
                    'CMR',
                    style: context.textStyle.regularCaption2.copyWith(
                      color: context.colorScheme.surface,
                    ),
                  ),
                ),
              ),
            ),
          if (isT1)
            Padding(
              padding: AppUtils.kPaddingL8,
              child: Material(
                color: context.colorScheme.primary,
                borderRadius: AppUtils.kBorderRadius4,
                child: Padding(
                  padding: AppUtils.kPaddingHor12Ver4,
                  child: Text(
                    'T1',
                    style: context.textStyle.regularCaption2.copyWith(
                      color: context.colorScheme.surface,
                    ),
                  ),
                ),
              ),
            ),
          if (isTir)
            Padding(
              padding: AppUtils.kPaddingL8,
              child: Material(
                color: context.colorScheme.primary,
                borderRadius: AppUtils.kBorderRadius4,
                child: Padding(
                  padding: AppUtils.kPaddingHor12Ver4,
                  child: Text(
                    'TIR',
                    style: context.textStyle.regularCaption2.copyWith(
                      color: context.colorScheme.surface,
                    ),
                  ),
                ),
              ),
            ),
          if (adr.isNotEmpty)
            Padding(
              padding: AppUtils.kPaddingL8,
              child: Material(
                color: context.colorScheme.primary,
                borderRadius: AppUtils.kBorderRadius4,
                child: Padding(
                  padding: AppUtils.kPaddingHor12Ver4,
                  child: Text(
                    adr.first,
                    style: context.textStyle.regularCaption2.copyWith(
                      color: context.colorScheme.surface,
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
}
