part of '../order_detail_page.dart';

class _OrderCompanyInfoWidget extends StatelessWidget {
  const _OrderCompanyInfoWidget({
    required this.companyInfo,
    required this.isForDeal,
  });

  final OrderCompanyDetailsEntity? companyInfo;
  final bool isForDeal;

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
                    'ABSOLUTE LOGISTICS',
                    // '${companyInfo?.fullName ?? ''} '
                    // '(${companyInfo?.name ?? ''}, '
                    // '${(companyInfo?.companyType?.isNotEmpty ?? false) ? companyInfo?.companyType?.first : ''})',
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
            AppUtils.kGap4,
            Visibility(
              visible: !isForDeal,
              child: RichText(
                text: TextSpan(
                  text: '${'code'.tr()}: ',
                  children: [
                    TextSpan(
                      text: companyInfo?.tin ?? '',
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
            ),
            Visibility(
              visible: !isForDeal,
              child: AppUtils.kGap8,
            ),
            Visibility(
              visible: (companyInfo?.phoneNumber ?? '').isNotEmpty,
              child: RichText(
                text: TextSpan(
                  text: '${'for_contact'.tr()}: ',
                  children: [
                    TextSpan(
                      text: companyInfo?.phoneNumber ?? '',
                      style: context.textStyle.size14Weight400Black.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                  style: context.textStyle.size14Weight400Black.copyWith(
                    color: context.color.midGray.withOpacity(0.8),
                  ),
                ),
              ),
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
