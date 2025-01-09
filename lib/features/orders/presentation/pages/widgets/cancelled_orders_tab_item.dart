import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/bottom_loading/bottom_loading_widget.dart';
import '../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../bloc/orders_bloc.dart';
import '../orders_empty_page.dart';
import 'order_item.dart';

part '../mixins/cancel_tab_mixin.dart';

class CancelledOrdersTabItem extends StatefulWidget {
  const CancelledOrdersTabItem({super.key});

  @override
  State<CancelledOrdersTabItem> createState() => _CancelledOrdersTabItemState();
}

class _CancelledOrdersTabItemState extends State<CancelledOrdersTabItem> with CancelTabMixin {
  @override
  Widget build(BuildContext context) => BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) => state.cancelledOrders.isEmpty && !state.cancelledOrdersStatus.isLoading
            ? const OrdersEmptyPage()
            : ModalProgressHUD(
                inAsyncCall: state.cancelledOrdersStatus.isLoading,
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
                          onTap: () {},
                          order: state.cancelledOrders[index],
                          tabIndex: state.tabIndex,
                        ),
                        separatorBuilder: (_, index) => AppUtils.kGap12,
                        itemCount: state.cancelledOrders.length,
                      ),
                    ),
                    if (state.cancelledOrdersStatus.isPaginationLoading) ...[
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
