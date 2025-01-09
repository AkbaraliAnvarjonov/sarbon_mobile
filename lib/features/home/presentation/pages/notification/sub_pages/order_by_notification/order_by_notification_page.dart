import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../constants/icons_constants.dart';
import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../core/widgets/rating/rating_bar_widget.dart';
import '../../../../../domain/entities/notification/get_order_by_notification_entity/get_order_by_notification_entity.dart';
import '../../../../bloc/notification/order_from_notification/order_for_notification_bloc.dart';

part 'widgets/order_for_deal_button.dart';

part 'widgets/order_direction_short_info_widget.dart';

part 'widgets/order_addresses_point_widget.dart';

part 'widgets/order_direction_notification_widget.dart';

part 'widgets/order_detail_info_widget.dart';

part 'widgets/send_comment_widget.dart';

part 'widgets/order_company_info_widget.dart';

class OrderByNotificationPage extends StatelessWidget {
  const OrderByNotificationPage({
    super.key,
    required this.orderId,
  });

  final String orderId;

  @override
  Widget build(BuildContext context) =>
      BlocListener<OrderForNotificationBloc, OrderForNotificationState>(
        listenWhen: (previous, current) =>
            previous.putOrderStatus != current.putOrderStatus,
        listener: (context, state) {
          if (state.putOrderStatus.isSuccess) {
            context.pop(true);
          }
        },
        child: BlocBuilder<OrderForNotificationBloc, OrderForNotificationState>(
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              title: Text(
                'cargo_details'.tr(),
              ),
              titleSpacing: 0,
            ),
            body: state.getOrderDetailsStatus.isLoading ||
                    state.addressStatus.isLoading
                ? const Center(child: CircularProgressIndicator.adaptive())
                : state.finallyAddresses.isNotEmpty
                    ? CustomScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        slivers: [
                          SliverSafeArea(
                            minimum: AppUtils.kPaddingAll16,
                            sliver: SliverMainAxisGroup(
                              slivers: [
                                SliverList.list(
                                  children: [
                                    _OrderDirectionShortInfoWidget(
                                      details: state.getOrderDetails,
                                    ),
                                    AppUtils.kGap8,
                                    _OrderAddressesPointWidget(
                                      addresses: state.finallyAddresses,
                                    ),
                                    AppUtils.kGap16,
                                    _OrderDetailInfoTitleWidget(
                                      isCmr:
                                          state.getOrderDetails?.cmr ?? false,
                                      isT1: state.getOrderDetails?.t1 ?? false,
                                      isTir:
                                          state.getOrderDetails?.tir ?? false,
                                      adr: state.getOrderDetails?.permission ??
                                          [],
                                    ),
                                    AppUtils.kGap8,
                                    _OrderDetailInfoWidget(
                                      details: state.getOrderDetails,
                                    ),
                                    AppUtils.kGap16,
                                    Text(
                                      'comment'.tr(),
                                      style: context.textStyle.regularHeadline
                                          .copyWith(
                                        color: context.color.textColor,
                                      ),
                                    ),
                                    AppUtils.kGap8,
                                    _SendCommentWidget(
                                      comment:
                                          state.getOrderDetails?.comment ?? '',
                                    ),
                                    AppUtils.kGap16,
                                    Text(
                                      'company'.tr(),
                                      style: context.textStyle.regularHeadline
                                          .copyWith(
                                        color: context.color.textColor,
                                      ),
                                    ),
                                    AppUtils.kGap8,
                                    _OrderCompanyInfoWidget(
                                      companyInfo: state
                                          .getOrderDetails?.companyDataEntity,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Text(
                          'Empty',
                          style: context.textStyle.size14Weight400Black,
                        ),
                      ),
            bottomNavigationBar: state.getOrderDetailsStatus.isLoading ||
                    state.addressStatus.isLoading
                ? null
                : state.getOrderDetails?.provisions == 'performed'
                    ? null
                    : const _OrderForDealButton(),
          ),
        ),
      );
}
