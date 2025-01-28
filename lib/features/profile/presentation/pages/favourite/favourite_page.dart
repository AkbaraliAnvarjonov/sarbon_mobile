import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sarbon_mobile/core/widgets/app_bar/custom_appbar.dart';

import '../../../../../constants/icons_constants.dart';
import '../../../../../constants/image_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../router/app_routes.dart';
import '../../../domain/entities/favourite_cargo/favourite_cargo_response_entity.dart';
import '../../bloc/favourite_cargo/favourite_cargo_bloc.dart';

part 'widgets/favourite_item_info_widget.dart';

part 'widgets/favourite_cargo_item.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'favourites'.tr(),
          centerTitle: true,
        ),
        body: BlocBuilder<FavouriteCargoBloc, FavouriteCargoState>(
          builder: (context, state) => RefreshIndicator(
            onRefresh: () async {
              context.read<FavouriteCargoBloc>().add(
                    const FetchFavouriteCargoEvent(),
                  );
            },
            child: ModalProgressHUD(
              inAsyncCall: state.favouriteFetchStatus.isLoading || state.putFavouriteStatus.isLoading,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  if (state.favouriteCargoes.isEmpty && !state.favouriteFetchStatus.isLoading)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: context.kSize.height / 2 - kToolbarHeight,
                        ),
                        child: Text(
                          'empty_orders'.tr(),
                          textAlign: TextAlign.center,
                          style: context.textStyle.regularCallout,
                        ),
                      ),
                    )
                  else ...[
                    AppUtils.kSliverGap20,
                    SliverList.separated(
                      itemCount: state.favouriteCargoes.length,
                      itemBuilder: (_, index) => _FavouriteCargoItem(
                        cargoItem: state.favouriteCargoes[index],
                        onTap: () async {
                          await context
                              .pushNamed(
                            Routes.cargoDetails,
                            extra: state.favouriteCargoes[index].guid ?? '',
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
                      ),
                      separatorBuilder: (_, __) => AppUtils.kGap16,
                    ),
                    AppUtils.kSliverGap20,
                  ],
                ],
              ),
            ),
          ),
        ),
      );
}
