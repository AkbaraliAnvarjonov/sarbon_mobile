import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/debaouncer/debouncer.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/bottom_loading/bottom_loading_widget.dart';
import '../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../router/app_routes.dart';
import '../../bloc/orders_bloc.dart';
import '../args/order_detail_page_argument.dart';
import '../orders_empty_page.dart';
import 'order_item.dart';

part '../mixins/deal_tab_mixin.dart';

class DealTabItem extends StatefulWidget {
  const DealTabItem({super.key});

  @override
  State<DealTabItem> createState() => _DealTabItemState();
}

class _DealTabItemState extends State<DealTabItem> with DealTabMixin {
  @override
  Widget build(BuildContext context) => BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          print("state.newOrders.isEmpty: ${state.newOrders.isEmpty}");
          print("state.newOrdersStatus: ${state.newOrdersStatus}");
          print('----------------');
          return state.newOrders.isEmpty && !state.newOrdersStatus.isLoading
              ? const OrdersEmptyPage()
              : ModalProgressHUD(
                  inAsyncCall: state.newOrdersStatus.isLoading,
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
                            selectedStatus: '',
                            onTap: () async {
                              await context
                                  .pushNamed(
                                Routes.orderDetails,
                                extra: OrderDetailsPageArgument(
                                  cargoId: state.newOrders[index].cargoId ?? '',
                                  orderId: state.newOrders[index].guid ?? '',
                                  carType: state.newOrders[index].carType ?? '',
                                  isForDeal: true,
                                ),
                              )
                                  .then(
                                (value) {
                                  if (value is bool && value) {
                                    if (!context.mounted) return;
                                    context.read<OrdersBloc>().add(
                                          SendDealOrderEvent(
                                            orderId: state.newOrders[index].guid ?? '',
                                            cargoId: state.newOrders[index].cargoId ?? '',
                                            carType: state.newOrders[index].carType ?? '',
                                            acceptedOffers: state.newOrders[index].acceptedOffers ?? 0,
                                            provisions:
                                                (state.newOrders[index].provisions?.contains('approve_from_driver') ??
                                                        false)
                                                    ? ['performed']
                                                    : ['approve_by_customer', 'new'],
                                          ),
                                        );
                                  } else if (value is bool && !value) {
                                    if (!context.mounted) return;
                                    context.read<OrdersBloc>().add(
                                          PutCancelOrderEvent(
                                            orderId: state.newOrders[index].guid ?? '',
                                            carType: state.newOrders[index].carType ?? '',
                                          ),
                                        );
                                  } else {
                                    if (!context.mounted) return;
                                    context.read<OrdersBloc>().add(
                                          const OrdersTabChangedEvent(
                                            tabIndex: 0,
                                          ),
                                        );
                                  }
                                },
                              );
                            },
                            order: state.newOrders[index],
                            tabIndex: state.tabIndex,
                          ),
                          separatorBuilder: (_, index) => AppUtils.kGap12,
                          itemCount: state.newOrders.length,
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
                );
        },
      );
}
