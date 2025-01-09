part of 'signed_orders_tab_item.dart';

class _ChooseStatusWidget extends StatelessWidget {
  const _ChooseStatusWidget({
    required this.orderId,
    required this.carType,
    required this.state,
    required this.itemIndex,
  });

  final String orderId;
  final String carType;
  final OrdersState state;
  final int itemIndex;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocListener<OrdersBloc, OrdersState>(
          listenWhen: (previous, current) =>
              previous.orderStatusAndRatingStatus !=
              current.orderStatusAndRatingStatus,
          listener: (context, state) {
            if (state.orderStatusAndRatingStatus.isSuccess) {
              context.pop(
                (state.indicateStatus[state.onTapedIndex] ?? [])
                    .contains('complete_the_order'),
              );
            }
          },
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: AppUtils.kPaddingAll16,
                sliver: SliverList.builder(
                  itemCount: _statuses.length,
                  itemBuilder: (_, index) =>
                      BlocBuilder<OrdersBloc, OrdersState>(
                    buildWhen: (previous, current) =>
                        previous.selectedStatusIndex !=
                        current.selectedStatusIndex,
                    builder: (context, state) => CustomStepWidget(
                      onTap: () {
                        context.read<OrdersBloc>().add(
                              SelectStatusEvent(
                                itemIndex: itemIndex,
                                index: index ==
                                        (state.selectedStatusIndex[itemIndex] ??
                                            -1)
                                    ? index - 1
                                    : index,
                              ),
                            );
                      },
                      isSelected:
                          index <= (state.selectedStatusIndex[itemIndex] ?? -1),
                      status: _statuses[index].name,
                      isLast: index == _statuses.length - 1,
                      isFirst: index == 0,
                    ),
                  ),
                ),
              ),
              BlocBuilder<OrdersBloc, OrdersState>(
                buildWhen: (previous, current) =>
                    previous.isBreakdownSelected != current.isBreakdownSelected,
                builder: (context, state) => AccidentButton(
                  status: 'breaking'.tr(),
                  onTap: () async {
                    if (!(state.isBreakdownSelected[itemIndex] ?? false)) {
                      await showDialog<void>(
                        context: context,
                        builder: (_) => WarningAccidentDialog(
                          onConfirm: () {
                            context.read<OrdersBloc>().add(
                                  SelectBreakdownEvent(
                                    status: !(state
                                            .isBreakdownSelected[itemIndex] ??
                                        false),
                                    index: itemIndex,
                                  ),
                                );
                            context.pop();
                          },
                          subTitle: '${'do_you_really_want_to_indicate'.tr()}? '
                              '(${'breaking'.tr()})',
                        ),
                      );
                    } else {
                      context.read<OrdersBloc>().add(
                            SelectBreakdownEvent(
                              status: !(state.isBreakdownSelected[itemIndex] ??
                                  false),
                              index: itemIndex,
                            ),
                          );
                    }
                  },
                  isSelected: state.isBreakdownSelected[itemIndex] ?? false,
                ),
              ),
              AppUtils.kSliverGap16,
              const SliverPadding(
                padding: AppUtils.kPaddingHorizontal16,
                sliver: AppUtils.kSliverDivider,
              ),
              AppUtils.kSliverGap16,
              BlocBuilder<OrdersBloc, OrdersState>(
                buildWhen: (previous, current) =>
                    previous.isAccidentSelected != current.isAccidentSelected,
                builder: (context, state) => AccidentButton(
                  status: 'road_accident'.tr(),
                  onTap: () async {
                    if (!(state.isAccidentSelected[itemIndex] ?? false)) {
                      await showDialog<void>(
                        context: context,
                        builder: (_) => WarningAccidentDialog(
                          onConfirm: () {
                            context.read<OrdersBloc>().add(
                                  SelectAccidentEvent(
                                    status:
                                        !(state.isAccidentSelected[itemIndex] ??
                                            false),
                                    index: itemIndex,
                                  ),
                                );
                            context.pop();
                          },
                          subTitle: '${'do_you_really_want_to_indicate'.tr()}? '
                              '(${'accident'.tr()})',
                        ),
                      );
                    } else {
                      context.read<OrdersBloc>().add(
                            SelectAccidentEvent(
                              status: !(state.isAccidentSelected[itemIndex] ??
                                  false),
                              index: itemIndex,
                            ),
                          );
                    }
                  },
                  isSelected: state.isAccidentSelected[itemIndex] ?? false,
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
        bottomNavigationBar: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) => SafeArea(
            child: Padding(
              padding: AppUtils.kPaddingAll16,
              child: ElevatedButton(
                onPressed: (state.indicateStatus[itemIndex] ?? []).isEmpty
                    ? null
                    : () {
                        context.read<OrdersBloc>().add(
                              PutOrderStatusEvent(
                                orderId: orderId,
                                carType: carType,
                              ),
                            );
                      },
                child: state.status.isLoading
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : Text(
                        'confirm'.tr(),
                      ),
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
