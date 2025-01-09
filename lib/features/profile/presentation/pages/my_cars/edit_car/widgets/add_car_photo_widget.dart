part of '../edit_car_page.dart';

class _AddCarPhotoWidget extends StatelessWidget {
  const _AddCarPhotoWidget({
    required this.vehicleImage,
  });

  final String vehicleImage;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'photo_car'.tr(),
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
                          SelectVehicleImageEvent(
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
                      SelectVehicleImageEvent(
                        imageFile: File(value.path),
                      ),
                    );
              }
            },
            child: BlocBuilder<EditCarBloc, EditCarState>(
              buildWhen: (previous, current) => previous.vehicleFile != current.vehicleFile,
              builder: (context, state) => Material(
                borderRadius: AppUtils.kBorderRadius12,
                color: context.colorScheme.surface,
                child: Padding(
                  padding: AppUtils.kPaddingAll32,
                  child: Center(
                    child: state.vehicleFile != null
                        ? Image.file(
                            state.vehicleFile!,
                            fit: BoxFit.cover,
                          )
                        : vehicleImage.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: vehicleImage,
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
