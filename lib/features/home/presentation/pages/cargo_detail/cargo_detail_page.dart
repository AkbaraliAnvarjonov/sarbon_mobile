import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import 'package:sarbon_mobile/core/widgets/app_bar/custom_appbar.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../../constants/icons_constants.dart';
import '../../../../../constants/image_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/mixins/location_mixin.dart';
import '../../../../../core/utils/map_launcher_util.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../router/app_routes.dart';
import '../../../../main/presentation/pages/widgets/auth_bottom_sheet.dart';
import '../../../domain/entities/cargo_details/address_position_cargo_entity.dart';
import '../../../domain/entities/cargo_details/get_cargo_details_response_entity.dart';
import '../../bloc/cargo_details/cargo_details_bloc.dart';
import '../opposite_offer_for_cargo/page_arguments/page_arguments.dart';
import 'widgets/already_order_bottom_sheet.dart';
import 'widgets/cargo_info_item_widget.dart';
import 'widgets/vertical_dashed_divider.dart';

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

class CargoDetailPage extends StatefulWidget {
  const CargoDetailPage({
    super.key,
    required this.cargoId,
  });

  final String cargoId;

  @override
  State<CargoDetailPage> createState() => _CargoDetailPageState();
}

class _CargoDetailPageState extends State<CargoDetailPage> with CargoDetailMixin {
  @override
  Widget build(BuildContext context) => BlocConsumer<CargoDetailsBloc, CargoDetailsState>(
        listener: (context, state) {
          if (state.status.isSuccess && state.cargoPointStatus.isSuccess && sessions == null) {
            print('keldi');
            routes();
          }
          ;
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar:
                CustomAppBar(title: '${state.details?.countryCodeFrom ?? ''}-${state.details?.countryCodeTo ?? ''}'),
            body: state.status.isLoading || state.cargoPointStatus.isLoading
                ? const Center(child: CircularProgressIndicator.adaptive())
                : state.details != null
                    ? CustomScrollView(
                        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                                    // _CargoDirectionShortInfoWidget(
                                    //   details: state.details,
                                    //   addressPositions: state.addressPositions.toList(),
                                    // ),
                                    AppUtils.kGap8,
                                    _AddressesPointWidget(
                                      addresses: state.addresses,
                                      addressPositions: state.addressPositions.toList(),
                                      details: state.details,
                                    ),
                                    SizedBox(
                                      height: 240,
                                      width: context.kSize.width,
                                      child: YandexMap(
                                        mapObjects: mapObjects,
                                        onMapCreated: (YandexMapController controller) async {
                                          final middlePoint = findMidpoint(
                                            Point(
                                              latitude:
                                                  context.read<CargoDetailsBloc>().state.addressPositions.first.lat,
                                              longitude:
                                                  context.read<CargoDetailsBloc>().state.addressPositions.first.long,
                                            ),
                                            Point(
                                              latitude:
                                                  context.read<CargoDetailsBloc>().state.addressPositions.last.lat,
                                              longitude:
                                                  context.read<CargoDetailsBloc>().state.addressPositions.last.long,
                                            ),
                                          );
                                          await controller.moveCamera(
                                            CameraUpdate.newCameraPosition(
                                              CameraPosition(
                                                target: Point(
                                                  latitude: middlePoint.latitude,
                                                  longitude: middlePoint.longitude,
                                                ),
                                                zoom: 3,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    // AppUtils.kGap24,
                                    // _CargoDetailInfoTitleWidget(
                                    //   isCmr: state.details?.cmr ?? false,
                                    //   isT1: state.details?.t1 ?? false,
                                    //   isTir: state.details?.tir ?? false,
                                    //   adr: state.details?.permission ?? [],
                                    // ),
                                    _CargoDetailInfoWidget(
                                      details: state.details,
                                    ),
                                    AppUtils.kGap24,
                                    _CompanyInfoOfCargoWidget(
                                      companyInfo: state.details?.companyDataEntity,
                                    ),
                                    AppUtils.kGap24,
                                    AppUtils.kDivider,
                                    AppUtils.kGap36,
                                    const _SendOfferAndComplainButton()
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
          );
        },
      );
}
