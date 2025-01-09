import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../constants/icons_constants.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../../router/app_routes.dart';
import '../../../../data/models/apply_filter/apply_filter_request.dart';
import '../../../../domain/entities/types_cargo/types_cargo_entity.dart';
import '../../../../domain/entities/types_payment/types_payment_entity.dart';
import '../../../bloc/home_bloc.dart';
import '../../widgets/cargo_widget.dart';
import '../../widgets/search_address_widget.dart';

part 'drop_down_widget.dart';

part 'custom_checkbox.dart';

class FilterCargoBottomSheet extends StatefulWidget {
  const FilterCargoBottomSheet({super.key});

  @override
  State<FilterCargoBottomSheet> createState() => _FilterCargoBottomSheetState();
}

class _FilterCargoBottomSheetState extends State<FilterCargoBottomSheet> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _volumeController = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isSuccess) {
            context.pop();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('filter'.tr()),
            leading: IconButton(
              icon: Icon(
                Icons.close,
                color: context.colorScheme.onSurface,
              ),
              onPressed: () => context.pop(),
            ),
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
                            AppUtils.kGap6,
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
                            AppUtils.kGap6,
                            Text(
                              'type_cargo'.tr(),
                              style: context.textStyle.size14Weight500Black.copyWith(
                                color: context.color.gray700,
                              ),
                            ),
                            AppUtils.kGap6,
                            const _DropDownCargoTypeWidget2(),
                            AppUtils.kGap12,
                            Text(
                              'view_cargo'.tr(),
                              style: context.textStyle.size14Weight500Black.copyWith(
                                color: context.color.gray700,
                              ),
                            ),
                            AppUtils.kGap6,
                            Row(
                              children: [
                                SizedBox(
                                  width: context.kSize.width / 2 - 20,
                                  child: _CustomCheckBoxWidget(
                                    onTap: () {
                                      context.read<HomeBloc>().add(
                                            ChangeTypeOfCargoEvent(
                                              isTakeAllUnloads: !state.isTakeAllUnloads,
                                              isLoadAroundTheClock: false,
                                            ),
                                          );
                                    },
                                    isChecked: state.isTakeAllUnloads,
                                    title: 'separated_vehicle'.tr(),
                                  ),
                                ),
                                AppUtils.kGap8,
                                SizedBox(
                                  width: context.kSize.width / 2 - 20,
                                  child: _CustomCheckBoxWidget(
                                    onTap: () {
                                      context.read<HomeBloc>().add(
                                            ChangeTypeOfCargoEvent(
                                              isTakeAllUnloads: false,
                                              isLoadAroundTheClock: !state.isLoadAroundTheClock,
                                            ),
                                          );
                                    },
                                    isChecked: state.isLoadAroundTheClock,
                                    title: 'loading_possible'.tr(),
                                  ),
                                ),
                              ],
                            ),
                            AppUtils.kGap12,
                            Text(
                              'payment_type'.tr(),
                              style: context.textStyle.size14Weight500Black.copyWith(
                                color: context.color.gray700,
                              ),
                            ),
                            AppUtils.kGap6,
                            const _DropDownPaymentTypeWidget(),
                            AppUtils.kGap12,
                            Text(
                              'weight_cargo'.tr(),
                              style: context.textStyle.size14Weight500Black.copyWith(
                                color: context.color.gray700,
                              ),
                            ),
                            AppUtils.kGap6,
                            CustomTextField(
                              controller: _weightController,
                              textInputType: TextInputType.number,
                              textInputFormatter: FilteringTextInputFormatter.digitsOnly,
                              contentPadding: AppUtils.kPaddingHorizontal12,
                              hintText: 'write_weight_of_cargo'.tr(),
                              fillColor: context.colorScheme.surface,
                              onChanged: (value) {
                                context.read<HomeBloc>().add(
                                      ChangeWeightEvent(
                                        weight: value,
                                      ),
                                    );
                              },
                              showBorder: false,
                            ),
                            AppUtils.kGap12,
                            Text(
                              'volume_cargo'.tr(),
                              style: context.textStyle.size14Weight500Black.copyWith(
                                color: context.color.gray700,
                              ),
                            ),
                            AppUtils.kGap6,
                            CustomTextField(
                              controller: _volumeController,
                              textInputType: TextInputType.number,
                              textInputFormatter: FilteringTextInputFormatter.digitsOnly,
                              contentPadding: AppUtils.kPaddingHorizontal12,
                              hintText: 'write_volume_cargo'.tr(),
                              fillColor: context.colorScheme.surface,
                              onChanged: (value) {
                                context.read<HomeBloc>().add(
                                      ChangeVolumeEvent(
                                        volume: value,
                                      ),
                                    );
                              },
                              showBorder: false,
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
                    ? null
                    : () {
                        context.read<HomeBloc>().add(
                              ApplyFilterEvent(
                                request: ApplyFilterRequest(
                                  withRelations: true,
                                  cargoTypeId: state.selectedTypeCargo?.guid,
                                  loadAroundTheClock: state.isLoadAroundTheClock,
                                  takeAllUnloads: state.isTakeAllUnloads,
                                  mapId: state.selectedTypePayment?.guid,
                                  volumeM3:
                                      _volumeController.text.isEmpty ? null : double.parse(_volumeController.text),
                                  weight: _weightController.text.isEmpty ? null : double.parse(_weightController.text),
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
