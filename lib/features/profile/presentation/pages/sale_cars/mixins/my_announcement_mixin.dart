part of '../sale_cars_sub_pages/my_announcement/my_announcement_page.dart';

mixin MyAnnouncementMixin on State<MyAnnouncementPage> {
  late final PageController _pageController;
  late final TabController _tabController;

  void initControllers(TickerProvider vsync) {
    _tabController = TabController(
      length: 2,
      vsync: vsync,
    );
    _pageController = PageController(viewportFraction: 0.9);
  }

  void disposeControllers() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
