part of '../cargo_detail/cargo_detail_page.dart';

mixin CargoDetailForUnregisterUserMixin
    on State<CargoDetailForUnregisterUserPage> {
  @override
  void initState() {
    context
        .read<CargoDetailsBloc>()
        .add(GetCargoDetailsEvent(guid: widget.cargoId));
    super.initState();
  }
}
