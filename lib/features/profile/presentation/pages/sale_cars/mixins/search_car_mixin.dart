part of '../sale_cars_sub_pages/search_car/search_car_page.dart';

mixin SearchSaleCareMixin on State<SearchSaleCarPage> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  late SaleCarBloc saleBloc;

  @override
  void initState() {
    super.initState();
    saleBloc = context.read<SaleCarBloc>();
    saleBloc
      ..add(const SetSearchSavedListEvent())
      ..add(const GetRecommendationCarsEvent());
    searchFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    searchFocusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    saleBloc.add(FocusChangedEvent(hasFocus: searchFocusNode.hasFocus));
  }
}
