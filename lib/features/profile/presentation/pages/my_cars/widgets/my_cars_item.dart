import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../domain/entities/get_user_cars_response_entity.dart';

part 'car_info_item_widget.dart';

class MyCarsItem extends StatelessWidget {
  const MyCarsItem({
    super.key,
    required this.onTap,
    required this.userCar,
  });

  final VoidCallback onTap;
  final UserCarEntity? userCar;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: ColoredBox(
          color: context.colorScheme.onPrimary,
          child: Padding(
            padding: AppUtils.kPaddingHor16Ver12,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userCar?.trailerTypeData?.name ?? '',
                  style: context.textStyle.regularHeadline.copyWith(
                    color: context.color.textColor,
                  ),
                ),
                AppUtils.kGap8,
                AppUtils.kDivider,
                AppUtils.kGap8,
                CarItemInfoWidget(
                  type: 'number_vehicle'.tr(),
                  info: userCar?.vehicleNumber ?? '',
                ),
                AppUtils.kGap4,
                CarItemInfoWidget(
                  type: 'load_capacity'.tr(),
                  info: '${userCar?.capacity} т',
                ),
                AppUtils.kGap4,
                CarItemInfoWidget(
                  type: 'volume'.tr(),
                  info: '${userCar?.height} м3',
                ),
                AppUtils.kGap4,
                CarItemInfoWidget(
                  type: 'load_type'.tr(),
                  info: userCar?.loadTypeData?.name ?? '',
                ),
                // Text(
                //   userCar?.loadTypeData?.name ?? '',
                //   style: context.textStyle.size14Weight500Black.copyWith(
                //     color: context.color.darkGrey3,
                //   ),
                // ),
                AppUtils.kGap8,
              ],
            ),
          ),
        ),
      );
}
