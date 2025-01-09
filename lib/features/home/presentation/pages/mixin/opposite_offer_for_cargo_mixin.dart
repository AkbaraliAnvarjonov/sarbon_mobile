part of '../opposite_offer_for_cargo/opposite_offer_page.dart';

mixin OppositeOfferMixin on State<OppositeOfferPage> {
  late final TextEditingController driverCashController;
  late final TextEditingController prepaymentAmountController;
  late final TextEditingController commentController;
  late AnimationController animationController;

  late final FocusNode driverCommentFocusNode;

  void initialState(TickerProvider vsync) {
    initControllers();
    driverCashController.text = widget.oppositeOfferArgs.currency;
    context.read<OppositeOfferBloc>().add(
          ChangeDriverCashEvent(
            driverCash: driverCashController.text,
          ),
        );
    context.read<OppositeOfferBloc>()
      ..add(
        const GetVehicleTypesEvent(),
      )
      ..add(
        const SelectPaymentMethodEvent(
          status: 'payment_after_completed',
        ),
      );
    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );
  }

  void initControllers() {
    driverCashController = TextEditingController();
    prepaymentAmountController = TextEditingController();
    commentController = TextEditingController();
    driverCommentFocusNode = FocusNode();
  }

  void disposeControllers() {
    prepaymentAmountController.dispose();
    commentController.dispose();
    driverCashController.dispose();
    driverCommentFocusNode.dispose();
  }
}
