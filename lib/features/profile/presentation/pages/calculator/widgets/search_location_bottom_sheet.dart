import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/search_widget/flappy_search_bar.dart';
import '../../../../data/models/location_info/location_info.dart';

class SearchLocationBottomSheet extends StatelessWidget {
  const SearchLocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.colorScheme.surface,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            'address'.tr(),
            style: context.textStyle.regularHeadline.copyWith(
              fontSize: 16,
            ),
          ),
        ),
        body: Padding(
          padding: AppUtils.kPaddingHorizontal16,
          child: FlappySearchBar<SearchItem>(
            icon: Icon(
              Icons.search,
              color: context.color.greyText,
            ),
            hintText: 'search'.tr(),
            hintStyle: context.textStyle.regularCallout.copyWith(
              color: context.color.greyText,
            ),
            // placeHolder
            onSearch: (text) async {
              final List<SearchItem> items = await searchByText(text ?? '');
              return items;
            },
            onItemFound: (item, index) => ListTile(
              onTap: () {
                context.pop(
                  LocationInfo(
                    locationName: item?.name ?? '',
                    point: item?.geometry[0].point ?? const Point(latitude: 0, longitude: 0),
                  ),
                );
              },
              title: Text(
                item?.name ?? '',
                style: context.textStyle.regularCallout,
              ),
            ),
            controller: TextEditingController(),
          ),
        ),
      );
}

Future<List<SearchItem>> searchByText(String query) async {
  debugPrint('------ Search query: $query');
  List<SearchItem> items = [];
  final resultWithSession = YandexSearch.searchByText(
    searchText: query,
    geometry: Geometry.fromBoundingBox(
      const BoundingBox(
        southWest: Point(latitude: 37.2, longitude: 56),
        northEast: Point(latitude: 45.6, longitude: 73.2),
      ),
    ),
    searchOptions: const SearchOptions(
      origin: 'Uzbekistan',
      disableSpellingCorrection: true,
      geometry: true,
    ),
  );

  await resultWithSession.result.then(
    (result) {
      if (result.error != null) {
        debugPrint('_handleLocationInfo Error: ${result.error}');
        return null;
      }

      items = result.items ?? [];
    },
  );
  return items;
}
