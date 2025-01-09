import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../router/app_routes.dart';
import '../../bloc/route/routes_bloc.dart';
import 'widgets/info_about_route.dart';
import 'widgets/routes_item_widget.dart';

part 'widgets/appbar_widget.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const _AppBarWidget(),
        body: BlocListener<RoutesBloc, RoutesState>(
          listener: (context, state) {
            if (state.deleteRouteStatus.isSuccess) {
              context.read<RoutesBloc>().add(const FetchRoutesEvent());
            }
          },
          child: BlocBuilder<RoutesBloc, RoutesState>(
            builder: (_, state) => state.routes.isEmpty
                    ? Center(
                        child: Padding(
                          padding: AppUtils.kPaddingHorizontal16,
                          child: Text(
                            'empty_route'.tr(),
                            textAlign: TextAlign.center,
                            style: context.textStyle.regularCallout,
                          ),
                        ),
                      )
                    : SafeArea(
                        child: ModalProgressHUD(
                          inAsyncCall: state.fetchRoutesStatus.isLoading,
                          child: ListView.separated(
                            padding: AppUtils.kPaddingVertical24,
                            itemCount: state.routes.length,
                            itemBuilder: (_, index) => RoutesItemWidget(
                              index: index,
                              state: state,
                            ),
                            separatorBuilder: (_, __) => AppUtils.kGap8,
                          ),
                        ),
                      ),
          ),
        ),
      );
}
