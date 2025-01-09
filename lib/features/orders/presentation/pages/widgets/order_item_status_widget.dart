part of 'order_item.dart';

class OrderItemStatusWidget extends StatelessWidget {
  const OrderItemStatusWidget({
    super.key,
    required this.title,
    required this.tabIndex,
    required this.isNewOffer,
    this.showStatusOnTap,
  });

  final String title;
  final int tabIndex;
  final bool isNewOffer;
  final VoidCallback? showStatusOnTap;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          ColoredBox(
            color: tabIndex == 0
                ? isNewOffer
                    ? context.colorScheme.primary
                    : context.color.darkOrange
                : title == 'breaking' || title == 'road_accident'
                    ? context.color.pink100
                    : context.colorScheme.onPrimary,
            child: Padding(
              padding: AppUtils.kPaddingHor16Ver8,
              child: tabIndex >= 1
                  ? GestureDetector(
                      onTap: showStatusOnTap,
                      child: Material(
                        borderRadius: AppUtils.kBorderRadius6,
                        color: title == 'breaking' ||
                                title == 'road_accident' ||
                                title.contains('cancellation')
                            ? context.colorScheme.error.withOpacity(0.2)
                            : context.color.primary200,
                        child: Padding(
                          padding: title.isNotEmpty
                              ? AppUtils.kPaddingHor12Ver7
                              : AppUtils.kPaddingZero,
                          child: Text(
                            title.tr(),
                            style: context.textStyle.regularCaption1.copyWith(
                              fontWeight: FontWeight.w500,
                              color: title == 'breaking' ||
                                      title == 'road_accident' ||
                                      title.contains('cancellation')
                                  ? context.colorScheme.error
                                  : context.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              isNewOffer
                                  ? SvgImage.icPackageSearch
                                  : SvgImage.icHourglass,
                              height: 16,
                              width: 16,
                              colorFilter: ColorFilter.mode(
                                isNewOffer && tabIndex == 0
                                    ? context.colorScheme.surface
                                    : tabIndex == 1
                                        ? context.color.tealT800
                                        : context.colorScheme.surface,
                                BlendMode.srcIn,
                              ),
                            ),
                            AppUtils.kGap4,
                            Text(
                              title,
                              style: context.textStyle.size14Weight700Black
                                  .copyWith(
                                color: isNewOffer && (tabIndex == 0)
                                    ? context.colorScheme.surface
                                    : tabIndex == 1
                                        ? context.color.tealT800
                                        : context.colorScheme.surface,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          ),
        ],
      );
}
