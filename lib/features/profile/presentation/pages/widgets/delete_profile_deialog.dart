import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../constants/icons_constants.dart';

class DeleteProfileDialog extends StatelessWidget {
  const DeleteProfileDialog({
    super.key,
    required this.onConfirm,
  });

  final VoidCallback onConfirm;

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
                  SvgImage.deleteZoomRed,
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
                  'delete_profile'.tr(),
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
                  'delete_profile_description'.tr(),
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
                          backgroundColor: context.color.error100,
                        ),
                        child: Text(
                          'no'.tr(),
                          style: context.textStyle.buttonStyle.copyWith(
                            color: context.colorScheme.error,
                          ),
                        ),
                      ),
                    ),
                    AppUtils.kGap8,
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onConfirm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.color.grey6,
                        ),
                        child: Text(
                          'yes'.tr(),
                          style: context.textStyle.buttonStyle.copyWith(
                            color: context.color.middleGray,
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
