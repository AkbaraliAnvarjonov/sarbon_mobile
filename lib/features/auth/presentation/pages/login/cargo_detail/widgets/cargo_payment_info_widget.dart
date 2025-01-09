part of '../cargo_detail_page.dart';

class _CargoPaymentInfoWidget extends StatelessWidget {
  const _CargoPaymentInfoWidget({
    required this.companyInfo,
  });

  final CargoCompanyDetailsEntity? companyInfo;

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
            CargoInfoItemWidget(
              title: 'Тип оплаты: ',
              info: '${companyInfo?.paymentType}',
              isLastItem: false,
            ),
            CargoInfoItemWidget(
              title: 'Предоплата процент: ',
              info: '${companyInfo?.rateInterest}',
              isLastItem: false,
            ),
            CargoInfoItemWidget(
              title: 'Оплата после завершение: ',
              info: '${companyInfo?.rateInterestAfterCompletion}',
              isLastItem: true,
            ),
          ],
        ),
      );
}
