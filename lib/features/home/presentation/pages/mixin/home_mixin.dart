part of '../home_page.dart';

mixin HomeMixin on State<HomePage> {
  late final ScrollController scrollController;

  @override
  void initState() {
    context.read<HomeBloc>().add(const InitialEvent());
    context.read<HomeBloc>().add(const GetAllCargosEvent());
    context.read<HomeBloc>().add(const FetchCargoTypesEvent());
    context.read<HomeBloc>().add(const GetVehicleType());
    Future.delayed(const Duration(minutes: 2), () {
      if (!mounted) return;
      context.read<HomeBloc>().add(const GetVehicleType());
    });
    scrollController = ScrollController();
    super.initState();
  }
}
