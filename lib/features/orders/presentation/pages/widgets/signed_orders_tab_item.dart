import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/bottom_loading/bottom_loading_widget.dart';
import '../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../core/widgets/inputs/check_box_widget.dart';
import '../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../core/widgets/rating/rating_bar_widget.dart';
import '../../../../../router/app_routes.dart';
import '../../bloc/orders_bloc.dart';
import '../args/order_detail_page_argument.dart';
import '../orders_empty_page.dart';
import 'accident_button.dart';
import 'custom_step_widget.dart';
import 'order_item.dart';
import 'warning_dialog.dart';

part '../mixins/signed_tab_mixin.dart';

part 'choose_status_widget.dart';

part 'give_feedback_and_rating_widget.dart';

class SignedOrdersTabItem extends StatefulWidget {
  const SignedOrdersTabItem({super.key});

  @override
  State<SignedOrdersTabItem> createState() => _SignedOrdersTabItemState();
}

class _SignedOrdersTabItemState extends State<SignedOrdersTabItem> with SignedTabMixin {
  @override
  Widget build(BuildContext context) => BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) => state.finishedOrders.isEmpty && !state.signedOrdersStatus.isLoading
            ? const OrdersEmptyPage()
            : ModalProgressHUD(
                inAsyncCall: state.signedOrdersStatus.isLoading,
                child: CustomScrollView(
                  controller: scrollController,
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [
                    CupertinoSliverRefreshControl(
                      onRefresh: _refresh,
                    ),
                    SliverSafeArea(
                      minimum: AppUtils.kPaddingVertical16,
                      sliver: SliverList.separated(
                        itemBuilder: (_, index) => OrderItem(
                          selectedStatus: (state.finishedOrders[index].indicateStatus ?? '').isNotEmpty
                              ? (state.finishedOrders[index].indicateStatus ?? '')
                              : state.indicateStatus[index]?.last ?? '',
                          onTap: () async {
                            await context
                                .pushNamed(
                              Routes.orderDetails,
                              extra: OrderDetailsPageArgument(
                                cargoId: state.finishedOrders[index].cargoId ?? '',
                                orderId: state.finishedOrders[index].guid ?? '',
                                carType: state.finishedOrders[index].carType ?? '',
                              ),
                            )
                                .then(
                              (value) {
                                if (value is bool && value) {
                                  if (!context.mounted) return;
                                  context.read<OrdersBloc>().add(
                                        SendFinishedOrderEvent(
                                          orderId: state.finishedOrders[index].guid ?? '',
                                          carType: state.finishedOrders[index].carType ?? '',
                                        ),
                                      );
                                } else {
                                  if (!context.mounted) return;
                                  context.read<OrdersBloc>().add(
                                        const FetchSignedOrdersEvent(),
                                      );
                                }
                              },
                            );
                          },
                          order: state.finishedOrders[index],
                          tabIndex: state.tabIndex,
                          showStatusOnTap: () async {
                            context.read<OrdersBloc>().add(
                                  ChangeOnTapedIndexEvent(index: index),
                                );
                            await customModalBottomSheet<bool>(
                              context: context,
                              builder: (_, controller) => BlocProvider.value(
                                value: context.read<OrdersBloc>(),
                                child: _ChooseStatusWidget(
                                  itemIndex: index,
                                  orderId: state.finishedOrders[index].guid ?? '',
                                  state: state,
                                  carType: state.finishedOrders[index].carType ?? '',
                                ),
                              ),
                              enableDrag: false,
                              isScrollControlled: true,
                            ).then(
                              (value) {
                                if (value != null && value) {
                                  customModalBottomSheet<bool>(
                                    context: rootNavigatorKey.currentContext!,
                                    builder: (_, controller) => BlocProvider.value(
                                      value: context.read<OrdersBloc>(),
                                      child: const _GiveFeedbackAndRatingWidget(),
                                    ),
                                    enableDrag: false,
                                    isScrollControlled: true,
                                  ).then(
                                    (value) {
                                      if (value is bool && value) {
                                        if (!context.mounted) return;
                                        context.read<OrdersBloc>().add(
                                              SendFinishedOrderEvent(
                                                orderId: state.finishedOrders[index].guid ?? '',
                                                carType: state.finishedOrders[index].carType ?? '',
                                              ),
                                            );
                                      }
                                    },
                                  );
                                }
                                if (!context.mounted) return;
                                context.read<OrdersBloc>().add(
                                      const FetchSignedOrdersEvent(),
                                    );
                              },
                            );
                          },
                        ),
                        separatorBuilder: (_, index) => AppUtils.kGap12,
                        itemCount: state.finishedOrders.length,
                      ),
                    ),
                    if (state.newOrdersStatus.isPaginationLoading) ...[
                      const SliverToBoxAdapter(
                        child: BottomLoadingIndicatorWidget(),
                      ),
                      AppUtils.kSliverGap16,
                    ],
                  ],
                ),
              ),
      );
}
