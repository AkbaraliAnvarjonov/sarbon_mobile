import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/icons_constants.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/theme/themes.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../router/app_routes.dart';
import '../../domain/entities/news/get_news_response_entity.dart';
import '../args/news_page_arguments.dart';
import '../bloc/home_bloc.dart';
import 'searched_cargo_result/widget/filter_bottom_sheet.dart';
import 'widgets/all_cargos_widget.dart';

part 'mixin/home_mixin.dart';

part 'widgets/home_appbar.dart';

part 'widgets/news_title_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin, HomeMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.colorScheme.surface,
        appBar: const HomeAppBar(),
        body: RefreshIndicator.adaptive(
          onRefresh: () async {
            context.read<HomeBloc>().add(const HomeRefresh());
          },
          child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) => state.status.isLoading
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : state.cargoItems.isEmpty &&
                          state.cargoItemsWithoutFilter.isEmpty &&
                          !state.status.isPaginationLoading
                      ? ListView(
                          children: [
                            SizedBox(
                              height: context.kSize.height * 0.8,
                              width: context.kSize.width,
                              child: Center(
                                child: Text('no_cargo_found'.tr()),
                              ),
                            ),
                          ],
                        )
                      : CustomScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: scrollController,
                        slivers: [
                          AppUtils.kSliverGap16,
                          if (!state.isFilterEmpty)
                            SliverToBoxAdapter(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    context.read<HomeBloc>().add(const RemoveFilterEvent());
                                  },
                                  child: Container(
                                    margin: AppUtils.kPaddingHorizontal16,
                                    padding: AppUtils.kPaddingHor24Ver20,
                                    decoration: const BoxDecoration(
                                      borderRadius: AppUtils.kBorderRadius12,
                                      color: Color(0xFFEDF0F5),
                                    ),
                                    child: IntrinsicWidth(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.close,
                                            color: context.colorScheme.onSurface,
                                            size: 18,
                                          ),
                                          AppUtils.kGap4,
                                          Text(
                                            'remove_filter'.tr(),
                                            style: context.textStyle.regularFootnote
                                                .copyWith(color: context.colorScheme.onSurface),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          AppUtils.kSliverGap16,
                          AllCargosWidget(
                            cargoItems: state.cargoItems,
                            cargosCount: state.cargosCount,
                            withoutFilterCargoItems: state.cargoItemsWithoutFilter,
                            scrollController: scrollController,
                          ),
                          AppUtils.kSliverGap16,
                        ],
                      )),
        ),
      );
}
