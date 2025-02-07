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
        builder: (context, state) => Container(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius8,
            color: context.color.bg2,
            border: Border.all(color: const Color(0xFFDADADA)),
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
              Icons.keyboard_arrow_right,
            ),
            selectedTrailingIcon: const Icon(
              Icons.keyboard_arrow_right,
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
