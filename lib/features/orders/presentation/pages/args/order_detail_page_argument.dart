class OrderDetailsPageArgument {
  const OrderDetailsPageArgument({
    required this.orderId,
    required this.cargoId,
    required this.carType,
    this.isForDeal = false,
  });

  final String orderId;
  final String cargoId;
  final String carType;
  final bool? isForDeal;
}
