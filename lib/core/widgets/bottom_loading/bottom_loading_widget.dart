import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class BottomLoadingIndicatorWidget extends StatelessWidget {
  const BottomLoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) => const SafeArea(
        minimum: AppUtils.kPaddingAll16,
        child: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
}
