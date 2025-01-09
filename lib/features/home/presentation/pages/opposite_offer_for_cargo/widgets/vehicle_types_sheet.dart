import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../constants/icons_constants.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../router/app_routes.dart';
import '../../../bloc/opposite_offer/opposite_offer_bloc.dart';

class ChoseVehicleTypesBottomSheet extends StatelessWidget {
  const ChoseVehicleTypesBottomSheet({
    super.key,
    required this.state,
  });

  final OppositeOfferState state;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.colorScheme.surface,
        appBar: AppBar(
          backgroundColor: context.colorScheme.background,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Text('choose_vehicle'.tr()),
          actions: [
            IconButton(
              icon: Icon(
                Icons.close,
                color: context.colorScheme.onSurface,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: AppUtils.kDivider,
          ),
        ),
        body: ListView.separated(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (_, index) => ListTile(
            contentPadding: AppUtils.kPaddingHorizontal16,
            onTap: () {
              context.read<OppositeOfferBloc>().add(
                    SelectVehicleTypesEvent(
                      vehicleType: (state.vehicleTypes ?? [])[index],
                    ),
                  );
              context.pop();
            },
            title: Padding(
              padding: AppUtils.kPaddingL4,
              child: Text(
                (state.vehicleTypes ?? [])[index].name ?? '',
                style: context.textStyle.size15Weight500Black.copyWith(
                  color: context.color.textColor,
                ),
              ),
            ),
            subtitle: Padding(
              padding: AppUtils.kPaddingL8,
              child: Text(
                '${'number_vehicle'.tr()}: ${(state.vehicleTypes ?? [])[index].carNumber}',
                style: context.textStyle.regularSubheadline.copyWith(
                  color: context.color.greyText,
                ),
              ),
            ),
            leading: SvgPicture.asset(
              state.selectedVehicleType?.guid ==
                      (state.vehicleTypes ?? [])[index].guid
                  ? SvgImage.icRadioOn
                  : SvgImage.icRadioOff,
            ),
          ),
          itemCount: (state.vehicleTypes ?? []).length,
          separatorBuilder: (_, index) => const Padding(
            padding: AppUtils.kPaddingHor16Ver8,
            child: AppUtils.kDivider,
          ),
        ),
        bottomNavigationBar: SafeArea(
          minimum: AppUtils.kPaddingAll16,
          child: ElevatedButton(
            onPressed: () async {
              await context.pushNamed(Routes.addCar).then(
                (value) {
                  if(!context.mounted) return;
                  context.pop();
                  context.read<OppositeOfferBloc>().add(
                        const GetVehicleTypesEvent(),
                      );
                },
              );
            },
            child: Text('add_car'.tr()),
          ),
        ),
      );
}
