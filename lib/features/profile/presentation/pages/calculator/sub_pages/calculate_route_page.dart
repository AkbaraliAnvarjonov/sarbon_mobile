import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../data/models/address/address_model.dart';
import '../page_args/calculate_route_page_arguments.dart';

part '../widgets/address_km_info_widget.dart';

part '../../mixins/calculate_route_mixin.dart';

class CalculateRoutePage extends StatefulWidget {
  const CalculateRoutePage({super.key, required this.arguments});

  final CalculateRoutePageArguments arguments;

  @override
  State<CalculateRoutePage> createState() => _CalculateRoutePageState();
}

class _CalculateRoutePageState extends State<CalculateRoutePage> with CalculateRouteMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('route_calculation'.tr()),
          scrolledUnderElevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(256),
            child: SafeArea(
              minimum: AppUtils.kPaddingAll16,
              child: ClipRRect(
                borderRadius: AppUtils.kBorderRadius12,
                child: SizedBox(
                  height: 240,
                  width: context.kSize.width,
                  child: YandexMap(
                    mapObjects: mapObjects,
                    onMapCreated: (YandexMapController controller) async {
                      final middlePoint = findMidpoint(
                        widget.arguments.startPlaceMark.point,
                        widget.arguments.endPlaceMark.point,
                      );
                      await controller.moveCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: Point(
                              latitude: middlePoint.latitude,
                              longitude: middlePoint.longitude,
                            ),
                            zoom: 7,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: AppUtils.kPaddingAll16,
                sliver: DecoratedSliver(
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: AppUtils.kBorderRadius12,
                  ),
                  sliver: SliverPadding(
                    padding: AppUtils.kPaddingAll24,
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => _AddressKmHourInfoWidget(
                          isTwoItems: widget.arguments.addAdditionalAddresses.length <= 2,
                          addressDistanceTimeModel: addressDistanceTimeModels[index],
                          address: widget.arguments.addAdditionalAddresses[index],
                          isFirstItem: index == 0,
                          isLastItem: index == widget.arguments.addAdditionalAddresses.length - 1,
                        ),
                        childCount: widget.arguments.addAdditionalAddresses.length,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
