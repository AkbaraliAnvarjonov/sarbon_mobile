import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../constants/icons_constants.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../bloc/route/routes_bloc.dart';

class DeleteRouteDialog extends StatelessWidget {
  const DeleteRouteDialog({
    super.key,
    required this.routId,
  });

  final String routId;

  @override
  Widget build(BuildContext context) => Dialog(
        child: SizedBox(
          height: 220,
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
                  'delete_route'.tr(),
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
                  'are_you_sure_you_want_to_delete_route'.tr(),
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
                          'no'.tr(),
                          style: context.textStyle.buttonStyle.copyWith(
                            color: context.color.middleGray,
                          ),
                        ),
                      ),
                    ),
                    AppUtils.kGap8,
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<RoutesBloc>().add(
                                DeleteRouteEvent(
                                  routeId: routId,
                                ),
                              );
                          context.pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              context.colorScheme.error.withOpacity(0.3),
                        ),
                        child: Text(
                          'delete'.tr(),
                          style: context.textStyle.buttonStyle.copyWith(
                            color: context.colorScheme.error,
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
