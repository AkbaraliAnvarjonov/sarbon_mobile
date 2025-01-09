part of '../order_by_notification_page.dart';

class _OrderDirectionShortInfoWidget extends StatelessWidget {
  const _OrderDirectionShortInfoWidget({
    required this.details,
  });

  final GetOrderByNotificationEntity? details;

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
                  Text(
                    details?.addressDataEntity?.name ?? '',
                    style: context.textStyle.regularHeadline.copyWith(
                      color: context.color.textColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: context.colorScheme.onSurface,
                    size: 20,
                  ),
                  Text(
                    details?.address2DataEntity?.name ?? '',
                    style: context.textStyle.regularHeadline.copyWith(
                      color: context.color.textColor,
                    ),
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
