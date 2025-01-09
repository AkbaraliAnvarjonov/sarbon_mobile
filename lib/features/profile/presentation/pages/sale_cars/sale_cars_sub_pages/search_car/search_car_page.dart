import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../../../core/widgets/search_widget/sale_car_search_bar.dart';
import '../../../../../../../injector_container.dart';
import '../../../../../../../router/app_routes.dart';
import '../../../../../domain/entities/cars_sale/cars_sale_search_entity.dart';
import '../../../../../domain/entities/cars_sale/recommendation_cars_entity.dart';
import '../../../../../domain/usecases/sale_cars/cars_sale_search_usecase.dart';
import '../../../../bloc/sale_car/sale_car_bloc.dart';
import '../../../pages_arguments/sale_cars_detail_page_argument.dart';

part '../../mixins/search_car_mixin.dart';

part 'widgets/recommendation_cars.dart';

part 'widgets/search_empty_widget.dart';

part 'widgets/last_searched_item_widget.dart';

part 'widgets/found_from_search_item.dart';

part 'widgets/recommendation_after_search.dart';

class SearchSaleCarPage extends StatefulWidget {
  const SearchSaleCarPage({super.key});

  @override
  State<SearchSaleCarPage> createState() => _SearchSaleCarPageState();
}

class _SearchSaleCarPageState extends State<SearchSaleCarPage>
    with SearchSaleCareMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            'buy_car'.tr(),
          ),
        ),
        body: BlocBuilder<SaleCarBloc, SaleCarState>(
          builder: (context, state) =>
              SaleCarSearchBar<SaleCarsSearchResultListEntity>(
            hintText: 'search'.tr(),
            suffixIcon: Icon(
              Icons.search,
              color: context.color.greyText,
            ),
            onChanged: (text) {
              saleBloc.add(
                GetSimilarSearchedListEvent(
                  searchValue: text!,
                ),
              );
            },
            focusNode: searchFocusNode,
            placeHolder: !state.hasFocus
                ? ModalProgressHUD(
                    inAsyncCall: state.recommendationCarsStatus.isLoading,
                    child: _RecommendationCars(
                      recommendationCarsList: state.recommendationCarsList,
                    ),
                  )
                : state.searchSavedList.isEmpty
                    ? const _SearchEmptyWidget()
                    : _LastSearchedItemWidget(
                        onTap: (text) => searchController.text = text,
                        saleBloc: saleBloc,
                        searchSavedList: state.searchSavedList,
                      ),
            searchBarPadding: AppUtils.kPaddingHor16Ver12,
            onSearch: (text) async {
              final response = await sl<GetCarsSaleSearchUseCase>()(
                CarsSaleSearchParams(
                  limit: 20,
                  offset: 0,
                  search: text ?? '',
                ),
              );
              saleBloc.add(
                InsertItemSearchSavedListEvent(searchValue: text ?? ''),
              );
              return response.fold(
                (failure) => [],
                (carsSaleSearch) => carsSaleSearch.searchResultList,
              );
            },
            onItemFound: (item, index) => _FoundFromSearchItem(
              searchResultList: item!,
            ),
            recommendationBuilder: SliverSafeArea(
              sliver: SliverList.separated(
                itemBuilder: (context, index) => _RecommendationAfterSearch(
                  recommendationCarsList: state.recommendationCarsList[index],
                ),
                itemCount: state.recommendationCarsList.length,
                separatorBuilder: (context, index) => AppUtils.kGap8,
              ),
            ),
            emptyWidget: const _SearchEmptyWidget(),
            controller: searchController,
          ),
        ),
      );
}
