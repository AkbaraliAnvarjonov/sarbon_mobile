import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/icons_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/mixins/location_mixin.dart';
import '../../../../../core/utils/map_launcher_util.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../core/widgets/rating/rating_bar_widget.dart';
import '../../../../../router/app_routes.dart';
import '../../../domain/entities/get_order_details_response_entity.dart';
import '../../bloc/order_detail/order_details_bloc.dart';
import '../args/order_detail_page_argument.dart';
import 'widgets/choose_status_widget.dart';
import 'widgets/give_feedback_and_rating_widget.dart';
import 'widgets/order_info_item_widget.dart';

part '../mixins/order_detail_mixin.dart';

part 'widgets/offer_detail_info_widget.dart';

part 'widgets/order_addresses_point_widget.dart';

part 'widgets/order_company_info_widget.dart';

part 'widgets/order_detail_info_widget.dart';

part 'widgets/order_direction_short_info_widget.dart';

part 'widgets/order_direction_with_diagram_info_widget.dart';

part 'widgets/order_file_widget.dart';

part 'widgets/order_for_deal_button.dart';

part 'widgets/order_info_widget.dart';

part 'widgets/order_payment_info_widget.dart';

part 'widgets/order_transport_info_widget.dart';

part 'widgets/send_comment_widget.dart';

part 'widgets/signed_order_button.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({
    super.key,
    required this.args,
  });

  final OrderDetailsPageArgument? args;

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> with OrderDetailMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'cargo_details'.tr(),
          ),
          titleSpacing: 0,
        ),
        body: BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
          buildWhen: (previous, current) =>
              previous.orderDetailStatus != current.orderDetailStatus ||
              previous.addressStatus != current.addressStatus,
          builder: (context, state) => state.orderDetailStatus.isLoading || state.addressStatus.isLoading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : state.addresses.isNotEmpty
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
                                  _OrderDirectionShortInfoWidget(
                                    details: state.details,
                                  ),
                                  AppUtils.kGap8,
                                  _OrderAddressesPointWidget(
                                    addresses: state.addresses,
                                    isForDeal: widget.args?.isForDeal ?? false,
                                  ),
                                  if ((state.details?.file1 ?? '') != '' ||
                                      (state.details?.file2 ?? '') != '' ||
                                      (state.details?.file3 ?? '') != '' ||
                                      (state.details?.file4 ?? '') != '' ||
                                      (state.details?.file5 ?? '') != '')
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AppUtils.kGap24,
                                        Text(
                                          'documentation'.tr(),
                                          style: context.textStyle.regularHeadline.copyWith(
                                            color: context.color.textColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  if ((state.details?.file1 ?? '') != '')
                                    _OrderFileWidget(
                                      name: Uri(path: state.details?.file1 ?? '').pathSegments.last,
                                      url: state.details?.file1 ?? '',
                                    ),
                                  if ((state.details?.file2 ?? '') != '')
                                    _OrderFileWidget(
                                      name: Uri(path: state.details?.file2 ?? '').pathSegments.last,
                                      url: state.details?.file2 ?? '',
                                    ),
                                  if ((state.details?.file3 ?? '') != '')
                                    _OrderFileWidget(
                                      name: Uri(path: state.details?.file3 ?? '').pathSegments.last,
                                      url: state.details?.file3 ?? '',
                                    ),
                                  if ((state.details?.file4 ?? '') != '')
                                    _OrderFileWidget(
                                      name: Uri(path: state.details?.file4 ?? '').pathSegments.last,
                                      url: state.details?.file4 ?? '',
                                    ),
                                  if ((state.details?.file5 ?? '') != '')
                                    _OrderFileWidget(
                                      name: Uri(path: state.details?.file5 ?? '').pathSegments.last,
                                      url: state.details?.file5 ?? '',
                                    ),
                                  AppUtils.kGap24,
                                  if (state.details?.currencyId?.isNotEmpty ?? false) ...[
                                    Text(
                                      'offer_details'.tr(),
                                      style: context.textStyle.regularHeadline.copyWith(
                                        color: context.color.textColor,
                                      ),
                                    ),
                                    AppUtils.kGap8,
                                    _OfferDetailInfoWidget(
                                      details: state.details,
                                    ),
                                  ],
                                  AppUtils.kGap24,
                                  _OrderDetailInfoTitleWidget(
                                    isCmr: state.details?.cmr ?? false,
                                    isT1: state.details?.t1 ?? false,
                                    isTir: state.details?.tir ?? false,
                                    adr: state.details?.permission ?? [],
                                  ),
                                  AppUtils.kGap8,
                                  _OrderDetailInfoWidget(
                                    details: state.details,
                                  ),
                                  AppUtils.kGap16,
                                  Text(
                                    'company'.tr(),
                                    style: context.textStyle.regularHeadline.copyWith(
                                      color: context.color.textColor,
                                    ),
                                  ),
                                  AppUtils.kGap8,
                                  _OrderCompanyInfoWidget(
                                    companyInfo: state.details?.companyDataEntity,
                                    isForDeal: widget.args?.isForDeal ?? false,
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
        bottomNavigationBar: widget.args?.isForDeal ?? false
            ? const _OrderForDealButton()
            : _SignedOrderButton(
                orderId: widget.args?.orderId ?? '',
                carType: widget.args?.carType ?? '',
              ),
      );
}

// order ichida id
