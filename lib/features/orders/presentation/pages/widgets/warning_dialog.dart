import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../constants/icons_constants.dart';

class WarningAccidentDialog extends StatelessWidget {
  const WarningAccidentDialog({
    super.key,
    required this.onConfirm,
    required this.subTitle,
  });

  final VoidCallback onConfirm;
  final String subTitle;

  @override
  Widget build(BuildContext context) => Dialog(
    child: SizedBox(
      height: 230,
      child: Stack(
        children: [
          Positioned(
            left: -94,
            top: -94,
            child: SvgPicture.asset(
              SvgImage.warningZoom,
            ),
          ),
          Positioned(
            right: 4,
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.close,
                size: 24,
                color: context.color.gray700.withOpacity(0.7),
              ),
            ),
          ),
          Positioned(
            top: 84,
            left: 16,
            child: Text(
              '${'attention'.tr()}!',
              style: context.textStyle.buttonStyle.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
          Positioned(
            top: 116,
            left: 16,
            right: 16,
            child: Text(
              subTitle,
              style: context.textStyle.size14Weight400Black.copyWith(
                color: context.colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.color.grey6,
                    ),
                    child: Text(
                      'cancel'.tr(),
                      style: context.textStyle.buttonStyle.copyWith(
                        color: context.color.middleGray,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                AppUtils.kGap8,
                Expanded(
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      context.colorScheme.error.withOpacity(0.3),
                    ),
                    child: Text(
                      'specify'.tr(),
                      style: context.textStyle.buttonStyle.copyWith(
                        color: context.colorScheme.error,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
