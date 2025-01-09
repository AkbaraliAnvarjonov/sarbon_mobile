part of '../../announcement_tab_pages/sub_pages/update_active_announcement_page.dart';

class _SelectCarTypeWidget extends StatelessWidget {
  const _SelectCarTypeWidget();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<UpdateActiveAnnouncementBloc, UpdateActiveAnnouncementState>(
        buildWhen: (previous, current) =>
            previous.typeCarsList != current.typeCarsList ||
            previous.selectedCarType != current.selectedCarType,
        builder: (context, state) => DropdownButtonHideUnderline(
          child: DropdownButton2<TypeCarsListEntity>(
            isExpanded: true,
            hint: Text(
              'type_vehicle'.tr(),
              style: context.textStyle.regularSubheadline.copyWith(
                color: context.color.greyText,
              ),
            ),
            items: state.typeCarsList
                .map(
                  (typeCar) => DropdownMenuItem<TypeCarsListEntity>(
                    value: typeCar,
                    child: Text(
                      typeCar.typeName,
                      style: context.textStyle.size14Weight400Black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
                .toList(),
            value: state.selectedCarType,
            onChanged: (value) {
              context.read<UpdateActiveAnnouncementBloc>().add(
                    SelectCarTypeEvent(
                      selectedCarType: value!,
                    ),
                  );
            },
            buttonStyleData: ButtonStyleData(
              height: 48,
              width: double.maxFinite,
              padding: AppUtils.kPaddingHorizontal12,
              decoration: BoxDecoration(
                borderRadius: AppUtils.kBorderRadius8,
                color: context.colorScheme.surface,
              ),
            ),
            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: context.color.greyText,
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              scrollPadding: AppUtils.kPaddingAll8,
              maxHeight: 200,
              decoration: BoxDecoration(
                borderRadius: AppUtils.kBorderRadius12,
                color: context.colorScheme.onPrimary,
              ),
              offset: const Offset(0, -8),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              ),
            ),
          ),
        ),
      );
}

class _SelectCurrencyWidget extends StatelessWidget {
  const _SelectCurrencyWidget({
    required this.priceController,
  });

  final TextEditingController priceController;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<UpdateActiveAnnouncementBloc, UpdateActiveAnnouncementState>(
        builder: (context, state) => CustomTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'validator_field_can_not_be_empty'.tr();
            }
            return null;
          },
          autoValidateMode: AutovalidateMode.onUserInteraction,
          controller: priceController,
          labelText: 'cost'.tr(),
          textInputFormatter: FilteringTextInputFormatter.digitsOnly,
          contentPadding: AppUtils.kPaddingAll12,
          hintText: 'cost'.tr(),
          hintTextStyle: context.textStyle.regularSubheadline.copyWith(
            color: context.color.greyText,
          ),
          fillColor: context.colorScheme.surface,
          suffixIcon: SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  state.selectedCurrency?.typeName ?? '',
                  style: context.textStyle.regularFootnote,
                ),
                AppUtils.kGap8,
                PopupMenuButton<TypeCurrencyListEntity>(
                  icon: SvgPicture.asset(
                    SvgImage.icArrowDropdown,
                    height: 24,
                    width: 24,
                  ),
                  itemBuilder: (context) => state.currencyList
                      .map(
                        (currency) => PopupMenuItem<TypeCurrencyListEntity>(
                          value: currency,
                          child: Material(
                            color: context.color.greyText.withOpacity(0.1),
                            borderRadius: AppUtils.kBorderRadius4,
                            child: Padding(
                              padding: AppUtils.kPaddingAll8,
                              child: Row(
                                children: [
                                  Text(
                                    currency.typeName,
                                    style: context.textStyle.regularFootnote,
                                  ),
                                  AppUtils.kGap8,
                                  if (state.selectedCurrency?.typeName ==
                                      currency.typeName)
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
                    context.read<UpdateActiveAnnouncementBloc>().add(
                          SelectCurrencyEvent(
                            selectedCurrency: value,
                          ),
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      );
}

class _SelectAddressWidget extends StatelessWidget {
  const _SelectAddressWidget();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<UpdateActiveAnnouncementBloc, UpdateActiveAnnouncementState>(
        buildWhen: (previous, current) =>
            previous.addressesList != current.addressesList ||
            previous.selectedAddress != current.selectedAddress,
        builder: (context, state) => DropdownButtonHideUnderline(
          child: DropdownButton2<AddressesListEntity>(
            isExpanded: true,
            hint: Text(
              'address'.tr(),
              style: context.textStyle.regularSubheadline.copyWith(
                color: context.color.greyText,
              ),
            ),
            items: state.addressesList
                .map(
                  (address) => DropdownMenuItem<AddressesListEntity>(
                    value: address,
                    child: Text(
                      '${address.cityName} - ${address.addressName}',
                      style: context.textStyle.size14Weight400Black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
                .toList(),
            value: state.selectedAddress,
            onChanged: (value) {
              context.read<UpdateActiveAnnouncementBloc>().add(
                    SelectAddressSaleCarEvent(
                      selectedAddress: value!,
                    ),
                  );
            },
            buttonStyleData: ButtonStyleData(
              height: 48,
              width: double.maxFinite,
              padding: AppUtils.kPaddingHorizontal12,
              decoration: BoxDecoration(
                borderRadius: AppUtils.kBorderRadius8,
                color: context.colorScheme.surface,
              ),
            ),
            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: context.color.greyText,
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              scrollPadding: AppUtils.kPaddingAll8,
              maxHeight: 200,
              decoration: BoxDecoration(
                borderRadius: AppUtils.kBorderRadius12,
                color: context.colorScheme.onPrimary,
              ),
              offset: const Offset(0, -8),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              ),
            ),
          ),
        ),
      );
}
