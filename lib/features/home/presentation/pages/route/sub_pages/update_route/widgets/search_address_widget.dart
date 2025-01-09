part of 'update_route_item_widget.dart';

class _SearchAddressUpdateRoutePageWidget extends StatefulWidget {
  const _SearchAddressUpdateRoutePageWidget({
    required this.isForInitialPointOfAddress,
  });

  final bool isForInitialPointOfAddress;

  @override
  State<_SearchAddressUpdateRoutePageWidget> createState() =>
      _SearchAddressUpdateRoutePageWidgetState();
}

class _SearchAddressUpdateRoutePageWidgetState
    extends State<_SearchAddressUpdateRoutePageWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.colorScheme.onPrimary,
        appBar: AppBar(
          backgroundColor: context.colorScheme.onPrimary,
          title: Text(
            widget.isForInitialPointOfAddress
                ? 'from_where'.tr()
                : 'to_where'.tr(),
            style: context.textStyle.appBarTitle,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.close,
                size: 24,
                color: context.color.greyText,
              ),
            ),
          ],
        ),
        body: BlocBuilder<UpdateRouteBloc, UpdateRouteState>(
          builder: (context, state) => FlappySearchBar<AddressForRouteEntity>(
            searchBarPadding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            hintText: 'search_address'.tr(),
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              color: context.colorScheme.primary,
            ),
            controller: controller,
            suffixIcon: IconButton(
              onPressed: () {
                controller.text = '';
                setState(() {});
              },
              icon: Icon(Icons.cancel, color: context.color.greyText),
            ),
            hintStyle: context.textStyle.regularCallout.copyWith(
              color: context.color.greyText,
            ),
            placeHolder: state.addresses.isNotEmpty
                ? ListView.builder(
                    itemCount: state.addresses.length,
                    itemBuilder: (_, index) =>
                        SearchFoundItemRouteUpdatePageWidget(
                      item: AddressForRouteEntity(
                        addressName: state.addresses[index].countryName ?? '',
                        addressNameEn:
                            state.addresses[index].countryNameEn ?? '',
                        addressNameRu:
                            state.addresses[index].countryNameRu ?? '',
                        addressId: state.addresses[index].addressId ?? '',
                        cityName: state.addresses[index].name ?? '',
                        cityNameEn: state.addresses[index].nameEn ?? '',
                        cityNameRu: state.addresses[index].nameRu ?? '',
                        cityId: state.addresses[index].guid ?? '',
                      ),
                      isForInitialPointOfAddress:
                          widget.isForInitialPointOfAddress,
                    ),
                  )
                : const SearchEmptyWidget(),
            onSearch: (text) async {
              final response = await sl<GetAddressesUseCase>()(
                GetAddressesParams(
                  limit: 10,
                  offset: 0,
                  searchedText: text,
                ),
              );
              return response.fold(
                (left) => [],
                (right) => right.addresses
                    .map(
                      (e) => AddressForRouteEntity(
                        addressName: e.countryName ?? '',
                        addressNameEn: e.countryNameEn ?? '',
                        addressNameRu: e.countryNameRu ?? '',
                        addressId: e.addressId ?? '',
                        cityName: e.name ?? '',
                        cityNameEn: e.nameEn ?? '',
                        cityNameRu: e.nameRu ?? '',
                        cityId: e.guid ?? '',
                      ),
                    )
                    .toList(),
              );
            },
            onItemFound: (item, index) => SearchFoundItemRouteUpdatePageWidget(
              item: item,
              isForInitialPointOfAddress: widget.isForInitialPointOfAddress,
            ),
            emptyWidget: const SearchEmptyWidget(),
          ),
        ),
      );
}
