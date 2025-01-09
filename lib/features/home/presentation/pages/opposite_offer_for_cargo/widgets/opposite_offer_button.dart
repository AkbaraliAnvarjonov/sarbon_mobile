part of '../opposite_offer_page.dart';

class _OppositeOfferButton extends StatelessWidget {
  const _OppositeOfferButton({
    required this.cargoGuid,
    required this.commentController,
    required this.prepaymentAmountController,
    required this.driverCashController,
    required this.noHaggling,
    required this.userId2,
    required this.firmId,
  });

  final String cargoGuid;
  final String userId2;
  final String firmId;
  final TextEditingController commentController;
  final TextEditingController prepaymentAmountController;
  final TextEditingController driverCashController;
  final bool noHaggling;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: AppUtils.kDecorationWithShadow,
        child: BlocBuilder<OppositeOfferBloc, OppositeOfferState>(
          builder: (context, state) => SafeArea(
            minimum: AppUtils.kPaddingAll16,
            child: ElevatedButton(
              onPressed: checkRequiredFields(
                state: state,
                noHaggling: noHaggling,
              )
                  ? () async {
                      context.read<OppositeOfferBloc>().add(
                            ButtonPressedEvent(
                              userId2: userId2,
                              firmId: firmId,
                              guid: cargoGuid,
                              driverComment: commentController.text.trim(),
                              selectedVehicleId:
                                  state.selectedVehicleType?.guid ?? '',
                              selectedVehicleName:
                                  state.selectedVehicleType?.name ?? '',
                              prepaymentAmount: parseMethod(
                                prepaymentAmountController.text,
                              ),
                              driverCash: parseMethod(
                                driverCashController.text,
                              ),
                            ),
                          );
                    }
                  : null,
              child: Text('send'.tr()),
            ),
          ),
        ),
      );
}

bool checkRequiredFields({
  required OppositeOfferState state,
  required bool noHaggling,
}) {
  final int driverCash = int.tryParse(state.driverCash) ?? -1;
  final int prepaymentCash = int.tryParse(state.prepaymentCash) ?? -1;
  if (!noHaggling) {
    if (state.selectedVehicleType == null ||
        state.selectedCurrency == null ||
        state.driverCash.isEmpty) {
      return false;
    } else if ((state.paymentMethodStatus == 'prepayment') &&
        state.prepaymentCash.isEmpty) {
      return false;
    } else if ((state.paymentMethodStatus == 'prepayment') &&
        driverCash - prepaymentCash < 0) {
      return false;
    }
  } else if (noHaggling) {
    if (state.selectedVehicleType == null) {
      return false;
    } else if (state.paymentMethodStatus == 'prepayment') {
      if(state.prepaymentCash.isEmpty ||
          state.selectedCurrency == null){
        return false;
      }
    }
  }
  return true;
}

int parseMethod(String text) => int.tryParse(text.trim()) ?? 0;
