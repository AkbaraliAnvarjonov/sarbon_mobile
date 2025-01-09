import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/image_constants.dart';
import '../../../../../core/debaouncer/debouncer.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../router/app_routes.dart';
import '../../../domain/entities/get_cargo_types_response_entity.dart';
import '../../../domain/entities/get_load_types_response_entity.dart';
import '../../../domain/entities/get_trailer_types_response_entity.dart';
import '../../bloc/my_cars/my_cars_bloc.dart';
import '../pages_arguments/edit_page_args.dart';
import 'widgets/my_cars_item.dart';

part '../mixins/my_cars_mixin.dart';

part 'widgets/active_cars_tab_item.dart';

part 'widgets/archive_tab_item.dart';

part 'widgets/my_cars_tab_bar_widget.dart';

class MyCarsPage extends StatefulWidget {
  const MyCarsPage({super.key});

  @override
  State<MyCarsPage> createState() => MyCarsPageState();
}

class MyCarsPageState extends State<MyCarsPage> with MyCarsMixin, SingleTickerProviderStateMixin {
  @override
  void initState() {
    context.read<MyCarsBloc>().add(const InitialEvent());
    initControllers(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<MyCarsBloc, MyCarsState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: Text('my_cars'.tr()),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(68),
              child: MyCarsTabBarWidget(
                tabController: tabController,
                tabIndex: state.tabIndex,
                activeCarsCount: state.activeCarsCount,
                inActiveCarsCount: state.inActiveCarsCount,
              ),
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
              ActiveCarsTabItem(scrollController: activeScrollController),
              InActiveCarsTabItem(inActiveScrollController: inActiveScrollController),
            ],
          ),
          bottomNavigationBar: Visibility(
            visible: !state.status.isLoading &&
                (state.activeCars?.isNotEmpty ?? false) &&
                (state.activeCars?.length ?? 0) == 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.onPrimary,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(2, 0),
                    blurRadius: 14,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                  ),
                ],
              ),
              child: BlocBuilder<MyCarsBloc, MyCarsState>(
                buildWhen: (previous, current) => previous.status != current.status,
                builder: (context, state) => SafeArea(
                  minimum: AppUtils.kPaddingAll16,
                  child: ElevatedButton(
                    onPressed: state.status.isLoading
                        ? null
                        : () async {
                            await context.pushNamed(Routes.addCar).then(
                              (value) {
                                if (value != null && value is bool && value) {
                                  if(!context.mounted) return;
                                  context.read<MyCarsBloc>().add(
                                        const GetActiveCarsEvent(),
                                      );
                                }
                              },
                            );
                          },
                    child: Text('add_car'.tr()),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
