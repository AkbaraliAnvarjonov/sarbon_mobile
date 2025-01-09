import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../extension/extension.dart';
import '../../utils/utils.dart';

class MapsListBottomSheet extends StatelessWidget {
  const MapsListBottomSheet({
    super.key,
    required this.mapList,
    required this.onTap,
  });

  final List<MapIconName> mapList;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: AppUtils.kBorderRadiusTop12,
          color: context.colorScheme.surface,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Center(
                child: Text(
                  'Открыть карту',
                ),
              ),
            ),
            AppUtils.kDivider,
            SizedBox(
              height: 116,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, index) => InkWell(
                  splashColor: Platform.isIOS ? Colors.transparent : null,
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    onTap(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SvgPicture.asset(
                            mapList[index].icon,
                            height: 48,
                            width: 48,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          mapList[index].title,
                          style: context.textStyle.regularFootnote,
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: mapList.length,
                separatorBuilder: (context, index) => AppUtils.kDivider,
              ),
            ),
            AppUtils.kDivider,
            SafeArea(
              minimum: AppUtils.kPaddingAll12,
              child: ColoredBox(
                color: context.colorScheme.surface,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Отмена'),
                ),
              ),
            ),
          ],
        ),
      );
}

class MapIconName {
  MapIconName(this.title, this.icon);

  String title;
  String icon;
}
