import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../bloc/order_detail/order_details_bloc.dart';
import '../../widgets/accident_button.dart';
import '../../widgets/custom_step_widget.dart';
import '../../widgets/warning_dialog.dart';

class ChooseStatusForDetailPageWidget extends StatelessWidget {
  const ChooseStatusForDetailPageWidget({
    super.key,
    required this.orderId,
    required this.carType,
  });

  final String orderId;
  final String carType;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocListener<OrderDetailsBloc, OrderDetailsState>(
          listenWhen: (previous, current) => previous.orderDetailStatus != current.orderDetailStatus,
          listener: (context, state) {
            if (state.orderDetailStatus.isSuccess) {
              context.pop(
                state.indicateStatus.contains('complete_the_order'),
              );
            }
          },
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: AppUtils.kPaddingAll16,
                sliver: SliverList.builder(
                  itemCount: _statuses.length,
                  itemBuilder: (_, index) => BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
                    buildWhen: (previous, current) => previous.selectedStatusIndex != current.selectedStatusIndex,
                    builder: (context, state) => CustomStepWidget(
                      onTap: () {
                        context.read<OrderDetailsBloc>().add(
                              SelectStatusEvent(
                                index: index == state.selectedStatusIndex ? index - 1 : index,
                              ),
                            );
                      },
                      isSelected: index <= state.selectedStatusIndex,
                      status: _statuses[index].name,
                      isLast: index == _statuses.length - 1,
                      isFirst: index == 0,
                    ),
                  ),
                ),
              ),
              BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
                buildWhen: (previous, current) => previous.isBreakdownSelected != current.isBreakdownSelected,
                builder: (context, state) => AccidentButton(
                  status: 'breaking'.tr(),
                  onTap: () async {
                    if (!state.isBreakdownSelected) {
                      await showDialog<void>(
                        context: context,
                        builder: (_) => WarningAccidentDialog(
                          onConfirm: () {
                            context.read<OrderDetailsBloc>().add(
                                  SelectBreakdownEvent(
                                    status: !state.isBreakdownSelected,
                                  ),
                                );
                            context.pop();
                          },
                          subTitle: '${'do_you_really_want_to_indicate'.tr()}? '
                              '(${'breaking'.tr()})',
                        ),
                      );
                    } else {
                      context.read<OrderDetailsBloc>().add(
                            SelectBreakdownEvent(
                              status: !state.isBreakdownSelected,
                            ),
                          );
                    }
                  },
                  isSelected: state.isBreakdownSelected,
                ),
              ),
              AppUtils.kSliverGap16,
              const SliverPadding(
                padding: AppUtils.kPaddingHorizontal16,
                sliver: AppUtils.kSliverDivider,
              ),
              AppUtils.kSliverGap16,
              BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
                buildWhen: (previous, current) => previous.isAccidentSelected != current.isAccidentSelected,
                builder: (context, state) => AccidentButton(
                  status: 'road_accident'.tr(),
                  onTap: () async {
                    if (!state.isAccidentSelected) {
                      await showDialog<void>(
                        context: context,
                        builder: (_) => WarningAccidentDialog(
                          onConfirm: () {
                            context.read<OrderDetailsBloc>().add(
                                  SelectAccidentEvent(
                                    status: !state.isAccidentSelected,
                                  ),
                                );
                            context.pop();
                          },
                          subTitle: '${'do_you_really_want_to_indicate'.tr()}? '
                              '(${'accident'.tr()})',
                        ),
                      );
                    } else {
                      context.read<OrderDetailsBloc>().add(
                            SelectAccidentEvent(
                              status: !state.isAccidentSelected,
                            ),
                          );
                    }
                  },
                  isSelected: state.isAccidentSelected,
                ),
              ),
              AppUtils.kSliverGap16,
              const SliverPadding(
                padding: AppUtils.kPaddingHorizontal16,
                sliver: AppUtils.kSliverDivider,
              ),
              AppUtils.kSliverGap12,
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: AppUtils.kPaddingAll16,
            child: BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
              buildWhen: (previous, current) => previous.orderDetailStatus != current.orderDetailStatus,
              builder: (context, state) => ElevatedButton(
                onPressed: state.orderDetailStatus.isLoading
                    ? null
                    : () {
                        context.read<OrderDetailsBloc>().add(
                              PutOrderStatusEvent(
                                orderId: orderId,
                              ),
                            );
                      },
                child:
                    state.orderDetailStatus.isLoading ? const CircularProgressIndicator.adaptive() : Text('send'.tr()),
              ),
            ),
          ),
        ),
      );
}

class _StatusNameAndSlug {
  const _StatusNameAndSlug({
    required this.name,
    required this.slug,
  });

  final String name;
  final String slug;
}

final List<_StatusNameAndSlug> _statuses = [
  const _StatusNameAndSlug(
    name: 'no_status',
    slug: 'no_status',
  ),
  const _StatusNameAndSlug(
    name: 'go_to_load',
    slug: 'go_to_load',
  ),
  const _StatusNameAndSlug(
    name: 'wait_for_the_download',
    slug: 'wait_for_the_download',
  ),
  const _StatusNameAndSlug(
    name: 'loading',
    slug: 'loading',
  ),
  const _StatusNameAndSlug(
    name: 'go_to_unload',
    slug: 'go_to_unload',
  ),
  const _StatusNameAndSlug(
    name: 'unloading',
    slug: 'unloading',
  ),
  const _StatusNameAndSlug(
    name: 'unloaded',
    slug: 'unloaded',
  ),
  const _StatusNameAndSlug(
    name: 'complete_the_order',
    slug: 'complete_the_order',
  ),
];
