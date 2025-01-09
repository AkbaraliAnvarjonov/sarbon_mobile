import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/icons_constants.dart';
import '../../../../../constants/image_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';

class LocationBottomSheet extends StatelessWidget {
  const LocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingHorizontal24,
        child: Column(
          children: [
            AppUtils.kGap16,
            Image.asset(
              PngImage.noGpsIcon,
              height: 106,
              width: 106,
            ),
            AppUtils.kGap18,
            Text(
              'Доступ к местоположению\nотключён',
              style: context.textStyle.size15Weight600Black.copyWith(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            AppUtils.kGap18,
            Text(
              'Для работы приложения необходимо включить доступ к вашему местоположению. Это позволит находить грузы рядом с вами',
              style: context.textStyle.size14Weight400Black,
              textAlign: TextAlign.center,
            ),
            AppUtils.kGap24,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),

              ),
              onPressed: () async {
                await Geolocator.openLocationSettings();
                if (!context.mounted) return;
                context.pop();
              },
              child: const Text('Настройки'),
            ),
            AppUtils.kGap12,
            TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Отмена')),
          ],
        ),
      );
}
