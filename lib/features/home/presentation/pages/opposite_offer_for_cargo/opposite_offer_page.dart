import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/icons_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../core/widgets/dialogs/dialogs.dart';
import '../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../router/app_routes.dart';
import '../../../domain/entities/opposite_offer/fetch_currency_entity.dart';
import '../../../domain/entities/opposite_offer/get_vehicle_types_response_entity.dart';
import '../../bloc/opposite_offer/opposite_offer_bloc.dart';
import 'page_arguments/page_arguments.dart';
import 'widgets/vehicle_types_sheet.dart';

part '../mixin/opposite_offer_for_cargo_mixin.dart';

part 'widgets/offer_view_widget.dart';

part 'widgets/opposite_offer_button.dart';

part 'widgets/select_payment_method_widget.dart';

part 'widgets/send_comment_widget.dart';

part 'widgets/vehicle_types_widget.dart';

class OppositeOfferPage extends StatefulWidget {
  const OppositeOfferPage({
    super.key,
    required this.oppositeOfferArgs,
  });

  final OppositeOfferPageArguments oppositeOfferArgs;

  @override
  State<OppositeOfferPage> createState() => _OppositeOfferPageState();
}

class _OppositeOfferPageState extends State<OppositeOfferPage> with OppositeOfferMixin, SingleTickerProviderStateMixin {
  @override
  void initState() {
    initialState(this);
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('counter_offer'.tr()),
        ),
        body: BlocListener<OppositeOfferBloc, OppositeOfferState>(
          listenWhen: (previous, current) =>
              previous.status != current.status || previous.showPercentage != current.showPercentage,
          listener: (context, state) async {
            if (state.status.isSuccess) {
              await showDialog<bool>(
                context: context,
                builder: (_) => const SuccessfulOrPermissionDialog(),
              ).then(
                (value) => Future<void>.delayed(
                  const Duration(
                    milliseconds: 100,
                  ),
                ).then((value) {
                  if (!context.mounted) return;
                  context.pop(true);
                }),
              );
            }
            if (state.showPercentage) {
              prepaymentAmountController.text =
                  (int.tryParse(state.prepaymentCash) ?? 0) >= 100 ? '100' : state.prepaymentCash;
            }
          },
          child: BlocBuilder<OppositeOfferBloc, OppositeOfferState>(
            builder: (context, state) => state.status.isLoading
                ? const Center(child: CircularProgressIndicator.adaptive())
                : CustomScrollView(
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
                                Text(
                                  'transport'.tr(),
                                  style: context.textStyle.regularHeadline.copyWith(
                                    color: context.color.textColor,
                                  ),
                                ),
                                AppUtils.kGap8,
                                const _VehicleTypesWidget(),
                                if (!widget.oppositeOfferArgs.noHaggling) ...[
                                  AppUtils.kGap16,
                                  Text(
                                    'offer'.tr(),
                                    style: context.textStyle.regularHeadline.copyWith(
                                      color: context.color.textColor,
                                    ),
                                  ),
                                  AppUtils.kGap8,
                                  _OfferViewWidget(
                                    isNotDriverCash: false,
                                    amountController: driverCashController,
                                    isShowSuffixWidget: true,
                                    onChanged: (value) {
                                      context.read<OppositeOfferBloc>().add(
                                            ChangeDriverCashEvent(
                                              driverCash: value,
                                            ),
                                          );
                                    },
                                  ),
                                ],
                                AppUtils.kGap16,
                                Text(
                                  'select_payment_method'.tr(),
                                  style: context.textStyle.regularHeadline.copyWith(
                                    color: context.color.textColor,
                                  ),
                                ),
                                AppUtils.kGap8,
                                _SelectPaymentMethodWidget(
                                  animationController: animationController,
                                ),
                                AppUtils.kGap12,
                                SizeTransition(
                                  sizeFactor: animationController,
                                  axisAlignment: -1,
                                  child: _OfferViewWidget(
                                    isNotDriverCash: true,
                                    amountController: prepaymentAmountController,
                                    isShowSuffixWidget: !state.showPercentage,
                                    onChanged: (value) {
                                      context.read<OppositeOfferBloc>().add(
                                            ChangePrepaymentCashEvent(
                                              prepaymentCash: value,
                                            ),
                                          );
                                    },
                                  ),
                                ),
                                AppUtils.kGap16,
                                Text(
                                  'comment'.tr(),
                                  style: context.textStyle.regularHeadline.copyWith(
                                    color: context.color.textColor,
                                  ),
                                ),
                                AppUtils.kGap8,
                                _SendCommentWidget(
                                  commentController: commentController,
                                  driverCommentFocusNode: driverCommentFocusNode,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        bottomNavigationBar: _OppositeOfferButton(
          userId2: widget.oppositeOfferArgs.usersId2,
          noHaggling: widget.oppositeOfferArgs.noHaggling,
          cargoGuid: widget.oppositeOfferArgs.cargoGuid,
          commentController: commentController,
          prepaymentAmountController: prepaymentAmountController,
          driverCashController: driverCashController,
          firmId: widget.oppositeOfferArgs.firmId2,
        ),
      );
}
