import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/search_widget/flappy_search_bar.dart';
import '../../../../../injector_container.dart';
import '../../../domain/entities/search/get_addresses_response_entity.dart';
import '../../../domain/usecases/get_addresses_usecase.dart';
import '../../bloc/home_bloc.dart';
import 'search_empty_widget.dart';
import 'search_found_item_widget.dart';

class SearchAddressWidget extends StatefulWidget {
  const SearchAddressWidget({
    super.key,
    required this.isForInitialPointOfAddress,
    this.scrollController,
  });

  final bool isForInitialPointOfAddress;
  final ScrollController? scrollController;

  @override
  State<SearchAddressWidget> createState() => _SearchAddressWidgetState();
}

class _SearchAddressWidgetState extends State<SearchAddressWidget> {
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
            widget.isForInitialPointOfAddress ? 'to_where'.tr() : 'from_where'.tr(),
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
        body: BlocBuilder<HomeBloc, HomeState>(
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
            placeHolder: const SearchEmptyWidget(),

            // state.addresses.isNotEmpty
            // ? ListView.builder(
            //     itemCount: state.addresses.length,
            //     itemBuilder: (_, index) => SearchFoundItemWidget(
            //       item: state.addresses[index],
            //       isForInitialPointOfAddress:
            //           widget.isForInitialPointOfAddress,
            //     ),
            //   )
            // :
            onSearch: (text) async {
              final items = await searchByText(text ?? '');
              if (items.isNotEmpty) {}
              return items;
            },
            onItemFound: (item, index) => SearchFoundItemWidget(
              item: item,
              isForInitialPointOfAddress: widget.isForInitialPointOfAddress,
            ),
            emptyWidget: const SearchEmptyWidget(),
          ),
        ),
      );
}
