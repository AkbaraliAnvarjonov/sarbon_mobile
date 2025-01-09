part of '../widgets/deal_orders_tab_item.dart';

mixin DealTabMixin on State<DealTabItem> {
  late final ScrollController scrollController;
  late final OrdersBloc ordersBloc;
  final DeBouncer deBouncer = DeBouncer(milliseconds: 100);

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
    ordersBloc.add(const FetchNewOrdersEvent());
    await Future<void>.delayed(const Duration(seconds: 2));
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    final bool isPagination =
        maxScroll - (context.kSize.width * 3 / 2) < currentScroll;
    deBouncer.run(() {
      if (isPagination &&
          !ordersBloc.state.newOrdersStatus.isLoading &&
          !ordersBloc.state.newOrdersStatus.isPaginationLoading) {
        if (ordersBloc.state.newOrders.length ==
            ordersBloc.state.newOrdersCount) {
          return;
        }
        ordersBloc.add(const FetchNewOrdersPaginationEvent());
      }
    });
  }
}
