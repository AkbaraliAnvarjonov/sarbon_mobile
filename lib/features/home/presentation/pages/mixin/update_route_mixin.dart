part of '../route/sub_pages/update_route/widgets/update_route_item_widget.dart';

mixin UpdateRouteMixin on State<UpdateRouteItemWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController carryingCapacityController =
      TextEditingController();
  final TextEditingController volumeController = TextEditingController();
  late UpdateRouteBloc updateRouteBloc;

  @override
  void initState() {
    updateRouteBloc = context.read<UpdateRouteBloc>();
    setInitialValue();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setInitialValue() {
    carryingCapacityController.text = widget.route.capacity;
    volumeController.text = widget.route.volume;
    updateRouteBloc
      ..add(
        SelectFinalAddressesEvent(address: widget.route.fromAddress),
      )
      ..add(
        SelectInitialAddressesEvent(address: widget.route.toAddress),
      )
      ..add(
        SelectDateEvent(
          date: widget.route.date.substring(
            0,
            widget.route.date.indexOf(' '),
          ),
        ),
      );
  }
}
