import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../router/app_routes.dart';
import '../../extension/extension.dart';

Future<T> showSelectImageSheet<T>({
  required BuildContext context,
  required String imageUrl,
}) async =>
    await showCupertinoModalPopup<dynamic>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Выберите действие'),
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Выбрать из галереи'),
            onPressed: () {
              ImagePicker().pickImage(source: ImageSource.gallery).then(
                (value) {
                  if (!context.mounted) return;
                  _cropFile(context, value);
                },
              );
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Сделать фото'),
            onPressed: () {
              ImagePicker().pickImage(source: ImageSource.camera).then(
                (value) {
                  if (!context.mounted) return;
                  _cropFile(context, value);
                },
              );
            },
          ),
          Visibility(
            visible: imageUrl.isNotEmpty && imageUrl != 'photo',
            child: CupertinoActionSheetAction(
              child: const Text('Удалить фото'),
              onPressed: () {
                localSource.deleteUserImage();
                context.pop('');
              },
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Отмена'),
          onPressed: () {
            if (!context.mounted) return;
            context.pop();
          },
        ),
      ),
    );

Future<void> _cropFile(
  BuildContext context,
  XFile? xFile,
) async {
  CroppedFile? croppedFile;
  if (xFile != null) {
    croppedFile = await ImageCropper().cropImage(
      sourcePath: xFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 40,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
          activeControlsWidgetColor: context.colorScheme.primary,
          statusBarColor: context.colorScheme.primary,
          toolbarTitle: '',
          toolbarColor: context.colorScheme.primary,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
            // title: context.tr(Dictionary.cropPhoto),
            ),
      ],
    );
  }
  // ignore: use_build_context_synchronously
  if (croppedFile == null) {
    if (!context.mounted) return;
    context.pop();
  } else {
    final XFile value = XFile(croppedFile.path);
    if (!context.mounted) return;
    context.pop(value);
  }
}
