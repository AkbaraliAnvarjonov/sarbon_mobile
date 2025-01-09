part of '../widgets/news_widget.dart';

mixin NewsMixin on State<NewsWidget>{
  late final ScrollController scrollController;
  late final HomeBloc homeBloc;
  final DeBouncer deBouncer = DeBouncer(milliseconds: 100);

  @override
  void initState() {
    scrollController = ScrollController();
    homeBloc = context.read<HomeBloc>();
    scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    final bool isPagination =
        maxScroll - (context.kSize.width * 3 / 2) < currentScroll;
    deBouncer.run(() {
      if (isPagination &&
          !homeBloc.state.status.isLoading &&
          !homeBloc.state.status.isPaginationLoading) {
        if (homeBloc.state.news.length ==
            homeBloc.state.cargosCount) {
          return;
        }
        // homeBloc.add(const FetchCargosPaginationEvent());
      }
    });
  }
}

