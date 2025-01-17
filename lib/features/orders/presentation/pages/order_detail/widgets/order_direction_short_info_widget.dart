part of '../order_detail_page.dart';

class _OrderDirectionShortInfoWidget extends StatelessWidget {
  const _OrderDirectionShortInfoWidget({
    required this.details,
  });

  final GetOrderDetailsResponseEntity? details;

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
                        (details?.from ?? '').split(',').first.cutString(15),
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
                    size: 18,
                  ),
                  AppUtils.kGap8,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (details?.to ?? '').split(',').first.cutString(15),
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
