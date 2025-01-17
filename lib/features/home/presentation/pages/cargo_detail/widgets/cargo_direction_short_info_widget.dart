part of '../cargo_detail_page.dart';

class _CargoDirectionShortInfoWidget extends StatelessWidget {
  const _CargoDirectionShortInfoWidget({
    required this.details,
    required this.addressPositions,
  });

  final GetCargoDetailsResponseEntity? details;
  final List<FetchListPositionsEntity> addressPositions;

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
                        (addressPositions.firstOrNull?.addressType ?? '').split(',').first.cutString(14),
                        style: context.textStyle.regularHeadline.copyWith(
                          color: context.color.textColor,
                        ),
                      ),
                      Text(
                        details?.countryCodeFrom ?? '',
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
                        (addressPositions.lastOrNull?.addressType ?? '').split(',').first.cutString(14),
                        style: context.textStyle.regularHeadline.copyWith(
                          color: context.color.textColor,
                        ),
                      ),
                      Text(
                        details?.countryCodeTo ?? '',
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
                '${(details?.asSoonAsA ?? false) ? 'ready_for_loading'.tr() : details?.loadTime?.dateMothWeek()} - ${(details?.asSoonAsB ?? false) ? 'as_soon_as_possible'.tr() : details?.date?.dateMothWeek()}',
                style: context.textStyle.size14Weight400Black,
              ),
            ],
          ),
        ],
      );
}
