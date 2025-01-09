import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../bloc/orders_bloc.dart';

part 'orders_tab_widget.dart';

class OrdersTabBarWidget extends StatelessWidget {
  const OrdersTabBarWidget({
    super.key,
    required this.newOrdersCount,
    required this.signedOrdersCount,
    required this.tabController,
    required this.index,
  });

  final int newOrdersCount;
  final int signedOrdersCount;
  final TabController tabController;
  final int index;

  @override
  Widget build(BuildContext context) => TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        controller: tabController,
        padding: AppUtils.kPaddingHor12Ver16,
        labelPadding: AppUtils.kPaddingHorizontal4,
        labelColor: context.colorScheme.onPrimary,
        labelStyle: context.textStyle.size15Weight600Black,
        unselectedLabelColor: context.color.darkGrey1,
        unselectedLabelStyle: context.textStyle.size14Weight400Black,
        indicator: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: AppUtils.kBorderRadius12,
        ),
        onTap: (value) {},
        tabs: [
          OrderTabWidget(
            title: '${'coordination'.tr()}${newOrdersCount == 0 ? '' : ' ($newOrdersCount)'}',
            isActive: index == 0,
          ),
          OrderTabWidget(
            title: '${'in_execution'.tr()}${signedOrdersCount == 0 ? '' : ' ($signedOrdersCount)'}',
            isActive: index == 1,
          ),
          OrderTabWidget(
            title: 'completed'.tr(),
            isActive: index == 2,
          ),
          OrderTabWidget(
            title: 'canceled'.tr(),
            isActive: index == 3,
          ),
        ],
      );
}
