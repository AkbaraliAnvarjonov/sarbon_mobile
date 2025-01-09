import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/bottom_loading/bottom_loading_widget.dart';
import '../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../bloc/orders_bloc.dart';
import '../orders_empty_page.dart';
import 'order_item.dart';

part '../mixins/archive_tab_mixin.dart';

class ArchiveOrdersTabItem extends StatefulWidget {
  const ArchiveOrdersTabItem({super.key});

  @override
  State<ArchiveOrdersTabItem> createState() => _ArchiveOrdersTabItemState();
}

class _ArchiveOrdersTabItemState extends State<ArchiveOrdersTabItem>
    with ArchiveTabMixin {
  @override
  Widget build(BuildContext context) => BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) =>
            state.archivedOrders.isEmpty && !state.archivedOrdersStatus.isLoading
                ? const OrdersEmptyPage()
                : ModalProgressHUD(
                    inAsyncCall: state.archivedOrdersStatus.isLoading,
                    child: CustomScrollView(
                      controller: scrollController,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
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
                              order: state.archivedOrders[index],
                              tabIndex: state.tabIndex,
                            ),
                            separatorBuilder: (_, index) => AppUtils.kGap12,
                            itemCount: state.archivedOrders.length,
                          ),
                        ),
                        if (state.archivedOrdersStatus.isPaginationLoading) ...[
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
