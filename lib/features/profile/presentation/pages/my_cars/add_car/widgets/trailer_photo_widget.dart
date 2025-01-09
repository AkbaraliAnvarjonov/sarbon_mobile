part of '../add_car_page.dart';

class _Trailer1PhotoWidget extends StatelessWidget {
  const _Trailer1PhotoWidget();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${'trailer_license'.tr()} 1',
            style: context.textStyle.bodyBody.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          AppUtils.kGap16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'front'.tr(),
                style: context.textStyle.size14Weight500Black.copyWith(
                  color: context.color.gray700,
                ),
              ),
              if (context.select(
                    (AddCarBloc bloc) => bloc.state.trailerPassportFileFront1,
                  ) !=
                  null)
                GestureDetector(
                  onTap: () async {
                    if (!context.mounted) return;
                    await imagePickerBottomSheet(
                      context,
                      actionOne: () async {
                        if (!context.mounted) return;
                        Navigator.pop(context);
                        final value = await picker.ImagePicker().pickImage(
                          source: picker.ImageSource.camera,
                        );
                        if (value != null) {
                          if (!context.mounted) return;
                          context.read<AddCarBloc>().add(
                                SelectTrailerPassportFrontImage1Event(
                                  imageFile: File(value.path),
                                ),
                              );
                        }
                      },
                      actionTwo: () async {
                        if (!context.mounted) return;
                        Navigator.pop(context);
                        final value = await selectImageFromGallery(context);
                        if (value != null) {
                          if (!context.mounted) return;
                          context.read<AddCarBloc>().add(
                                SelectTrailerPassportFrontImage1Event(
                                  imageFile: File(value.path),
                                ),
                              );
                        }
                      },
                    );
                  },
                  child: Text(
                    'change'.tr(),
                    style: context.textStyle.size14Weight400Black.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
            ],
          ),
          AppUtils.kGap6,
          GestureDetector(
            onTap: () async {
              if (!context.mounted) return;
              await imagePickerBottomSheet(
                context,
                actionOne: () async {
                  if (!context.mounted) return;
                  Navigator.pop(context);
                  final value = await picker.ImagePicker().pickImage(
                    source: picker.ImageSource.camera,
                  );
                  if (value != null) {
                    if (!context.mounted) return;
                    context.read<AddCarBloc>().add(
                          SelectTrailerPassportFrontImage1Event(
                            imageFile: File(value.path),
                          ),
                        );
                  }
                },
                actionTwo: () async {
                  if (!context.mounted) return;
                  Navigator.pop(context);
                  final value = await selectImageFromGallery(context);
                  if (value != null) {
                    if (!context.mounted) return;
                    context.read<AddCarBloc>().add(
                          SelectTrailerPassportFrontImage1Event(
                            imageFile: File(value.path),
                          ),
                        );
                  }
                },
              );
            },
            child: BlocBuilder<AddCarBloc, AddCarState>(
              buildWhen: (previous, current) =>
                  previous.trailerPassportFileFront1 !=
                  current.trailerPassportFileFront1,
              builder: (context, state) => Material(
                borderRadius: AppUtils.kBorderRadius12,
                color: context.colorScheme.surface,
                child: Padding(
                  padding: AppUtils.kPaddingAll32,
                  child: Center(
                    child: state.trailerPassportFileFront1 != null
                        ? Image.file(
                            state.trailerPassportFileFront1!,
                            fit: BoxFit.cover,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                SvgImage.addImages,
                              ),
                              AppUtils.kGap6,
                              Text(
                                'add_photo'.tr(),
                                style:
                                    context.textStyle.regularCallout.copyWith(
                                  color: context.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'back'.tr(),
                style: context.textStyle.size14Weight500Black.copyWith(
                  color: context.color.gray700,
                ),
              ),
              if (context.select(
                    (AddCarBloc bloc) => bloc.state.trailerPassportFileBack1,
                  ) !=
                  null)
                GestureDetector(
                  onTap: () async {
                    if (!context.mounted) return;
                    await imagePickerBottomSheet(
                      context,
                      actionOne: () async {
                        if (!context.mounted) return;
                        Navigator.pop(context);
                        final value = await picker.ImagePicker().pickImage(
                          source: picker.ImageSource.camera,
                        );
                        if (value != null) {
                          if (!context.mounted) return;
                          context.read<AddCarBloc>().add(
                                SelectTrailerPassportBackImage1Event(
                                  imageFile: File(value.path),
                                ),
                              );
                        }
                      },
                      actionTwo: () async {
                        if (!context.mounted) return;
                        Navigator.pop(context);
                        final value = await selectImageFromGallery(context);
                        if (value != null) {
                          if (!context.mounted) return;
                          context.read<AddCarBloc>().add(
                                SelectTrailerPassportBackImage1Event(
                                  imageFile: File(value.path),
                                ),
                              );
                        }
                      },
                    );
                    //
                  },
                  child: Text(
                    'change'.tr(),
                    style: context.textStyle.size14Weight400Black.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
            ],
          ),
          AppUtils.kGap6,
          GestureDetector(
            onTap: () async {
              if (!context.mounted) return;
              await imagePickerBottomSheet(
                context,
                actionOne: () async {
                  if (!context.mounted) return;
                  Navigator.pop(context);
                  final value = await picker.ImagePicker().pickImage(
                    source: picker.ImageSource.camera,
                  );
                  if (value != null) {
                    if (!context.mounted) return;
                    context.read<AddCarBloc>().add(
                          SelectTrailerPassportBackImage1Event(
                            imageFile: File(value.path),
                          ),
                        );
                  }
                },
                actionTwo: () async {
                  if (!context.mounted) return;
                  Navigator.pop(context);
                  final value = await selectImageFromGallery(context);
                  if (value != null) {
                    if (!context.mounted) return;
                    context.read<AddCarBloc>().add(
                          SelectTrailerPassportBackImage1Event(
                            imageFile: File(value.path),
                          ),
                        );
                  }
                },
              );
            },
            child: BlocBuilder<AddCarBloc, AddCarState>(
              buildWhen: (previous, current) =>
                  previous.trailerPassportFileBack1 !=
                  current.trailerPassportFileBack1,
              builder: (context, state) => Material(
                borderRadius: AppUtils.kBorderRadius12,
                color: context.colorScheme.surface,
                child: Padding(
                  padding: AppUtils.kPaddingAll32,
                  child: Center(
                    child: state.trailerPassportFileBack1 != null
                        ? Image.file(
                            state.trailerPassportFileBack1!,
                            fit: BoxFit.cover,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                SvgImage.addImages,
                              ),
                              AppUtils.kGap6,
                              Text(
                                'add_photo'.tr(),
                                style:
                                    context.textStyle.regularCallout.copyWith(
                                  color: context.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
