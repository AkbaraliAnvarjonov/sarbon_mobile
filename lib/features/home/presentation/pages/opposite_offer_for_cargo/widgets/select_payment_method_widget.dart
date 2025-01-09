part of '../opposite_offer_page.dart';

class _SelectPaymentMethodWidget extends StatelessWidget {
  const _SelectPaymentMethodWidget({
    required this.animationController,
});

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<OppositeOfferBloc, OppositeOfferState>(
        builder: (context, state) => Row(
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: AppUtils.kBorderRadius12,
                  border: Border.all(
                    color: state.paymentMethodStatus == 'prepayment'
                        ? context.colorScheme.primary
                        : context.colorScheme.surface,
                  ),
                ),
                child: RadioListTile(
                  contentPadding: AppUtils.kPaddingZero,
                  value: state.paymentMethodStatus,
                  groupValue: 'prepayment',
                  onChanged: (value) {
                    context.read<OppositeOfferBloc>().add(
                          const SelectPaymentMethodEvent(
                            status: 'prepayment',
                          ),
                        );
                    animationController.forward();
                  },
                  title: Text(
                    'prepayment'.tr(),
                    style: context.textStyle.regularFootnote,
                  ),
                ),
              ),
            ),
            AppUtils.kGap16,
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: AppUtils.kBorderRadius12,
                  border: Border.all(
                    color: state.paymentMethodStatus == 'payment_after_completed'
                        ? context.colorScheme.primary
                        : context.colorScheme.surface,
                  ),
                ),
                child: RadioListTile(
                  contentPadding: AppUtils.kPaddingZero,
                  value: state.paymentMethodStatus,
                  groupValue: 'payment_after_completed',
                  onChanged: (value) {
                    context.read<OppositeOfferBloc>().add(
                          const SelectPaymentMethodEvent(
                            status: 'payment_after_completed',
                          ),
                        );
                    animationController.reverse();
                  },
                  title: Text(
                    'payment_after_completion'.tr(),
                    style: context.textStyle.regularFootnote,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
