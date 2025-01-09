part of '../edit_car_page.dart';

class _TrailerPhoto1Widget extends StatelessWidget {
  const _TrailerPhoto1Widget({
    required this.trailerPassportImageFront,
    required this.trailerPassportImageBack,
  });

  final String trailerPassportImageFront;
  final String trailerPassportImageBack;

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
                          SelectTrailerPassportFrontImage1Event(
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
                      SelectTrailerPassportFrontImage1Event(
                        imageFile: File(value.path),
                      ),
                    );
              }
            },
            child: BlocBuilder<EditCarBloc, EditCarState>(
              buildWhen: (previous, current) => previous.trailerPassportFileFront1 != current.trailerPassportFileFront1,
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
                        : trailerPassportImageFront.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: trailerPassportImageFront,
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
                          SelectTrailerPassportBackImage1Event(
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
                      SelectTrailerPassportBackImage1Event(
                        imageFile: File(value.path),
                      ),
                    );
              }
            },
            child: BlocBuilder<EditCarBloc, EditCarState>(
              buildWhen: (previous, current) => previous.trailerPassportFileBack1 != current.trailerPassportFileBack1,
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
                        : trailerPassportImageBack.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: trailerPassportImageBack,
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
