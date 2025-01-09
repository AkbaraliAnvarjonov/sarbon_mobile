part of '../my_cars/my_cars_page.dart';

mixin MyCarsMixin on State<MyCarsPage> {
  late TabController tabController;
  late final ScrollController activeScrollController;
  late final ScrollController inActiveScrollController;
  late final MyCarsBloc carsBloc;
  final DeBouncer deBouncer = DeBouncer(milliseconds: 100);

  @override
  void initState() {
    activeScrollController = ScrollController();
    inActiveScrollController = ScrollController();
    carsBloc = context.read<MyCarsBloc>();
    activeScrollController.addListener(_onActiveScroll);
    inActiveScrollController.addListener(_onInactiveScroll);
    super.initState();
  }

  void initControllers(TickerProvider tickerProvider) {
    tabController = TabController(length: 2, vsync: tickerProvider);
  }

  @override
  void dispose() {
    activeScrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  void _onActiveScroll() {
    final maxScroll = activeScrollController.position.maxScrollExtent;
    final currentScroll = activeScrollController.offset;
    final bool isPagination = maxScroll - (context.kSize.width * 3 / 2) < currentScroll;
    deBouncer.run(() {
      if (isPagination && !carsBloc.state.status.isLoading && !carsBloc.state.activeCarsPagination.isLoading) {
        if (carsBloc.state.activeCars!.length == carsBloc.state.activeCarsCount) {
          return;
        }
        carsBloc.add(const FetchActiveCarsPaginationEvent());
      }
    });
  }

  void _onInactiveScroll() {
    final maxScroll = inActiveScrollController.position.maxScrollExtent;
    final currentScroll = inActiveScrollController.offset;
    final bool isPagination = maxScroll - (context.kSize.width * 3 / 2) < currentScroll;
    deBouncer.run(() {
      if (isPagination && !carsBloc.state.status.isLoading && !carsBloc.state.inActiveCarsPagination.isLoading) {
        if (carsBloc.state.inActiveCars!.length == carsBloc.state.inActiveCarsCount) {
          return;
        }
        carsBloc.add(const FetchInActiveCarsPaginationEvent());
      }
    });
  }
}
