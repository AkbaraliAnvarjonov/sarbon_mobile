import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.title,
    required this.image,
    required this.subTitle,
  });

  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          AppUtils.kGap48,
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 350 / 812,
              child: Image.asset(image)),
          AppUtils.kGap36,
          Padding(
            padding: AppUtils.kPaddingHorizontal24,
            child: Text(
              title,
              textAlign: TextAlign.center,
              textScaler: const TextScaler.linear(1),
              style: context.textStyle.onBoardingTitle.copyWith(
                fontSize: 27,
                color: const Color(0xFF003399),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          AppUtils.kGap8,
          Padding(
            padding: AppUtils.kPaddingHorizontal32,
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              textScaler: const TextScaler.linear(1),
              style: context.textStyle.regularHeadline.copyWith(
                color: const Color(0xFF211F26),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
}
