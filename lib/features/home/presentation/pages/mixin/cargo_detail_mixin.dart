part of '../cargo_detail/cargo_detail_page.dart';

mixin CargoDetailMixin on State<CargoDetailPage> {
  @override
  void initState() {
    context.read<CargoDetailsBloc>().add(GetCargoDetailsEvent(guid: widget.cargoId));
    context.read<CargoDetailsBloc>().add(const GetDriverOrdersEvent());
    super.initState();
  }
}
