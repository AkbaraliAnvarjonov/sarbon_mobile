part of '../widgets/all_cargos_widget.dart';

mixin CargosMixin on State<AllCargosWidget> {
  late final HomeBloc homeBloc;
  final DeBouncer deBouncer = DeBouncer(milliseconds: 150);

  @override
  void initState() {
    homeBloc = context.read<HomeBloc>();
    widget.scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = widget.scrollController.position.maxScrollExtent;
    final currentScroll = widget.scrollController.offset;
    final bool isPagination = maxScroll - 50 < currentScroll;
    deBouncer.run(() {
      if (isPagination && !homeBloc.state.status.isLoading && !homeBloc.state.status.isPaginationLoading) {
        if (homeBloc.state.cargoItems.length >= homeBloc.state.cargosCount) {
          if (homeBloc.state.cargoItemsWithoutFilter.length >= homeBloc.state.cargosWithoutFilterCount &&
              homeBloc.state.cargosWithoutFilterCount != 0) {
            return;
          }
          if (localSource.vehicleId.isNotEmpty) {
            homeBloc.add(const FetchCargosWithoutFilterPaginationEvent());
          }
          return;
        }
        homeBloc.add(const FetchCargosPaginationEvent());
      }
    });
  }
}
