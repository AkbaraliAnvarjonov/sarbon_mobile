import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../constants/constants.dart';
import '../../../../../constants/icons_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../core/widgets/rating/rating_bar_widget.dart';
import '../../../../../core/widgets/search_widget/search_empty_widget.dart';
import '../../../../../router/app_routes.dart';
import '../../../domain/entities/search/get_searched_cargo_items_request_entity.dart';
import '../../../domain/entities/search/get_searched_cargo_items_response_entity.dart';
import '../../bloc/searched_cargos/searched_cargos_bloc.dart';
import 'widget/filter_bottom_sheet.dart';

part 'widget/cargo_item_info_widget.dart';

part 'widget/searched_cargo_item.dart';

class SearchedCargoResultsPage extends StatefulWidget {
  const SearchedCargoResultsPage({
    super.key,
    required this.requestEntity,
  });

  final GetSearchedCargoItemsRequestEntity requestEntity;

  @override
  State<SearchedCargoResultsPage> createState() => _SearchedCargoResultsPageState();
}

class _SearchedCargoResultsPageState extends State<SearchedCargoResultsPage> {
  @override
  void initState() {
    context.read<SearchedCargosBloc>().add(
          GetSearchedResultEvent(
            requestEntity: widget.requestEntity,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        // backgroundColor: context.colorScheme.surface,
        appBar: AppBar(
          title: BlocBuilder<SearchedCargosBloc, SearchedCargosState>(
            buildWhen: (previous, current) => previous.cargoItemsCount != current.cargoItemsCount,
            builder: (context, state) => Text(
              '${state.cargoItemsCount} ${'cargos'.tr()}',
              style: context.textStyle.bodyHeadline,
            ),
          ),
          actions: [
            Padding(
              padding: AppUtils.kPaddingHorizontal16,
              child: GestureDetector(
                onTap: () async {
                  await customModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    enableDrag: false,
                    maxHeight: context.kSize.height * 0.93,
                    builder: (_, controller) => BlocProvider.value(
                      value: context.read<SearchedCargosBloc>(),
                      child: const FilterCargoBottomSheet(),
                    ),
                  );
                },
                child: SvgPicture.asset(
                  SvgImage.iconsIcFilter,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<SearchedCargosBloc, SearchedCargosState>(
          builder: (context, state) => state.status.isLoading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : state.cargoItems.isNotEmpty
                  ? CustomScrollView(
                      slivers: [
                        SliverSafeArea(
                          minimum: AppUtils.kPaddingVertical16,
                          sliver: SliverList.separated(
                            itemBuilder: (_, index) => SearchedCargoItem(
                              onTapShareButton: () async {
                                await Share.share(
                                  '''${Constants.deepLink}${state.cargoItems[index].guid ?? ''}\n${(context.locale.languageCode == 'ru' ? state.cargoItems[index].cityNameRu : state.cargoItems[index].cityNameEn) ?? ''} - ${(context.locale.languageCode == 'ru' ? state.cargoItems[index].city2NameRu : state.cargoItems[index].city2NameEn) ?? ''}; ${state.cargoItems[index].cardoTypeName ?? ''} (${'cargo'.tr()})\n${state.cargoItems[index].vehicleTypeName ?? ''} (${'vehicle_view'.tr()})''',
                                  subject: 'share_cargo'.tr(),
                                );
                              },
                              onTap: () async {
                                await context
                                    .pushNamed(
                                  Routes.cargoDetails,
                                  extra: state.cargoItems[index].guid ?? '',
                                )
                                    .then(
                                  (value) {
                                    if (value != null && value == true) {
                                      if (!context.mounted) return;
                                      context.pop(true);
                                    }
                                  },
                                );
                              },
                              cargoItem: state.cargoItems[index],
                            ),
                            separatorBuilder: (_, index) => AppUtils.kGap12,
                            itemCount: state.cargoItems.length,
                          ),
                        ),
                      ],
                    )
                  : const SearchEmptyWidget(),
        ),
      );
}
