import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/debaouncer/debouncer.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../router/app_routes.dart';
import '../../../domain/entities/search/get_searched_cargo_items_response_entity.dart';
import '../../bloc/home_bloc.dart';
import '../searched_cargo_result/widget/all_cargo_item_widget.dart';

part '../mixin/all_cargos_mixin.dart';

class AllCargosWidget extends StatefulWidget {
  const AllCargosWidget({
    super.key,
    required this.cargosCount,
    required this.cargoItems,
    required this.withoutFilterCargoItems,
    required this.scrollController,
  });

  final int cargosCount;
  final List<SearchedCargoItemEntity> cargoItems;
  final List<SearchedCargoItemEntity> withoutFilterCargoItems;
  final ScrollController scrollController;

  @override
  State<AllCargosWidget> createState() => _AllCargosWidgetState();
}

class _AllCargosWidgetState extends State<AllCargosWidget> with CargosMixin {
  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: AppUtils.kPaddingHorizontal16,
        sliver: SliverList(
          delegate: SliverChildListDelegate([
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              addRepaintBoundaries: false,
              addAutomaticKeepAlives: false,
              shrinkWrap: true,
              itemCount: widget.cargoItems.length + 1,
              itemBuilder: (context, index) {
                if (index > widget.cargoItems.length - 1) {
                  if (homeBloc.state.status.isPaginationLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return const SizedBox();
                }
                return AllCargoItem(
                  onTap: () async {
                    await context
                        .pushNamed(
                      Routes.cargoDetails,
                      extra: widget.cargoItems[index].guid ?? '',
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
                  onTapShareButton: () async {
                    // await Share.share(
                    //   '''${Constants.deepLink}${widget.cargoItems[index].guid ?? ''}\n${(context.locale.languageCode == 'ru' ? widget.cargoItems[index].cityNameRu : widget.cargoItems[index].cityNameEn) ?? ''} - ${(context.locale.languageCode == 'ru' ? widget.cargoItems[index].city2NameRu : widget.cargoItems[index].city2NameEn) ?? ''}; ${widget.cargoItems[index].cardoTypeName ?? ''} (${'cargo'.tr()})\n${widget.cargoItems[index].vehicleTypeName ?? ''} (${'vehicle_view'.tr()})\n${'download_our_app'.tr()}\nios: ${Constants.iosAppLink}\nandroid: ${Constants.androidAppLink}''',
                    //   subject: 'share_cargo'.tr(),
                    // );
                  },
                  cargoItem: widget.cargoItems[index],
                );
              },
              separatorBuilder: (_, __) => AppUtils.kGap12,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              addRepaintBoundaries: false,
              addAutomaticKeepAlives: false,
              shrinkWrap: true,
              itemCount: widget.withoutFilterCargoItems.length + 1,
              itemBuilder: (context, index) {
                if (index > widget.withoutFilterCargoItems.length - 1) {
                  if (homeBloc.state.status.isPaginationLoading && widget.withoutFilterCargoItems.isNotEmpty) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return AppUtils.kGap;
                }
                return localSource.vehicleId != widget.withoutFilterCargoItems[index].vehicleId
                    ? AllCargoItem(
                        onTap: () async {
                          await context
                              .pushNamed(
                            Routes.cargoDetails,
                            extra: widget.withoutFilterCargoItems[index].guid ?? '',
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
                        onTapShareButton: () async {
                          // await Share.share(
                          //   '''${Constants.deepLink}${widget.cargoItems[index].guid ?? ''}\n${(context.locale.languageCode == 'ru' ? widget.cargoItems[index].cityNameRu : widget.cargoItems[index].cityNameEn) ?? ''} - ${(context.locale.languageCode == 'ru' ? widget.cargoItems[index].city2NameRu : widget.cargoItems[index].city2NameEn) ?? ''}; ${widget.cargoItems[index].cardoTypeName ?? ''} (${'cargo'.tr()})\n${widget.cargoItems[index].vehicleTypeName ?? ''} (${'vehicle_view'.tr()})\n${'download_our_app'.tr()}\nios: ${Constants.iosAppLink}\nandroid: ${Constants.androidAppLink}''',
                          //   subject: 'share_cargo'.tr(),
                          // );
                        },
                        cargoItem: widget.withoutFilterCargoItems[index],
                      )
                    : AppUtils.kGap;
              },
              separatorBuilder: (_, index) => localSource.vehicleId != widget.withoutFilterCargoItems[index].vehicleId
                  ? AppUtils.kGap12
                  : AppUtils.kGap,
            ),
          ]),
        ),
      );
}
