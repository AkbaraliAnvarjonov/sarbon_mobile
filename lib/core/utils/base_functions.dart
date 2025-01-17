part of 'utils.dart';

final String defaultSystemLocale = Platform.localeName.split('_').first;

String get defaultLocale => switch (defaultSystemLocale) {
      'ru' => 'ru',
      'en' => 'en',
      'uz' => 'uz',
      'tr' => 'tr',
      'zh' => 'zh',
      _ => 'ru',
    };

String get defaultTheme => SchedulerBinding.instance.platformDispatcher.platformBrightness.name;

String phoneFormat(String phone) {
  if (phone.length >= 13) {
    String t = phone;
    t = t.replaceAll('+998', '');
    t = '${t.substring(0, 2)} ${t.substring(2, 5)} ${t.substring(5, 7)} ${t.substring(7, 9)}';
    return '+998 $t';
  } else {
    return phone;
  }
}

Future<List<SearchItem>> searchByText(String query) async {
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

String getLocalizedName(Map<String, dynamic> json, String keyWord) =>
    json['${keyWord}_${localSource.locale}'] ?? json[keyWord] ?? '';
