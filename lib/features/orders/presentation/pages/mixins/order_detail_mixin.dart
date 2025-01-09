part of '../order_detail/order_detail_page.dart';

mixin OrderDetailMixin on State<OrderDetailPage> {
  @override
  void initState() {
    context.read<OrderDetailsBloc>().add(
          GetOrderDetailsEvent(
            guid: widget.args?.orderId ?? '',
            cargoId: widget.args?.cargoId ?? '',
          ),
        );
    super.initState();
  }
}
