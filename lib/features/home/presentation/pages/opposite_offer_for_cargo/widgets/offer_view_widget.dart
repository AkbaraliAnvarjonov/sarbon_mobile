part of '../opposite_offer_page.dart';

class _OfferViewWidget extends StatelessWidget {
  const _OfferViewWidget({
    required this.amountController,
    required this.isShowSuffixWidget,
    required this.onChanged,
    required this.isNotDriverCash,
  });

  final TextEditingController amountController;
  final bool isShowSuffixWidget;
  final ValueChanged<String> onChanged;
  final bool isNotDriverCash;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<OppositeOfferBloc, OppositeOfferState>(
        builder: (context, state) => CustomTextField(
          controller: amountController,
          hintText: 'write_in_sums'.tr(),
          contentPadding: AppUtils.kPaddingHorizontal12,
          fillColor: context.colorScheme.surface,
          textInputType: TextInputType.number,
          textInputFormatter: state.showPercentage && isNotDriverCash
              ? FilteringTextInputFormatter.allow(RegExp(r'^(100|\d{1,2})$'))
              : FilteringTextInputFormatter.digitsOnly,
          onChanged: onChanged.call,
          suffixIcon: isShowSuffixWidget
              ? SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        state.selectedCurrency?.code ?? '',
                        style: context.textStyle.regularFootnote,
                      ),
                      AppUtils.kGap8,
                      PopupMenuButton<CurrencyItemEntity>(
                        icon: SvgPicture.asset(
                          SvgImage.icArrowDropdown,
                          height: 24,
                          width: 24,
                        ),
                        itemBuilder: (context) => state.currencyList
                            .map(
                              (currency) => PopupMenuItem<CurrencyItemEntity>(
                                value: currency,
                                child: Material(
                                  color:
                                      context.color.greyText.withOpacity(0.1),
                                  borderRadius: AppUtils.kBorderRadius4,
                                  child: Padding(
                                    padding: AppUtils.kPaddingAll8,
                                    child: Row(
                                      children: [
                                        Text(
                                          currency.code ?? '',
                                          style:
                                              context.textStyle.regularFootnote,
                                        ),
                                        AppUtils.kGap8,
                                        if (state.selectedCurrency?.code ==
                                            currency.code)
                                          Icon(
                                            Icons.check,
                                            color: context.colorScheme.primary,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onSelected: (value) {
                          context.read<OppositeOfferBloc>().add(
                                SelectCurrencyEvent(
                                  currency: value,
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                )
              : Icon(
                  Icons.percent,
                  color: context.colorScheme.primary,
                ),
        ),
      );
}
