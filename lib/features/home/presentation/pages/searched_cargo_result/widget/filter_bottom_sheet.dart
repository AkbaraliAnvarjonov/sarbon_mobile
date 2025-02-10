import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sarbon_mobile/features/home/presentation/pages/searched_cargo_result/widget/select_vehicle.dart';

import '../../../../../../constants/icons_constants.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../../router/app_routes.dart';
import '../../../../data/models/apply_filter/apply_filter_request.dart';
import '../../../../domain/entities/types_cargo/types_cargo_entity.dart';
import '../../../bloc/home_bloc.dart';
import '../../widgets/filter_item.dart';
import '../../widgets/search_address_widget.dart';
import '../../widgets/vehicle_select_bottom_sheet.dart';

part 'drop_down_widget.dart';

part 'custom_checkbox.dart';

class FilterCargoBottomSheet extends StatefulWidget {
  const FilterCargoBottomSheet({super.key});

  @override
  State<FilterCargoBottomSheet> createState() => _FilterCargoBottomSheetState();
}

class _FilterCargoBottomSheetState extends State<FilterCargoBottomSheet> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _weightController2 = TextEditingController();
  final TextEditingController _volumeController = TextEditingController();
  final TextEditingController _volumeController2 = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isSuccess) {
            context.pop();
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: context.color.bg2,
            title: Text('filter'.tr()),
            automaticallyImplyLeading: false,
            centerTitle: false,
            actions: [
              Padding(
                padding: AppUtils.kPaddingAll4,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: context.colorScheme.onSurface,
                  ),
                  onPressed: () => context.pop(),
                ),
              ),
            ],
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              _weightController.text = state.saveWeight;
              _volumeController.text = state.saveVolume;
              return ModalProgressHUD(
                inAsyncCall: state.fetchCargoAndPaymentStatus.isLoading || state.status.isLoading,
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: AppUtils.kPaddingAll16,
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            AppUtils.kGap24,
                            BlocBuilder<HomeBloc, HomeState>(
                              buildWhen: (previous, current) => previous.fromAddress != current.fromAddress,
                              builder: (context, state) => FilterItem(
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
                                trailing: GestureDetector(
                                  onTap: () {
                                    context.read<HomeBloc>().add(const HomeEventClearFromAddress());
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: context.colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ),
                            AppUtils.kGap40,
                            BlocBuilder<HomeBloc, HomeState>(
                              buildWhen: (previous, current) => previous.toAddress != current.toAddress,
                              builder: (context, state) => FilterItem(
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
                                trailing: GestureDetector(
                                  onTap: () {
                                    context.read<HomeBloc>().add(const HomeEventClearToAddress());
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: context.colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ),
                            AppUtils.kGap40,
                            Text(
                              'transport'.tr(),
                              style: context.textStyle.size14Weight500Black.copyWith(
                                color: context.color.gray700,
                              ),
                            ),
                            AppUtils.kGap6,
                            SelectVehicleWidget(
                              title: state.selectedTrailers.isEmpty
                                  ? 'Все типы'
                                  : state.selectedTrailers.map((type) => type.fullName ?? '').join(', '),
                              onTap: () async {
                                await customModalBottomSheet<void>(
                                  context: rootNavigatorKey.currentContext!,
                                  builder: (_, controller) => BlocProvider.value(
                                    value: context.read<HomeBloc>(),
                                    child: SelectVehicleBottomSheet(
                                      isForInitialPointOfAddress: false,
                                      scrollController: controller,
                                    ),
                                  ),
                                  enableDrag: false,
                                  isScrollControlled: true,
                                );
                              },
                            ),

                            // const _DropDownCargoTypeWidget2(),
                            AppUtils.kGap12,
                            // Text(
                            //   'view_cargo'.tr(),
                            //   style: context.textStyle.size14Weight500Black.copyWith(
                            //     color: context.color.gray700,
                            //   ),
                            // ),
                            // AppUtils.kGap6,
                            // Row(
                            //   children: [
                            //     SizedBox(
                            //       width: context.kSize.width / 2 - 20,
                            //       child: _CustomCheckBoxWidget(
                            //         onTap: () {
                            //           context.read<HomeBloc>().add(
                            //                 ChangeTypeOfCargoEvent(
                            //                   isTakeAllUnloads: !state.isTakeAllUnloads,
                            //                   isLoadAroundTheClock: false,
                            //                 ),
                            //               );
                            //         },
                            //         isChecked: state.isTakeAllUnloads,
                            //         title: 'separated_vehicle'.tr(),
                            //       ),
                            //     ),
                            //     AppUtils.kGap8,
                            //     SizedBox(
                            //       width: context.kSize.width / 2 - 20,
                            //       child: _CustomCheckBoxWidget(
                            //         onTap: () {
                            //           context.read<HomeBloc>().add(
                            //                 ChangeTypeOfCargoEvent(
                            //                   isTakeAllUnloads: false,
                            //                   isLoadAroundTheClock: !state.isLoadAroundTheClock,
                            //                 ),
                            //               );
                            //         },
                            //         isChecked: state.isLoadAroundTheClock,
                            //         title: 'loading_possible'.tr(),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            AppUtils.kGap40,

                            // Text(
                            //   'weight_cargo'.tr(),
                            //   style: context.textStyle.size14Weight500Black.copyWith(
                            //     color: context.color.gray700,
                            //   ),
                            // ),
                            AppUtils.kGap6,
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    labelText: 'Объём от:',
                                    showEnabledBorder: true,
                                    fillColor: context.color.bg2,
                                    controller: _volumeController,
                                    textInputType: TextInputType.number,
                                    textInputFormatter: FilteringTextInputFormatter.digitsOnly,
                                    contentPadding: AppUtils.kPaddingAll16,
                                    hintText: 'мин',
                                    hintTextStyle: context.textStyle.size14Weight400Black.copyWith(
                                      color: const Color(0xFF7E7B86),
                                    ),
                                    onChanged: (value) {
                                      context.read<HomeBloc>().add(
                                            ChangeVolumeEvent(
                                              volume: value,
                                            ),
                                          );
                                    },
                                    showBorder: false,
                                  ),
                                ),
                                AppUtils.kGap20,
                                Expanded(
                                  child: CustomTextField(
                                    labelText: 'Объём до:',
                                    controller: _volumeController2,
                                    showEnabledBorder: true,
                                    fillColor: context.color.bg2,
                                    textInputType: TextInputType.number,
                                    textInputFormatter: FilteringTextInputFormatter.digitsOnly,
                                    contentPadding: AppUtils.kPaddingAll16,
                                    hintText: 'макс',
                                    hintTextStyle: context.textStyle.size14Weight400Black.copyWith(
                                      color: const Color(0xFF7E7B86),
                                    ),
                                    onChanged: (value) {
                                      context.read<HomeBloc>().add(ChangeVolume2Event(volume: value));
                                    },
                                    showBorder: false,
                                  ),
                                ),
                              ],
                            ),

                            AppUtils.kGap40,
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    labelText: 'Вес:',
                                    showEnabledBorder: true,
                                    controller: _weightController,
                                    textInputType: TextInputType.number,
                                    textInputFormatter: FilteringTextInputFormatter.digitsOnly,
                                    contentPadding: AppUtils.kPaddingAll16,
                                    hintText: 'мин',
                                    hintTextStyle: context.textStyle.size14Weight400Black.copyWith(
                                      color: const Color(0xFF7E7B86),
                                    ),
                                    fillColor: context.color.bg2,
                                    onChanged: (value) {
                                      context.read<HomeBloc>().add(ChangeWeightEvent(weight: value));
                                    },
                                    showBorder: false,
                                  ),
                                ),
                                AppUtils.kGap20,
                                Expanded(
                                  child: CustomTextField(
                                    labelText: 'Вес до:',
                                    showEnabledBorder: true,
                                    controller: _weightController2,
                                    textInputType: TextInputType.number,
                                    textInputFormatter: FilteringTextInputFormatter.digitsOnly,
                                    contentPadding: AppUtils.kPaddingAll16,
                                    hintText: 'макс',
                                    hintTextStyle: context.textStyle.size14Weight400Black.copyWith(
                                      color: const Color(0xFF7E7B86),
                                    ),
                                    fillColor: context.color.bg2,
                                    onChanged: (value) {
                                      context.read<HomeBloc>().add(ChangeWeight2Event(weight: value));
                                    },
                                    showBorder: false,
                                  ),
                                ),
                              ],
                            ),

                            AppUtils.kGap40,
                            Text(
                              'payment_type'.tr(),
                              style: context.textStyle.size14Weight500Black.copyWith(
                                color: context.color.gray700,
                              ),
                            ),
                            AppUtils.kGap6,
                            // const _DropDownPaymentTypeWidget(),

                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: state.typesPayment.map((type) {
                                final isSelected = state.selectedTypePayment?.guid == type.guid;
                                return GestureDetector(
                                  onTap: () {
                                    context.read<HomeBloc>().add(
                                          SelectedPaymentTypeEvent(
                                            selectedTypePayment: type,
                                          ),
                                        );
                                  },
                                  child: Container(
                                    padding: AppUtils.kPaddingHor10Ver6,
                                    decoration: BoxDecoration(
                                      color: isSelected ? context.color.blue : context.color.quatGrey,
                                      borderRadius: AppUtils.kBorderRadius20,
                                    ),
                                    child: Text(
                                      type.paymentType,
                                      style: context.textStyle.size14Weight400Black.copyWith(
                                        fontSize: 14,
                                        color: isSelected ? Colors.white : Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) => SafeArea(
              minimum: AppUtils.kPaddingAll16,
              child: ElevatedButton(
                onPressed: state.isFilterEmpty
                    ? () {
                        context.read<HomeBloc>().add(const RemoveFilterEvent());
                      }
                    : () {
                        context.read<HomeBloc>().add(
                              ApplyFilterEvent(
                                request: ApplyFilterRequest(
                                  withRelations: true,
                                  cargoTypeId: state.selectedTrailers.map((type) => type.guid ?? '').toList(),
                                  loadAroundTheClock: state.isLoadAroundTheClock,
                                  takeAllUnloads: state.isTakeAllUnloads,
                                  mapId: state.selectedTypePayment?.guid,
                                  volumeM3:
                                      _volumeController.text.isEmpty ? null : double.parse(_volumeController.text),
                                  volumeM32:
                                      _volumeController2.text.isEmpty ? null : double.parse(_volumeController2.text),
                                  weight: _weightController.text.isEmpty ? null : double.parse(_weightController.text),
                                  weight2:
                                      _weightController2.text.isEmpty ? null : double.parse(_weightController2.text),
                                  cityId: state.fromAddress.isNotEmpty ? state.fromAddress : null,
                                  cityId2: state.toAddress.isNotEmpty ? state.toAddress : null,
                                ),
                              ),
                            );
                      },
                child: Text('apply'.tr()),
              ),
            ),
          ),
        ),
      );
}
