import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/icons_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/rating/rating_bar_widget.dart';
import '../../../domain/entities/get_orders_response_entity.dart';
import 'order_item_info_widget.dart';

part 'order_item_status_widget.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.order,
    required this.onTap,
    required this.tabIndex,
    required this.selectedStatus,
    this.showStatusOnTap,
  });

  final OrderItemEntity? order;
  final VoidCallback onTap;
  final int tabIndex;
  final VoidCallback? showStatusOnTap;
  final String selectedStatus;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Material(
          color: selectedStatus == 'breaking' || selectedStatus == 'road_accident'
              ? context.color.pink100
              : context.colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppUtils.kGap12,
              Padding(
                padding: AppUtils.kPaddingHorizontal16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (order?.from ?? '').cutString(13),
                              style: context.textStyle.regularHeadline.copyWith(
                                color: context.color.textColor,
                              ),
                            ),
                            Text(
                              order?.countryCodeFrom ?? '',
                              style: context.textStyle.regularFootnote.copyWith(
                                color: context.color.gray700,
                              ),
                            ),
                          ],
                        ),
                        AppUtils.kGap8,
                        Icon(
                          Icons.arrow_forward,
                          color: context.colorScheme.onSurface,
                          size: 20,
                        ),
                        AppUtils.kGap8,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (order?.to ?? '').cutString(13),
                              style: context.textStyle.regularHeadline.copyWith(
                                color: context.color.textColor,
                              ),
                            ),
                            Text(
                              order?.countryCodeTo ?? '',
                              style: context.textStyle.regularFootnote.copyWith(
                                color: context.color.gray700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppUtils.kGap4,
                    Text(
                      order?.distance ?? '',
                      // <-- Get from Yandex map (Mobile side not backend)
                      style: context.textStyle.bodyFootnote.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              AppUtils.kGap4,
              AppUtils.kDivider,
              AppUtils.kGap8,
              OrderItemInfoWidget(
                type: 'weight'.tr(),
                info: '${order?.weight} т',
              ),
              AppUtils.kGap4,
              OrderItemInfoWidget(
                type: 'volume'.tr(),
                info: '${order?.volumeM3} м3',
              ),
              AppUtils.kGap4,
              Padding(
                padding: AppUtils.kPaddingHorizontal16,
                child: Row(
                  children: [
                    RatingBarWidget(
                      rating: (order?.rating ?? 0).toDouble(),
                    ),
                    AppUtils.kGap4,
                    Text(
                      getCompanyFullName(
                        aliasName: order?.companyDataEntity?.aliasName ?? '',
                        companyType: order?.companyDataEntity?.companyType ?? [],
                        companyName: order?.companyDataEntity?.name ?? '',
                      ),
                      style: context.textStyle.bodyCaption2.copyWith(
                        color: context.color.greyText,
                      ),
                    ),
                  ],
                ),
              ),
              AppUtils.kGap4,
              AppUtils.kDivider,
              AppUtils.kGap4,
              Padding(
                padding: AppUtils.kPaddingHorizontal16,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      SvgImage.icUser2,
                      height: 16,
                      width: 16,
                    ),
                    AppUtils.kGap4,
                    Text(
                      order?.clientName ?? '',
                      style: context.textStyle.size14Weight500Black.copyWith(
                        color: context.color.darkGrey3,
                      ),
                    ),
                  ],
                ),
              ),
              AppUtils.kGap8,
              Padding(
                padding: AppUtils.kPaddingHorizontal16,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      SvgImage.icTruck,
                      height: 16,
                      width: 16,
                    ),
                    AppUtils.kGap4,
                    Text(
                      '${order?.carType ?? ''}, '
                      '${order?.vehicleDataEntity?.carNumber ?? ''}',
                      style: context.textStyle.size14Weight500Black.copyWith(
                        color: context.color.darkGrey3,
                      ),
                    ),
                  ],
                ),
              ),
              AppUtils.kGap8,
              AppUtils.kDivider,
              if (tabIndex >= 1) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: AppUtils.kPaddingHor16Ver12,
                      child: Text(
                        order?.request ?? false
                            ? 'request'.tr()
                            : '${order?.bidCash?.toInt().moneyFormat} '
                                '${order?.currencyDataEntity?.code}',
                        style: context.textStyle.regularHeadline.copyWith(
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: tabIndex == 1 || tabIndex == 3,
                      child: OrderItemStatusWidget(
                        title: getOrderStatus(
                          whoCancellation:
                              (order?.whoCancellation?.isNotEmpty ?? false) ? (order?.whoCancellation?[0] ?? '') : '',
                          status: (order?.provisions ?? []).contains('approve_from_driver')
                              ? 'approve_by_driver'
                              : (order?.provisions ?? []).contains('new_proposal_from_director')
                                  ? 'new_proposal_from_director'
                                  : 'approve_from_customer',
                          tabIndex: tabIndex,
                          selectedStatus: selectedStatus,
                        ),
                        tabIndex: tabIndex,
                        isNewOffer: ((order?.provisions ?? []).contains('approve_from_driver')
                                ? 'approve_by_driver'
                                : 'approve_from_customer') !=
                            'approve_by_customer',
                        showStatusOnTap: showStatusOnTap,
                      ),
                    ),
                  ],
                ),
              ] else ...[
                Padding(
                  padding: AppUtils.kPaddingHor16Ver12,
                  child: Text(
                    order?.request ?? false
                        ? 'request'.tr()
                        : '${order?.bidCash?.toInt().moneyFormat} '
                            '${order?.currencyDataEntity?.code}',
                    style: context.textStyle.regularHeadline.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
                OrderItemStatusWidget(
                  title: getOrderStatus(
                    whoCancellation:
                        (order?.whoCancellation?.isNotEmpty ?? false) ? (order?.whoCancellation?[0] ?? '') : '',
                    status: (order?.provisions ?? []).contains('approve_from_driver')
                        ? 'approve_by_driver'
                        : (order?.provisions ?? []).contains('new_proposal_from_director')
                            ? 'new_proposal_from_director'
                            : 'approve_from_customer',
                    tabIndex: tabIndex,
                    selectedStatus: selectedStatus,
                  ),
                  tabIndex: tabIndex,
                  isNewOffer: ((order?.provisions ?? []).contains('approve_from_driver')
                          ? 'approve_by_driver'
                          : 'approve_by_customer') !=
                      'approve_by_customer',
                  showStatusOnTap: showStatusOnTap,
                ),
              ],
            ],
          ),
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

String getOrderStatus({
  required String? status,
  required int tabIndex,
  required String selectedStatus,
  required String? whoCancellation,
}) {
  print('mana status: $status');
  return tabIndex == 0
      ? status == 'approve_from_customer'
          ? 'we_are_waiting_for_approval_from_customer'.tr()
          : status == 'new_proposal_from_director'
              ? 'new_proposal_from_director'.tr()
              : 'new_proposal_from_customer'.tr()
      : tabIndex == 1
          ? selectedStatus
          : tabIndex == 2
              ? 'in_archive'.tr()
              : whoCancellation == 'customer'
                  ? 'customer_cancellation'
                  : 'driver_cancellation';
}
