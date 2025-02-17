part of '../cargo_detail_page.dart';

class _CargoDetailInfoWidget extends StatelessWidget {
  const _CargoDetailInfoWidget({
    required this.details,
  });

  final GetCargoDetailsResponseEntity? details;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingHorizontal16,
        child: Column(
          children: [
            // _RowInfoWidget(
            //   title: 'date'.tr(),
            //   info: '${details?.loadTime?.day()}${details?.date?.dateMoth()}',
            // ),
            Padding(
              padding: AppUtils.kPaddingVertical16,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(SvgImage.icTruckFilled),
                  AppUtils.kGap16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        details?.vehicleDataEntity?.name ?? '',
                        style: context.textStyle.size15Weight500Black.copyWith(fontSize: 17),
                      ),
                      AppUtils.kGap4,
                      Text(
                        '${details?.numberOfCars.toString() ?? ''} машина',
                        style: context.textStyle.size14Weight400Black,
                      )
                    ],
                  ),
                ],
              ),
            ),
            AppUtils.kDivider,
            Padding(
              padding: AppUtils.kPaddingVertical16,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(SvgImage.icBox),
                  AppUtils.kGap16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            SvgImage.dumbellIcon,
                            height: 16,
                            width: 16,
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          AppUtils.kGap2,
                          Text(
                            '${details?.weight} т',
                            style: context.textStyle.size15Weight500Black.copyWith(fontSize: 17),
                          ),
                          AppUtils.kGap6,
                          SvgPicture.asset(
                            SvgImage.kubIcon,
                            height: 16,
                            width: 16,
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          AppUtils.kGap2,
                          Text(
                            '${details?.volumeM3} м³',
                            style: context.textStyle.size15Weight500Black.copyWith(fontSize: 17),
                          ),
                        ],
                      ),
                      AppUtils.kGap4,
                      Text(
                        '${details?.cargoTypeDetailsData?.name ?? ''}, ${(details?.hasAdditionalLoad ?? false) ? 'additional_loading_possible'.tr() : 'additional_loading_not_possible'.tr()} ',
                        style: context.textStyle.size14Weight400Black,
                      )
                    ],
                  ),
                ],
              ),
            ),
            AppUtils.kDivider,
            Padding(
              padding: AppUtils.kPaddingVertical16,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(SvgImage.icPrice),
                  AppUtils.kGap16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        details?.bidCash?.toInt() == 0
                            ? 'Договорная'
                            : '${details?.bidCash?.toInt().moneyFormat} ${details?.currencyDataEntity?.code}',
                        style: context.textStyle.size15Weight500Black.copyWith(fontSize: 17),
                      ),
                      AppUtils.kGap4,
                      Text(
                        details?.companyDataEntity?.paymentType ?? '',
                        style: context.textStyle.size14Weight400Black,
                      )
                    ],
                  ),
                  AppUtils.kSpacer,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'prepayment'.tr(),
                        style: context.textStyle.size14Weight400Black.copyWith(
                          color: const Color(0xFF7E7B86),
                        ),
                      ),
                      AppUtils.kGap4,
                      Text(
                        details?.companyDataEntity?.rateInterest == 0
                            ? 'Нет'
                            : '${details?.companyDataEntity?.rateInterest.toString() ?? ''} ${details?.currencyDataEntity?.code ?? ''}',
                        style: context.textStyle.size14Weight400Black,
                      )
                    ],
                  ),
                ],
              ),
            ),
            AppUtils.kDivider,
            if ((details?.comment ?? '').isNotEmpty)
              Padding(
                padding: AppUtils.kPaddingVertical16,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(SvgImage.icComment),
                    AppUtils.kGap16,
                    Expanded(
                      child: HtmlWidget(
                        details?.comment ?? '',
                        textStyle: context.textStyle.size14Weight400Black,
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      );
}

// class _CargoDetailInfoTitleWidget extends StatelessWidget {
//   const _CargoDetailInfoTitleWidget({
//     required this.isCmr,
//     required this.isT1,
//     required this.isTir,
//     required this.adr,
//   });
//
//   final bool isCmr;
//   final bool isT1;
//   final bool isTir;
//   final List<String> adr;
//
//   @override
//   Widget build(BuildContext context) => Row(
//         children: [
//           Text(
//             'detail'.tr(),
//             style: context.textStyle.regularHeadline.copyWith(
//               color: context.color.textColor,
//             ),
//           ),
//           AppUtils.kSpacer,
//           if (isCmr)
//             Padding(
//               padding: AppUtils.kPaddingL8,
//               child: Material(
//                 color: context.colorScheme.primary,
//                 borderRadius: AppUtils.kBorderRadius4,
//                 child: Padding(
//                   padding: AppUtils.kPaddingHor12Ver4,
//                   child: Text(
//                     'CMR',
//                     style: context.textStyle.regularCaption2.copyWith(
//                       color: context.colorScheme.surface,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           if (isT1)
//             Padding(
//               padding: AppUtils.kPaddingL8,
//               child: Material(
//                 color: context.colorScheme.primary,
//                 borderRadius: AppUtils.kBorderRadius4,
//                 child: Padding(
//                   padding: AppUtils.kPaddingHor12Ver4,
//                   child: Text(
//                     'T1',
//                     style: context.textStyle.regularCaption2.copyWith(
//                       color: context.colorScheme.surface,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           if (isTir)
//             Padding(
//               padding: AppUtils.kPaddingL8,
//               child: Material(
//                 color: context.colorScheme.primary,
//                 borderRadius: AppUtils.kBorderRadius4,
//                 child: Padding(
//                   padding: AppUtils.kPaddingHor12Ver4,
//                   child: Text(
//                     'TIR',
//                     style: context.textStyle.regularCaption2.copyWith(
//                       color: context.colorScheme.surface,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           if (adr.isNotEmpty)
//             Padding(
//               padding: AppUtils.kPaddingL8,
//               child: Material(
//                 color: context.colorScheme.primary,
//                 borderRadius: AppUtils.kBorderRadius4,
//                 child: Padding(
//                   padding: AppUtils.kPaddingHor12Ver4,
//                   child: Text(
//                     adr.first,
//                     style: context.textStyle.regularCaption2.copyWith(
//                       color: context.colorScheme.surface,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       );
// }
//
// class _RowInfoWidget extends StatelessWidget {
//   const _RowInfoWidget({
//     required this.title,
//     required this.info,
//     this.isLastItem = false,
//   });
//
//   final String title;
//   final String info;
//   final bool isLastItem;
//
//   @override
//   Widget build(BuildContext context) => Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 '$title:',
//                 style: context.textStyle.size15Weight500Black.copyWith(
//                   color: context.color.greyText,
//                 ),
//               ),
//               Flexible(
//                 child: SizedBox(
//                   width: context.kSize.width * 0.4,
//                   child: Text(
//                     info,
//                     style: context.textStyle.size15Weight500Black,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           if (!isLastItem) ...[
//             AppUtils.kGap12,
//             AppUtils.kDivider,
//             AppUtils.kGap12,
//           ],
//         ],
//       );
// }
