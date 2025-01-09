part of '../order_detail_page.dart';

class _OfferDetailInfoWidget extends StatelessWidget {
  const _OfferDetailInfoWidget({
    required this.details,
  });

  final GetOrderDetailsResponseEntity? details;

  @override
  Widget build(BuildContext context) => Material(
        borderRadius: AppUtils.kBorderRadius12,
        color: context.colorScheme.surface,
        child: Padding(
          padding: AppUtils.kPaddingAll12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _RowInfoWidget(
                title: 'car'.tr(),
                info: details?.carType ?? '',
              ),
              _RowInfoWidget(
                title: 'suggested_amount'.tr(),
                info: '${details?.driverCash?.toInt().moneyFormat} ${details?.currencyCode}',
              ),
              _RowInfoWidget(
                title: _getPaymentType(details?.requirements ?? '').tr(),
                info: _getPaymentValue(details),
              ),
              Text(
                'comment'.tr(),
                style: context.textStyle.size15Weight500Black.copyWith(
                  color: context.color.greyText,
                ),
              ),
              AppUtils.kGap8,
              Text(
                details?.driverComment ?? '',
                style: context.textStyle.size15Weight500Black,
              ),
            ],
          ),
        ),
      );
}

String _getPaymentType(String paymentType) {
  if (paymentType == 'in_amounts' || paymentType == 'in_percentages') {
    return 'prepayment';
  } else if (paymentType == 'no_prepayment') {
    return 'payment_method';
  } else {
    return 'payment_method';
  }
}

String _getPaymentValue(GetOrderDetailsResponseEntity? details) {
  if (details?.requirements == 'in_amounts') {
    return '${details?.conditions?.toInt().moneyFormat} ${details?.currencyCode}';
  } else if (details?.requirements == 'in_percentages' || details?.requirements == 'prepayment') {
    return '${details?.conditions?.toInt().moneyFormat} %';
  } else if (details?.requirements == 'after_payment') {
    return 'after_completion'.tr();
  } else {
    return 'after_completion'.tr();
  }
}
