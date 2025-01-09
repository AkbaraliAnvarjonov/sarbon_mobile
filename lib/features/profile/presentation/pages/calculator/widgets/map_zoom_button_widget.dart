part of '../sub_pages/map_page.dart';

class _MapZoomChangeButtonWidget extends StatelessWidget {
  const _MapZoomChangeButtonWidget({
    required this.yandexMapController,
  });

  final Completer<YandexMapController> yandexMapController;

  @override
  Widget build(BuildContext context) => Positioned(
        right: 16,
        bottom: context.kSize.height / 2,
        child: Material(
          borderRadius: AppUtils.kBorderRadius8,
          color: context.colorScheme.surface.withOpacity(0.8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () async {
                  await (await yandexMapController.future).moveCamera(
                    animation: const MapAnimation(duration: 0.5),
                    CameraUpdate.zoomIn(),
                  );
                },
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () async {
                  await (await yandexMapController.future).moveCamera(
                    animation: const MapAnimation(duration: 0.5),
                    CameraUpdate.zoomOut(),
                  );
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
        ),
      );
}
