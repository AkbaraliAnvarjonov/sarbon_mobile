part of '../orders_page.dart';

mixin OrdersMixin on State<OrdersPage> {
  late final TabController _tabController;

  void initControllers(TickerProvider vsync) {
    _tabController = TabController(
      length: 4,
      vsync: vsync,
    );
  }

  void disposeControllers() {
    _tabController.dispose();
  }
}
