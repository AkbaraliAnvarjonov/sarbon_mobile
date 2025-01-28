import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../router/app_routes.dart';
import '../../../bloc/route/routes_bloc.dart';
import 'delete_route_deialog.dart';

part 'routes_button_widget.dart';

part 'routes_item_info_widget.dart';

part 'routes_name_widget.dart';

class RoutesItemWidget extends StatelessWidget {
  const RoutesItemWidget({
    super.key,
    required this.index,
    required this.state,
  });

  final int index;
  final RoutesState state;

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: context.colorScheme.surface,
        child: Padding(
          padding: AppUtils.kPaddingAll16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _RoutesNameWidget(
                fromAddress: state.routes[index].shortFrom,
                toAddress: state.routes[index].shortTo,
                fromCity: state.routes[index].from,
                toCity: state.routes[index].to,
              ),
              AppUtils.kGap4,
              AppUtils.kDivider,
              AppUtils.kGap8,
              _RoutesItemInfoWidget(
                title: '${'date'.tr()}: ',
                value: state.routes[index].date.dateMoth2(),
              ),
              AppUtils.kGap4,
              _RoutesItemInfoWidget(
                title: '${'number_vehicle'.tr()}: ',
                value: state.routes[index].carNumber,
              ),
              AppUtils.kGap4,
              _RoutesItemInfoWidget(
                title: '${'weight'.tr()}: ',
                value: '${state.routes[index].capacity} т',
              ),
              AppUtils.kGap4,
              _RoutesItemInfoWidget(
                title: '${'volume'.tr()}: ',
                value: '${state.routes[index].volume} м³',
              ),
              AppUtils.kGap12,
              Row(
                children: [
                  _RoutesButtonWidget(
                    color: context.colorScheme.error,
                    icon: Icons.delete_outline,
                    onPressed: () async {
                      await showDialog<void>(
                        context: context,
                        builder: (_) => BlocProvider.value(
                          value: context.read<RoutesBloc>(),
                          child: DeleteRouteDialog(
                            routId: state.routes[index].guid,
                          ),
                        ),
                      );
                    },
                    title: 'delete'.tr(),
                  ),
                  AppUtils.kGap8,
                  _RoutesButtonWidget(
                    color: context.colorScheme.primary,
                    icon: Icons.edit,
                    onPressed: () async {
                      await context
                          .pushNamed(
                        Routes.updateRoute,
                        extra: state.routes[index],
                      )
                          .then(
                        (value) {
                          if (value != null && value == true) {
                            if (!context.mounted) return;
                            context.read<RoutesBloc>().add(
                                  const FetchRoutesEvent(),
                                );
                          }
                        },
                      );
                    },
                    title: 'change'.tr(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
