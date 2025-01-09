part of '../../announcement_tab_pages/sub_pages/create_new_announcement_page.dart';

class _PriceAndContactViewWidget extends StatelessWidget {
  const _PriceAndContactViewWidget({
    required this.priceController,
    required this.phoneController,
  });

  final TextEditingController priceController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'cost_and_contacts'.tr(),
            style: context.textStyle.buttonStyle.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
          AppUtils.kGap8,
          Column(
            children: [
               _SelectCurrencyWidget(
                priceController: priceController,
               ),
              AppUtils.kGap12,
              CustomTextField(
                validator: (value) {
                  if (value!.length < 9) {
                    return 'validator_phone_number'.tr();
                  }
                  return null;
                },
                controller: phoneController,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                textInputType: TextInputType.phone,
                labelText: 'contacts'.tr(),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 13.2,
                    right: 8,
                  ),
                  child: Text(
                    '+998',
                    style: context.textStyle.regularCallout,
                  ),
                ),
                textInputFormatter: MaskedTextInputFormatter(
                  mask: '## ### ## ##',
                  separator: ' ',

                ),
                contentPadding: AppUtils.kPaddingAll12,
                hintText: 'contacts'.tr(),
                hintTextStyle: context.textStyle.regularSubheadline.copyWith(
                  color: context.color.greyText,
                ),
                fillColor: context.colorScheme.surface,
              ),
            ],
          ),
        ],
      );
}
