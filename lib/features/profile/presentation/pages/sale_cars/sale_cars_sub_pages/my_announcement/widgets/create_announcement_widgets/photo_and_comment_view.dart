part of '../../announcement_tab_pages/sub_pages/create_new_announcement_page.dart';

class _PhotoAndCommentViewWidget extends StatelessWidget {
  const _PhotoAndCommentViewWidget({
    required this.descriptionController,
    required this.createAnnouncementBloc,
  });

  final TextEditingController descriptionController;
  final CreateAnnouncementBloc createAnnouncementBloc;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'photo_and_description'.tr(),
            style: context.textStyle.size14Weight500Black,
          ),
          AppUtils.kGap8,
          BlocBuilder<CreateAnnouncementBloc, CreateAnnouncementState>(
            buildWhen: (previous, current) => previous.imageFile != current.imageFile,
            builder: (context, state) => GestureDetector(
              onTap: () async {
                final value = await selectImageFromGallery(context);
                if (value != null) {
                  if (!context.mounted) return;
                  createAnnouncementBloc.add(
                    SelectImageEvent(
                      imageFile: File(value.path),
                    ),
                  );
                }
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius12,
                  color: context.colorScheme.surface,
                ),
                child: Padding(
                  padding: AppUtils.kPaddingAll32,
                  child: Center(
                    child: state.imageFile != null
                        ? Image.file(
                            state.imageFile!,
                            fit: BoxFit.cover,
                          )
                        : Text(
                            '+ ${'add_photo'.tr()}',
                            style: context.textStyle.regularCallout.copyWith(
                              color: context.colorScheme.primary,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
          AppUtils.kGap16,
          Material(
            borderRadius: AppUtils.kBorderRadius12,
            color: context.colorScheme.surface,
            child: Padding(
              padding: AppUtils.kPaddingAll12,
              child: CustomTextField(
                contentPadding: AppUtils.kPaddingAll12,
                showEnabledBorder: true,
                hintText: 'description'.tr(),
                controller: descriptionController,
                hintTextStyle: context.textStyle.regularSubheadline.copyWith(
                  color: context.color.greyText,
                ),
                fillColor: context.colorScheme.surface,
                maxLines: 7,
                maxLength: 250,
              ),
            ),
          ),
        ],
      );
}
