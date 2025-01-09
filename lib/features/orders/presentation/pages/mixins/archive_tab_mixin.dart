part of '../widgets/archived_orders_tab_item.dart';

mixin ArchiveTabMixin on State<ArchiveOrdersTabItem> {
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
    ordersBloc.add(const FetchArchivedOrdersEvent());
    await Future<void>.delayed(const Duration(seconds: 2));
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll == currentScroll &&
        !ordersBloc.state.archivedOrdersStatus.isLoading &&
        !ordersBloc.state.archivedOrdersStatus.isPaginationLoading) {
      if (ordersBloc.state.archivedOrders.length ==
          ordersBloc.state.archivedOrdersCount) {
        return;
      }
      ordersBloc.add(const FetchArchivedOrdersPaginationEvent());
    }
  }
}
