import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/icons_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../router/app_routes.dart';
import '../../../../main/presentation/bloc/main_bloc.dart';
import '../../bloc/home_bloc.dart';
import 'search_address_widget.dart';

part 'cargo_item.dart';

class CargoWidget extends StatelessWidget {
  const CargoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) =>
            previous.searchedCargoItemsRequestEntity != current.searchedCargoItemsRequestEntity,
        listener: (context, state) async {
          if (state.searchedCargoItemsRequestEntity != null) {
            await context
                .pushNamed(
              Routes.searchedCargoResult,
              extra: state.searchedCargoItemsRequestEntity,
            )
                .then(
              (value) {
                if (value != null && value == true) {
                  if (!context.mounted) return;
                  context.read<MainBloc>().add(const MainEventChanged(BottomMenu.orders));
                }
              },
            );
          }
        },
        child: Padding(
          padding: AppUtils.kPaddingL16R16B30,
          child: Material(
            borderRadius: AppUtils.kBorderRadius12,
            color: context.colorScheme.onPrimary,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) => previous.fromAddress != current.fromAddress,
                  builder: (context, state) => CargoItem(
                    onTap: () async {
                      await customModalBottomSheet<void>(
                        context: rootNavigatorKey.currentContext!,
                        builder: (_, controller) => BlocProvider.value(
                          value: context.read<HomeBloc>(),
                          child: SearchAddressWidget(
                            isForInitialPointOfAddress: true,
                            scrollController: controller,
                          ),
                        ),
                        enableDrag: false,
                        isScrollControlled: true,
                      );
                    },
                    title: 'to_where'.tr(),
                    subTitle: state.fromAddress.isNotEmpty ? state.fromAddress : 'enter_address'.tr(),
                    icon: SvgImage.icLocationOn,
                  ),
                ),
                AppUtils.kDivider,
                BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) => previous.toAddress != current.toAddress,
                  builder: (context, state) => CargoItem(
                    onTap: () async {
                      await customModalBottomSheet<void>(
                        context: rootNavigatorKey.currentContext!,
                        builder: (_, controller) => BlocProvider.value(
                          value: context.read<HomeBloc>(),
                          child: SearchAddressWidget(
                            isForInitialPointOfAddress: false,
                            scrollController: controller,
                          ),
                        ),
                        enableDrag: false,
                        isScrollControlled: true,
                      );
                    },
                    title: 'from_where'.tr(),
                    subTitle: state.toAddress.isNotEmpty ? state.toAddress : 'enter_address'.tr(),
                    icon: SvgImage.icLocationOn,
                  ),
                ),
                AppUtils.kDivider,
                // BlocBuilder<HomeBloc, HomeState>(
                //   buildWhen: (previous, current) => previous.dateTime != current.dateTime,
                //   builder: (context, state) => CargoItem(
                //     isDateItem: state.dateTime?.day !=
                //         DateTime.now()
                //             .subtract(
                //               const Duration(days: 3),
                //             )
                //             .day,
                //     onTap: () async {
                //       await customModalBottomSheet<void>(
                //         context: rootNavigatorKey.currentContext!,
                //         builder: (_, controller) => BlocProvider.value(
                //           value: context.read<HomeBloc>(),
                //           child: const SelectDateWidget(),
                //         ),
                //         enableDrag: false,
                //       );
                //     },
                //     title: 'shipment_date'.tr(),
                //     icon: SvgImage.icCalendarToday,
                //     subTitle: state.dateTime != null &&
                //             state.dateTime?.day !=
                //                 DateTime.now()
                //                     .subtract(
                //                       const Duration(days: 3),
                //                     )
                //                     .day
                //         ? state.dateTime?.formatDate
                //         : 'from_today'.tr(),
                //   ),
                // ),
                // AppUtils.kDivider,
                // BlocBuilder<HomeBloc, HomeState>(
                //   builder: (context, state) => Padding(
                //     padding: AppUtils.kPaddingAll12,
                //     child: ElevatedButton(
                //       onPressed: state.fromAddress?.name?.isEmpty ?? true
                //           ? null
                //           : () {
                //               context.read<HomeBloc>().add(
                //                     const SearchButtonPressedEvent(),
                //                   );
                //             },
                //       child: Text(
                //         'find_cargo'.tr(),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
}
