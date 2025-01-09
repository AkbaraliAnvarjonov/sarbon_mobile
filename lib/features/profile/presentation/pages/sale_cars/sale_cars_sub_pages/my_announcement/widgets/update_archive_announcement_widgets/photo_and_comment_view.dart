part of '../../announcement_tab_pages/sub_pages/update_archive_announcement_page.dart';

class _PhotoAndCommentViewWidget extends StatelessWidget {
  const _PhotoAndCommentViewWidget({
    required this.descriptionController,
    required this.updateArchiveAnnouncementBloc,
    required this.imageUrl,
  });

  final TextEditingController descriptionController;
  final UpdateArchiveAnnouncementBloc updateArchiveAnnouncementBloc;
  final String imageUrl;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'photo_and_description'.tr(),
            style: context.textStyle.size14Weight500Black,
          ),
          AppUtils.kGap6,
          BlocBuilder<UpdateArchiveAnnouncementBloc,
              UpdateArchiveAnnouncementState>(
            buildWhen: (previous, current) =>
                previous.imageFile != current.imageFile,
            builder: (context, state) => GestureDetector(
              onTap: () async {
                await ImagePicker().pickImage(source: ImageSource.gallery).then(
                  (value) {
                    if (value != null) {
                      updateArchiveAnnouncementBloc.add(
                        SelectImageEvent(
                          imageFile: File(value.path),
                        ),
                      );
                    }
                  },
                );
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
                        : CachedNetworkImage(
                            imageUrl: imageUrl,
                            width: context.kSize.width,
                            height: 200,
                            fit: BoxFit.cover,
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
                showEnabledBorder: true,
                contentPadding: AppUtils.kPaddingAll12,
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
