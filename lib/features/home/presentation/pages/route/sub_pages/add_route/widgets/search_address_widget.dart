import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../core/widgets/search_widget/flappy_search_bar.dart';
import '../../../../../../../../core/widgets/search_widget/search_empty_widget.dart';
import '../../../../../bloc/route/add_route/add_route_bloc.dart';
import 'search_found_item_widget.dart';

class SearchAddressRoutePageWidget extends StatefulWidget {
  const SearchAddressRoutePageWidget({
    super.key,
    required this.isForInitialPointOfAddress,
  });

  final bool isForInitialPointOfAddress;

  @override
  State<SearchAddressRoutePageWidget> createState() => _SearchAddressRoutePageWidgetState();
}

class _SearchAddressRoutePageWidgetState extends State<SearchAddressRoutePageWidget> {
  late final TextEditingController controller;
  final List<SearchItem> addresses = [];

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
            widget.isForInitialPointOfAddress ? 'from_where'.tr() : 'to_where'.tr(),
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
        body: BlocBuilder<AddRouteBloc, AddRouteState>(
          builder: (context, state) => FlappySearchBar<SearchItem>(
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
            placeHolder:

                // state.addresses.isNotEmpty
                //     ? ListView.builder(
                //   itemCount: state.addresses.length,
                //   itemBuilder: (_, index) => SearchFoundItemRoutePageWidget(
                //     item: state.addresses[index],
                //     isForInitialPointOfAddress: widget.isForInitialPointOfAddress,
                //   ),
                // )
                //     :
                const SearchEmptyWidget(),
            onSearch: (text) async {
              final items = await searchByText(text ?? '');
              if (items.isNotEmpty) {}
              return items;
            },
            onItemFound: (item, index) => SearchFoundItemRoutePageWidget(
              item: item!,
              isForInitialPointOfAddress: widget.isForInitialPointOfAddress,
            ),
            emptyWidget: const SearchEmptyWidget(),
          ),
        ),
      );
}
