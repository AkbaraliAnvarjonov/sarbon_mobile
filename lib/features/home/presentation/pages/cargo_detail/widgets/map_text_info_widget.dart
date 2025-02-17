import 'package:flutter/material.dart';
import 'package:sarbon_mobile/core/extension/extension.dart';

class MapTextInfoWidget extends StatelessWidget {
  const MapTextInfoWidget({
    super.key,
    required this.info,
    required this.title,
  });

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: title,
          children: [
            TextSpan(
              text: info,
              style: context.textStyle.regularCallout.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            )
          ],
          style: context.textStyle.size14Weight400Black.copyWith(
            color: Colors.white,
          )),
    );
  }
}
