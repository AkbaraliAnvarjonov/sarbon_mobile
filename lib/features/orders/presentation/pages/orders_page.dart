import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extension.dart';
import '../bloc/orders_bloc.dart';
import 'widgets/archived_orders_tab_item.dart';
import 'widgets/cancelled_orders_tab_item.dart';
import 'widgets/deal_orders_tab_item.dart';
import 'widgets/orders_tab_bar_widget.dart';
import 'widgets/signed_orders_tab_item.dart';

part 'mixins/orders_mixin.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with OrdersMixin, SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    initControllers(this);
    context.read<OrdersBloc>().add(const FetchNewOrdersEvent());
    context.read<OrdersBloc>().add(const FetchSignedOrdersEvent());
    addListener();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void addListener() {
    _tabController.addListener(() {
      context.read<OrdersBloc>().add(OrdersTabChangedEvent(tabIndex: _tabController.index));
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposeControllers();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<OrdersBloc, OrdersState>(
        listenWhen: (previous, current) => previous.tabIndex != current.tabIndex,
        listener: (_, state) {
          if (state.tabIndex == 0) {
            context.read<OrdersBloc>().add(const FetchNewOrdersEvent());
          } else if (state.tabIndex == 1) {
            context.read<OrdersBloc>().add(const FetchSignedOrdersEvent());
          } else if (state.tabIndex == 2) {
            context.read<OrdersBloc>().add(const FetchArchivedOrdersEvent());
          } else if (state.tabIndex == 3) {
            context.read<OrdersBloc>().add(const FetchCancelledOrdersEvent());
          }
          _tabController.animateTo(state.tabIndex);
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text('my_orders'.tr()),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: OrdersTabBarWidget(
                index: state.tabIndex,
                tabController: _tabController,
                newOrdersCount: state.newOrdersCount,
                signedOrdersCount: state.finishedOrdersCount,
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: const [
              DealTabItem(),
              SignedOrdersTabItem(),
              ArchiveOrdersTabItem(),
              CancelledOrdersTabItem(),
            ],
          ),
        ),
      );
}
