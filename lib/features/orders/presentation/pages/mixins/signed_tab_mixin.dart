part of '../widgets/signed_orders_tab_item.dart';

mixin SignedTabMixin on State<SignedOrdersTabItem> {
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
    ordersBloc.add(const FetchSignedOrdersEvent());
    await Future<void>.delayed(const Duration(seconds: 2));
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll == currentScroll &&
        !ordersBloc.state.signedOrdersStatus.isLoading &&
        !ordersBloc.state.signedOrdersStatus.isPaginationLoading) {
      if (ordersBloc.state.finishedOrders.length ==
          ordersBloc.state.finishedOrdersCount) {
        return;
      }
      ordersBloc.add(const FetchSignedOrdersPaginationEvent());
    }
  }
}
