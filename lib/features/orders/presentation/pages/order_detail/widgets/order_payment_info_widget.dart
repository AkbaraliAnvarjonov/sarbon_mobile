part of '../order_detail_page.dart';

class _OrderPaymentInfoWidget extends StatelessWidget {
  const _OrderPaymentInfoWidget({
    required this.companyInfo,
  });

  final OrderCompanyDetailsEntity? companyInfo;

  @override
  Widget build(BuildContext context) => Ink(
        padding: AppUtils.kPaddingAll12,
        decoration: BoxDecoration(
          borderRadius: AppUtils.kBorderRadius12,
          color: context.colorScheme.onPrimary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            OrderInfoItemWidget(
              title: 'Тип оплаты: ',
              info: '${companyInfo?.paymentType}',
              isLastItem: false,
            ),
            OrderInfoItemWidget(
              title: 'Предоплата процент: ',
              info: '${companyInfo?.rateInterest}',
              isLastItem: false,
            ),
            OrderInfoItemWidget(
              title: 'Оплата после завершение: ',
              info: '${companyInfo?.rateInterestAfterCompletion}',
              isLastItem: true,
            ),
          ],
        ),
      );
}
