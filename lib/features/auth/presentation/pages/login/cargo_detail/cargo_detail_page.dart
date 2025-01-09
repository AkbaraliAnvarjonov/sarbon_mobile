import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../constants/icons_constants.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/mixins/location_mixin.dart';
import '../../../../../../core/utils/map_launcher_util.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/rating/rating_bar_widget.dart';
import '../../../../../../router/app_routes.dart';
import '../../../../../home/domain/entities/cargo_details/address_position_cargo_entity.dart';
import '../../../../../home/domain/entities/cargo_details/get_cargo_details_response_entity.dart';
import '../../../../../home/presentation/bloc/cargo_details/cargo_details_bloc.dart';
import '../../../../../home/presentation/pages/opposite_offer_for_cargo/page_arguments/page_arguments.dart';
import 'widgets/cargo_info_item_widget.dart';

part '../mixin/cargo_detail_mixin.dart';
part 'widgets/addresses_point_widget.dart';
part 'widgets/cargo_company_info_widget.dart';
part 'widgets/cargo_detail_info_widget.dart';
part 'widgets/cargo_direction_short_info_widget.dart';
part 'widgets/cargo_direction_with_diagram_info_widget.dart';
part 'widgets/cargo_info_widget.dart';
part 'widgets/cargo_payment_info_widget.dart';
part 'widgets/cargo_transport_info_widget.dart';
part 'widgets/send_comment_widget.dart';
part 'widgets/send_offer_and_complain_button.dart';

class CargoDetailForUnregisterUserPage extends StatefulWidget {
  const CargoDetailForUnregisterUserPage({
    super.key,
    required this.cargoId,
  });

  final String cargoId;

  @override
  State<CargoDetailForUnregisterUserPage> createState() =>
      _CargoDetailForUnregisterUserPageState();
}

class _CargoDetailForUnregisterUserPageState
    extends State<CargoDetailForUnregisterUserPage>
    with CargoDetailForUnregisterUserMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('cargo_details'.tr()),
          titleSpacing: 0,
        ),
        body: BlocBuilder<CargoDetailsBloc, CargoDetailsState>(
          builder: (context, state) =>
              state.status.isLoading || state.cargoPointStatus.isLoading
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : state.details != null
                      ? CustomScrollView(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(),
                          ),
                          slivers: [
                            SliverSafeArea(
                              minimum: AppUtils.kPaddingAll16,
                              sliver: SliverMainAxisGroup(
                                slivers: [
                                  SliverList.list(
                                    children: [
                                      _CargoDirectionShortInfoWidget(
                                        details: state.details,
                                      ),
                                      AppUtils.kGap8,
                                      _AddressesPointWidget(
                                        addresses: state.addresses,
                                        addressPositions: state
                                            .addressPositions.reversed
                                            .toList(),
                                      ),
                                      AppUtils.kGap24,
                                      _CargoDetailInfoTitleWidget(
                                        isCmr: state.details?.cmr ?? false,
                                        isT1: state.details?.t1 ?? false,
                                        isTir: state.details?.tir ?? false,
                                        adr: state.details?.permission ?? [],
                                      ),
                                      AppUtils.kGap8,
                                      _CargoDetailInfoWidget(
                                        details: state.details,
                                      ),
                                      AppUtils.kGap16,
                                      Text(
                                        'comment'.tr(),
                                        style: context.textStyle.regularHeadline
                                            .copyWith(
                                          color: context.color.textColor,
                                        ),
                                      ),
                                      AppUtils.kGap8,
                                      _SendCommentWidget(
                                        comment: state.details?.comment ?? '',
                                      ),
                                      AppUtils.kGap16,
                                      Text(
                                        'company'.tr(),
                                        style: context.textStyle.regularHeadline
                                            .copyWith(
                                          color: context.color.textColor,
                                        ),
                                      ),
                                      AppUtils.kGap8,
                                      _CompanyInfoOfCargoWidget(
                                        companyInfo:
                                            state.details?.companyDataEntity,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: Text(
                            'Empty',
                            style: context.textStyle.size14Weight400Black,
                          ),
                        ),
        ),
        bottomNavigationBar: const _SendOfferAndComplainButton(),
      );
}
