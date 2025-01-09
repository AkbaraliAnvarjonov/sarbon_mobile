part of '../widgets/cancelled_orders_tab_item.dart';

mixin CancelTabMixin on State<CancelledOrdersTabItem> {
  late final ScrollController scrollController;
  late final OrdersBloc ordersBloc;

  @override
  void initState() {
    scrollController = ScrollController();
    ordersBloc = context.read<OrdersBloc>();
    scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    ordersBloc.add(const FetchCancelledOrdersEvent());
    await Future<void>.delayed(const Duration(seconds: 2));
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll == currentScroll &&
        !ordersBloc.state.cancelledOrdersStatus.isLoading &&
        !ordersBloc.state.cancelledOrdersStatus.isPaginationLoading) {
      if (ordersBloc.state.cancelledOrders.length ==
          ordersBloc.state.cancelledOrdersCount) {
        return;
      }
      ordersBloc.add(const FetchCancelledOrdersPaginationEvent());
    }
  }
}
