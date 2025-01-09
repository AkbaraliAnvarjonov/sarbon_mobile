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
        child: Padding(
          padding: AppUtils.kPaddingAll12,
          child: Column(
            children: [
              _RowInfoWidget(
                title: 'date'.tr(),
                info: '${details?.loadTime?.day()}${details?.date?.dateMoth()}',
              ),
              _RowInfoWidget(
                title: 'distance'.tr(),
                info: details?.distance ?? '',
              ),
              _RowInfoWidget(
                title: 'weight'.tr(),
                info: '${details?.weight} т',
              ),
              _RowInfoWidget(
                title: 'volume'.tr(),
                info: '${details?.volumeM3} м³',
              ),
              _RowInfoWidget(
                title: 'product'.tr(),
                info: details?.cargoTypeDetailsData?.name ?? '',
              ),
              _RowInfoWidget(
                title: 'view'.tr(),
                info: (details?.hasAdditionalLoad ?? false)
                    ? 'additional_loading_possible'.tr()
                    : 'additional_loading_not_possible'.tr(),
              ),
              _RowInfoWidget(
                title: 'payment_type'.tr(),
                info: details?.companyDataEntity?.paymentType ?? '',
              ),
              _RowInfoWidget(
                title: 'prepayment'.tr(),
                info:
                    '${details?.companyDataEntity?.rateInterest.toString() ?? ''} ${details?.currencyDataEntity?.code ?? ''}',
              ),
              _RowInfoWidget(
                title: 'type_vehicle'.tr(),
                info: details?.vehicleDataEntity?.name ?? '',
              ),
              _RowInfoWidget(
                title: 'quantity'.tr(),
                info: details?.numberOfCars.toString() ?? '',
                isLastItem: true,
              ),
            ],
          ),
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
          Text(
            'detail'.tr(),
            style: context.textStyle.regularHeadline.copyWith(
              color: context.color.textColor,
            ),
          ),
          AppUtils.kSpacer,
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

class _RowInfoWidget extends StatelessWidget {
  const _RowInfoWidget({
    required this.title,
    required this.info,
    this.isLastItem = false,
  });

  final String title;
  final String info;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$title:',
                style: context.textStyle.size15Weight500Black.copyWith(
                  color: context.color.greyText,
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: context.kSize.width * 0.3,
                  child: Text(
                    info,
                    style: context.textStyle.size15Weight500Black,
                  ),
                ),
              ),
            ],
          ),
          if (!isLastItem) ...[
            AppUtils.kGap12,
            AppUtils.kDivider,
            AppUtils.kGap12,
          ],
        ],
      );
}
