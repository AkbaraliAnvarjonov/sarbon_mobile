part of '../add_car_page.dart';

class _DropDownCountryWidget2 extends StatefulWidget {
  const _DropDownCountryWidget2();

  @override
  State<_DropDownCountryWidget2> createState() => _DropDownCountryWidget2State();
}

class _DropDownCountryWidget2State extends State<_DropDownCountryWidget2> {
  final TextEditingController menuController = TextEditingController();

  // Placeholder for the selected country
  Map<String, dynamic>? selectedCountry;

  // Filtered countries list based on user input
  late List<Map<String, dynamic>> filteredCountries;

  // Flag to determine the language (Russian or English)
  bool isCyrillic = false;

  @override
  void initState() {
    super.initState();
    filteredCountries = Constants.countries;

    // Add listener to the menuController to filter as user types
    menuController.addListener(_filterCountries);
  }

  // Function to detect if the user typed in Cyrillic (Russian) or Latin (English)
  bool _isCyrillic(String text) {
    final regExp = RegExp(r'[\u0400-\u04FF]');
    return regExp.hasMatch(text);
  }

  void _filterCountries() {
    final searchText = menuController.text;

    isCyrillic = _isCyrillic(searchText);
    filteredCountries = Constants.countries.where((country) {
      // Get the correct country name based on language input
      final countryName = _getCountryName(country);
      return countryName.toLowerCase().contains(searchText.toLowerCase());
    }).toList();
    setState(() {});
  }

  String _getCountryName(Map<String, dynamic> country) =>
      isCyrillic ? (country['name_ru'] ?? country['name']) : (country['name'] ?? '');

  @override
  void dispose() {
    // Remove the listener to avoid memory leaks
    menuController.removeListener(_filterCountries);
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: AppUtils.kBorderRadius12,
          color: context.colorScheme.onPrimary,
        ),
        child: DropdownMenu<Map<String, dynamic>>(
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
          trailingIcon: const Icon(Icons.keyboard_arrow_down_rounded),
          selectedTrailingIcon: const Icon(Icons.keyboard_arrow_up_rounded),
          onSelected: (Map<String, dynamic>? menu) {
            setState(() {
              selectedCountry = menu;
              menuController.text = _getCountryName(menu!);
              context.read<AddCarBloc>().add(
                    ChangeCarCountryEvent(menu['code']),
                  );
            });
          },
          dropdownMenuEntries: filteredCountries
              .map<DropdownMenuEntry<Map<String, dynamic>>>(
                (country) => DropdownMenuEntry<Map<String, dynamic>>(
                  value: country,
                  label: _getCountryName(country),
                ),
              )
              .toList(),
        ),
      );
}
