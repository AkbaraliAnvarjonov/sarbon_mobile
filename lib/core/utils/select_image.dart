part of 'utils.dart';

Future<XFile?> selectImageFromGallery(BuildContext context) async {
  XFile? image;
  await ImagePicker().pickImage(source: ImageSource.gallery).then((value) async {
    if (!context.mounted) return;
    image = await _cropFile(context, value);
  });
  return image;
}

Future<XFile?> _cropFile(
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
        IOSUiSettings(),
      ],
    );
  }
  if (croppedFile == null) {
    return null;
  } else {
    final XFile value = XFile(croppedFile.path);

    return value;
  }
}
