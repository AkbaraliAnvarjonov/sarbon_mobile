part of '../cargo_detail_page.dart';

class _CompanyInfoOfCargoWidget extends StatelessWidget {
  const _CompanyInfoOfCargoWidget({
    required this.companyInfo,
  });

  final CargoCompanyDetailsEntity? companyInfo;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingVertical16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              SvgImage.icHome,
            ),
            AppUtils.kGap12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ABSOLUTE LOGISTICS',
                  // '${companyInfo?.companyType ?? ''})',
                  style: context.textStyle.size14Weight400Black,
                ),
                GestureDetector(
                  onTap: () async {
                    await UrlLauncher.switchPhoneNumber(companyInfo?.phoneNumber ?? '');
                  },
                  child: Text(
                    companyInfo?.phoneNumber ?? '',
                    style: context.textStyle.size14Weight500Black,
                  ),
                )
              ],
            ),
            AppUtils.kSpacer,
            SvgPicture.asset(
              SvgImage.starIcon,
              height: 18,
              width: 18,
            ),
            Text(
              ' ${(companyInfo?.rating ?? 0).toStringAsFixed(1)}',
              style: context.textStyle.size14Weight500Black,
            )
          ],
        ),
      );
}
