part of '../cargo_detail_page.dart';

class _CargoDirectionShortInfoWidget extends StatelessWidget {
  const _CargoDirectionShortInfoWidget({
    required this.details,
  });

  final GetCargoDetailsResponseEntity? details;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (context.locale.languageCode == 'ru'
                                ? details?.cityNameRu
                                : details?.cityNameEn) ??
                            '',
                        style: context.textStyle.regularHeadline.copyWith(
                          color: context.color.textColor,
                        ),
                      ),
                      Text(
                        (context.locale.languageCode == 'ru'
                                ? details?.addressDataEntity?.nameRu
                                : details?.addressDataEntity?.nameEn) ??
                            '',
                        style: context.textStyle.regularFootnote.copyWith(
                          color: context.color.gray700,
                        ),
                      ),
                    ],
                  ),
                  AppUtils.kGap8,
                  Icon(
                    Icons.arrow_forward,
                    color: context.colorScheme.onSurface,
                    size: 16,
                  ),
                  AppUtils.kGap8,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (context.locale.languageCode == 'ru'
                                ? details?.city2NameRu
                                : details?.city2NameEn) ??
                            '',
                        style: context.textStyle.regularHeadline.copyWith(
                          color: context.color.textColor,
                        ),
                      ),
                      Text(
                        (context.locale.languageCode == 'ru'
                                ? details?.address2DataEntity?.nameRu
                                : details?.address2DataEntity?.nameEn) ??
                            '',
                        style: context.textStyle.regularFootnote.copyWith(
                          color: context.color.gray700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppUtils.kGap4,
              Text(
                details?.distance ?? '',
                style: context.textStyle.bodyFootnote.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
              AppUtils.kGap8,
              Text(
                'loading_and_unloading_date'.tr(),
                style: context.textStyle.bodyFootnote.copyWith(
                  color: context.color.greyText,
                ),
              ),
              Text(
                '${details?.loadTime?.dateMothWeek()} - ${details?.date?.dateMothWeek()}',
                style: context.textStyle.size14Weight400Black,
              ),
            ],
          ),
        ],
      );
}
