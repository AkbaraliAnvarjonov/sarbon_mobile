part of '../order_by_notification_page.dart';

class _OrderCompanyInfoWidget extends StatelessWidget {
  const _OrderCompanyInfoWidget({
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
          children: [
            Row(
              children: [
                Ink(
                  height: 32,
                  width: 32,
                  padding: AppUtils.kPaddingAll6,
                  decoration: BoxDecoration(
                    borderRadius: AppUtils.kBorderRadius6,
                    color: context.colorScheme.primary.withOpacity(0.07),
                  ),
                  child: SvgPicture.asset(
                    SvgImage.icHome,
                  ),
                ),
                AppUtils.kGap8,
                Expanded(
                  child: Text(
                    getCompanyFullName(
                      aliasName: companyInfo?.aliasName ?? '',
                      companyType: companyInfo?.companyType ?? [],
                      companyName: companyInfo?.name ?? '',
                    ),
                    style: context.textStyle.size13Weight600Black.copyWith(
                      color: context.color.textColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            AppUtils.kGap8,
            RichText(
              text: TextSpan(
                text: '${'location'.tr()}: ',
                children: [
                  TextSpan(
                    text: companyInfo?.buildingAddress ?? '',
                    style: context.textStyle.size14Weight400Black.copyWith(
                      color: context.color.textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
                style: context.textStyle.size14Weight400Black.copyWith(
                  color: context.color.midGray.withOpacity(0.8),
                ),
              ),
            ),
            AppUtils.kGap4,
            RatingBarWidget(
              rating: (companyInfo?.rating ?? 0).toDouble(),
              activeRatingColor: context.color.yellow,
            ),
          ],
        ),
      );
}

String getCompanyFullName({
  required String aliasName,
  required List<String> companyType,
  required String companyName,
}) =>
    (aliasName.isNotEmpty && companyType.isNotEmpty)
        ? '$companyName ($aliasName ${companyType.first})'
        : ((aliasName.isNotEmpty) && (companyType.isEmpty))
            ? '$companyName ($aliasName)'
            : ((aliasName.isEmpty) && (companyType.isNotEmpty))
                ? '$companyName (${companyType.first})'
                : companyName;
