import 'package:flutter/material.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../data/on_boarding_model.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          OnBoardingModel.pages.length,
          (int index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 8,
            width: index == currentPage ? 28 : 8,
            margin: AppUtils.kPaddingHorizontal4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (index == currentPage)
                  ? context.colorScheme.primary
                  : context.color.midGrey5.withOpacity(0.5),
            ),
          ),
        ),
      );
}
