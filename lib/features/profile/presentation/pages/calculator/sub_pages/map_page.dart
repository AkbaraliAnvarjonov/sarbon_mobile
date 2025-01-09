import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../../../constants/icons_constants.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/mixins/location_mixin.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../data/models/address/address_model.dart';
import '../../../../data/models/location_info/location_info.dart';
import '../page_args/map_page_arguments.dart';
import '../widgets/search_location_bottom_sheet.dart';

part '../../mixins/map_for_calculator_mixin.dart';

part '../widgets/back_button_widget.dart';

part '../widgets/map_mark_widget.dart';

part '../widgets/map_zoom_button_widget.dart';

part '../widgets/near_me_button_widget.dart';

class MapForCalculatorPage extends StatefulWidget {
  const MapForCalculatorPage({
    super.key,
    required this.arguments,
  });

  final MapPageArguments arguments;

  @override
  State<MapForCalculatorPage> createState() => _MapForCalculatorPageState();
}

class _MapForCalculatorPageState extends State<MapForCalculatorPage> with MapForCalculatorMixin {
  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        child: Scaffold(
          body: Stack(
            children: [
              YandexMap(
                onMapCreated: (YandexMapController controller) async {
                  _yandexMapController.complete(controller);
                  await (await _yandexMapController.future).moveCamera(
                    animation: const MapAnimation(duration: 1),
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        zoom: 16,
                        target: Point(
                          latitude: widget.arguments.userLatitude,
                          longitude: widget.arguments.userLongitude,
                        ),
                      ),
                    ),
                  );
                },
                onCameraPositionChanged: (cameraPosition, reason, finished) async {
                  if (finished) {
                    final search = YandexSearch.searchByPoint(
                      point: cameraPosition.target,
                      searchOptions: const SearchOptions(
                        searchType: SearchType.geo,
                      ),
                    );
                    _searchedLocation.value = await _getFindLocationName(search);
                    _addressController.text = _searchedLocation.value.address;
                  }
                },
              ),
              const _MapMarkIconWidget(),
              const _BackButtonWidget(),
              _MapZoomChangeButtonWidget(
                yandexMapController: _yandexMapController,
              ),
              _NearMeButtonWidget(
                yandexMapController: _yandexMapController,
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: context.kSize.width,
                  height: context.kSize.height / 4,
                  child: Material(
                    borderRadius: AppUtils.kBorderTopRadius24,
                    color: context.colorScheme.surface,
                    child: Padding(
                      padding: AppUtils.kPaddingAll16,
                      child: ValueListenableBuilder<SearchedLocation>(
                        valueListenable: _searchedLocation,
                        builder: (context, value, child) => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Адрес'),
                            AppUtils.kGap16,
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: context.color.borderColor,
                                ),
                                borderRadius: AppUtils.kBorderRadius8,
                              ),
                              child: CustomTextField(
                                onTap: () async {
                                  final result = await customModalBottomSheet<LocationInfo>(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (_, controller) => const SearchLocationBottomSheet(),
                                  );
                                  if (result != null) {
                                    _addressController.text = result.locationName;
                                    await (await _yandexMapController.future).moveCamera(
                                      CameraUpdate.newCameraPosition(
                                        CameraPosition(zoom: 14, target: result.point),
                                      ),
                                    );
                                  }
                                },
                                contentPadding: AppUtils.kPaddingHorizontal8,
                                maxLines: 2,
                                hintText: 'Страна, Город',
                                controller: _addressController,
                                readOnly: true,
                                // enabled: false,
                                fillColor: Colors.transparent,
                              ),
                            ),
                            AppUtils.kGap16,
                            ElevatedButton(
                              onPressed: () {
                                context.pop(
                                  AddressModel(
                                    name: value.address,
                                    latitude: value.latitude,
                                    longitude: value.longitude,
                                  ),
                                );
                              },
                              child: const Text('Подтвердить'),
                            ),
                          ],
                        ),
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
