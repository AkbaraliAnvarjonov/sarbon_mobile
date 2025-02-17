part of '../cargo_detail_page.dart';

class _CompanyInfoOfCargoWidget extends StatelessWidget {
  const _CompanyInfoOfCargoWidget({
    required this.companyInfo,
  });

  final CargoCompanyDetailsEntity? companyInfo;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingHorizontal16,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black.withOpacity(0.15)),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(PngImage.absoluteLogo) as ImageProvider,
                ),
              ),
            ),
            AppUtils.kGap12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'ABSOLUTE LOGISTICS',
                      style: context.textStyle.size14Weight400Black,
                    ),
                    AppUtils.kGap4,
                    SvgPicture.asset(SvgImage.verificationIcon),
                  ],
                ),
                AppUtils.kGap4,
                InkWell(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(SvgImage.starIcon),
                    AppUtils.kGap2,
                    Text(
                      (companyInfo?.rating ?? 0).toDouble().toString(),
                      style: context.textStyle.size14Weight500Black,
                    ),
                  ],
                ),
                AppUtils.kGap24,
              ],
            )
          ],
        ),
      );
}

String getCompanyFullName({
  required String aliasName,
  required String companyType,
  required String companyName,
}) =>
    (aliasName.isNotEmpty && companyType.isNotEmpty)
        ? '$companyName ($aliasName $companyType)'
        : ((aliasName.isNotEmpty) && (companyType.isEmpty))
            ? '$companyName ($aliasName)'
            : ((aliasName.isEmpty) && (companyType.isNotEmpty))
                ? '$companyName ($companyType)'
                : companyName;
