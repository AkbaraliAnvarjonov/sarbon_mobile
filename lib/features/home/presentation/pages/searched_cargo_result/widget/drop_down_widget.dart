part of 'filter_bottom_sheet.dart';

class _DropDownCargoTypeWidget2 extends StatefulWidget {
  const _DropDownCargoTypeWidget2();

  @override
  State<_DropDownCargoTypeWidget2> createState() => _DropDownCargoTypeWidget2State();
}

class _DropDownCargoTypeWidget2State extends State<_DropDownCargoTypeWidget2> {
  final TextEditingController menuController = TextEditingController();

  @override
  void initState() {
    menuController.text = context.read<HomeBloc>().state.selectedTypeCargo?.name ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius12,
            color: context.colorScheme.onPrimary,
          ),
          child: DropdownMenu<TypeCargoListEntity>(
            textStyle: context.textStyle.size14Weight400Black,
            menuHeight: 200,
            controller: menuController,
            width: MediaQuery.of(context).size.width - 32,
            hintText: 'select'.tr(),
            requestFocusOnTap: true,
            enableFilter: true,
            inputDecorationTheme: const InputDecorationTheme(
              border: InputBorder.none,
            ),
            trailingIcon: const Icon(
              Icons.keyboard_arrow_down_rounded,
            ),
            selectedTrailingIcon: const Icon(
              Icons.keyboard_arrow_up_rounded,
            ),
            onSelected: (TypeCargoListEntity? menu) {
              context.read<HomeBloc>().add(
                    SelectedCargoTypeEvent(
                      selectedTypeCargo: menu!,
                    ),
                  );
            },
            dropdownMenuEntries: state.typesCargo
                .map<DropdownMenuEntry<TypeCargoListEntity>>(
                    (TypeCargoListEntity menu) => DropdownMenuEntry<TypeCargoListEntity>(value: menu, label: menu.name))
                .toList(),
          ),
        ),
      );
}

class _DropDownPaymentTypeWidget extends StatelessWidget {
  const _DropDownPaymentTypeWidget();

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius12,
            color: context.colorScheme.onPrimary,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<TypePaymentListEntity>(
              isExpanded: true,
              hint: Text(
                'select'.tr(),
                style: context.textStyle.regularSubheadline.copyWith(
                  color: context.color.greyText,
                ),
              ),
              items: state.typesPayment
                  .map(
                    (item) => DropdownMenuItem<TypePaymentListEntity>(
                      value: item,
                      child: Text(
                        item.paymentType,
                        style: context.textStyle.size14Weight400Black,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                  .toList(),
              value: state.typesPayment
                  .where(
                    (element) => element.guid == state.selectedTypePayment?.guid,
                  )
                  .firstOrNull,
              onChanged: (value) {
                context.read<HomeBloc>().add(
                      SelectedPaymentTypeEvent(
                        selectedTypePayment: value!,
                      ),
                    );
              },
              buttonStyleData: ButtonStyleData(
                height: 50,
                width: double.maxFinite,
                padding: AppUtils.kPaddingHorizontal12,
                decoration: BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius8,
                  color: context.colorScheme.onPrimary,
                ),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                scrollPadding: AppUtils.kPaddingAll8,
                maxHeight: 200,
                decoration: BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius8,
                  color: context.colorScheme.onPrimary,
                ),
                offset: const Offset(0, -8),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: WidgetStateProperty.all(6),
                  thumbVisibility: WidgetStateProperty.all(true),
                ),
              ),
            ),
          ),
        ),
      );
}
