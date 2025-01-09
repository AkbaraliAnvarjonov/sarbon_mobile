part of '../sub_pages/map_page.dart';

class _NearMeButtonWidget extends StatelessWidget {
  const _NearMeButtonWidget({
    required this.yandexMapController,
  });

  final Completer<YandexMapController> yandexMapController;

  @override
  Widget build(BuildContext context) => Positioned(
        bottom: context.kSize.height / 4 + 16,
        right: 16,
        child: GestureDetector(
          onTap: () async {
            final pos = await LocationMixin.instance.determinePosition();
            await (await yandexMapController.future).moveCamera(
              animation: const MapAnimation(duration: 1),
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  zoom: 16,
                  target: Point(
                    latitude: pos.latitude,
                    longitude: pos.longitude,
                  ),
                ),
              ),
            );
          },
          child: CircleAvatar(
            radius: 24,
            backgroundColor: context.colorScheme.surface,
            child: Icon(
              Icons.near_me_outlined,
              color: context.color.ink,
            ),
          ),
        ),
      );
}
