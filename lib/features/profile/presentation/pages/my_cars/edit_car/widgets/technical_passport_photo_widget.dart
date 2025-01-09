part of '../edit_car_page.dart';

class _TechnicalPassportPhotoWidget extends StatelessWidget {
  const _TechnicalPassportPhotoWidget({
    required this.technicalPassportFrontImage,
    required this.technicalPassportBackImage,
  });

  final String technicalPassportFrontImage;
  final String technicalPassportBackImage;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${'add_technical_passport_photo'.tr()} 1',
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
              GestureDetector(
                onTap: () async {
                  final value = await selectImageFromGallery(context);
                  if (value != null) {
                    if (!context.mounted) return;
                    context.read<EditCarBloc>().add(
                          SelectTechnicalPassportFrontImageEvent(
                            imageFile: File(value.path),
                          ),
                        );
                  }
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
              final value = await selectImageFromGallery(context);
              if (value != null) {
                if (!context.mounted) return;
                context.read<EditCarBloc>().add(
                      SelectTechnicalPassportFrontImageEvent(
                        imageFile: File(value.path),
                      ),
                    );
              }
            },
            child: BlocBuilder<EditCarBloc, EditCarState>(
              buildWhen: (previous, current) =>
                  previous.technicalPassportFileFront != current.technicalPassportFileFront,
              builder: (context, state) => Material(
                borderRadius: AppUtils.kBorderRadius12,
                color: context.colorScheme.surface,
                child: Padding(
                  padding: AppUtils.kPaddingAll32,
                  child: Center(
                    child: state.technicalPassportFileFront != null
                        ? Image.file(
                            state.technicalPassportFileFront!,
                            fit: BoxFit.cover,
                          )
                        : technicalPassportFrontImage.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: technicalPassportFrontImage,
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
                                    style: context.textStyle.regularCallout.copyWith(
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
          AppUtils.kGap12,

          /// Back
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'back'.tr(),
                style: context.textStyle.size14Weight500Black.copyWith(
                  color: context.color.gray700,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final value = await selectImageFromGallery(context);
                  if (value != null) {
                    if (!context.mounted) return;
                    context.read<EditCarBloc>().add(
                          SelectTechnicalPassportBackImageEvent(
                            imageFile: File(value.path),
                          ),
                        );
                  }
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
              final value = await selectImageFromGallery(context);
              if (value != null) {
                if (!context.mounted) return;
                context.read<EditCarBloc>().add(
                      SelectTechnicalPassportBackImageEvent(
                        imageFile: File(value.path),
                      ),
                    );
              }
            },
            child: BlocBuilder<EditCarBloc, EditCarState>(
              buildWhen: (previous, current) =>
                  previous.technicalPassportFileBack != current.technicalPassportFileBack,
              builder: (context, state) => Material(
                borderRadius: AppUtils.kBorderRadius12,
                color: context.colorScheme.surface,
                child: Padding(
                  padding: AppUtils.kPaddingAll32,
                  child: Center(
                    child: state.technicalPassportFileBack != null
                        ? Image.file(
                            state.technicalPassportFileBack!,
                            fit: BoxFit.cover,
                          )
                        : technicalPassportBackImage.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: technicalPassportBackImage,
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
                                    style: context.textStyle.regularCallout.copyWith(
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
