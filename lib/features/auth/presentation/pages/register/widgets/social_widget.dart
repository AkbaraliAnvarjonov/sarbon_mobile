import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
            height: 56,
            padding: AppUtils.kPaddingAll12,
            decoration: BoxDecoration(
              borderRadius: AppUtils.kBorderRadius8,
              color: Colors.white.withOpacity(0.6),
            ),
            child: Image.asset(
              icon,
            ),
          ),
    ),
  );
}
