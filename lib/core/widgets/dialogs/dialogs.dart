import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../constants/icons_constants.dart';

class SuccessfulOrPermissionDialog extends StatelessWidget {
  const SuccessfulOrPermissionDialog({super.key});

  @override
  Widget build(BuildContext context) => Dialog(
        child: SizedBox(
          height: 240,
          child: Stack(
            children: [
              Positioned(
                left: -94,
                top: -94,
                child: SvgPicture.asset(
                  SvgImage.successZoom,
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
                  'sent_by_shipper'.tr(),
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
                  'your_application_displayed_in_orders_section'.tr(),
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
                          context.pop(true);
                        },
                        child: Text(
                          'go_to_order'.tr(),
                          style: context.textStyle.buttonStyle
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
