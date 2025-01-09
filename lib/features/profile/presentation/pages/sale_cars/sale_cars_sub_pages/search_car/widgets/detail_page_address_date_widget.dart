part of '../ca_for_sale_detail_page.dart';

class _AddressAndDateViewWidget extends StatelessWidget {
  const _AddressAndDateViewWidget({
    required this.carPrice,
    required this.currency,
    required this.date,
  });

  final num carPrice;
  final String currency;
  final String date;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingAll16,
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${carPrice.moneyFormat} $currency',
                style: context.textStyle.size15Weight500Black.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: context.colorScheme.primary,
                ),
              ),
            ),
            Text(
              '${date.date()}\n${date.timeParseHourMinute()}',
              style: context.textStyle.size14Weight400Black.copyWith(
                color: context.color.greyText,
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
}
