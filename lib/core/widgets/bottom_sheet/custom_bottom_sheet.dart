import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/extension.dart';
import '../../utils/utils.dart';

typedef WidgetScrollBuilder = Widget Function(
  BuildContext context,
  ScrollController? controller,
);

Future<T?> customModalBottomSheet<T>({
  required BuildContext context,
  required WidgetScrollBuilder builder,
  bool isScrollControlled = false,
  bool enableDrag = true,
  double? maxHeight,
  double? minHeight,
}) async =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      enableDrag: enableDrag,
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? context.kSize.height * 0.82,
        minHeight: minHeight ?? context.kSize.height * 0.4,
      ),
      builder: (_) {
        if (isScrollControlled) {
          return ClipRRect(
            borderRadius: AppUtils.kBorderTopRadius24,
            child: DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              expand: false,
              snap: true,
              builder: (context, controller) => builder(context, controller),
            ),
          );
        } else {
          return ClipRRect(
            borderRadius: AppUtils.kBorderTopRadius24,
            child: builder(context, null),
          );
        }
      },
    );

Future<dynamic> imagePickerBottomSheet(
  BuildContext context, {
  required void Function() actionOne,
  required void Function() actionTwo,
}) async =>
    showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        title: Text('pickup_image'.tr()),
        actions: [
          CupertinoActionSheetAction(
            onPressed: actionOne,
            child: Text('camera'.tr()),
          ),
          CupertinoActionSheetAction(
            onPressed: actionTwo,
            child: Text('gallery'.tr()),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text('cancel'.tr()),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
