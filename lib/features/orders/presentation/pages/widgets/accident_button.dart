import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants/icons_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';

class AccidentButton extends StatelessWidget {
  const AccidentButton({
    super.key,
    required this.status,
    required this.onTap,
    required this.isSelected,
  });

  final String status;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: AppUtils.kPaddingHorizontal16,
        sliver: SliverToBoxAdapter(
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  status,
                  style: context.textStyle.regularSubheadline,
                ),
                SvgPicture.asset(
                  status == 'ДТП'
                      ? SvgImage.icLoading
                      : SvgImage.icCarService,
                  height: 28,
                  width: 28,
                  colorFilter: ColorFilter.mode(
                    isSelected
                        ? context.colorScheme.primary
                        : context.color.midGrey5,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
