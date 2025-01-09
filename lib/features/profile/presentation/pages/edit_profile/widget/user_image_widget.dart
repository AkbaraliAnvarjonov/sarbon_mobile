part of '../edit_profile_page.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<EditProfileBloc, EditProfileState>(
        builder: (context, state) => Center(
          child: Stack(
            children: [
              if (state.isRemoveImage)
                CircleAvatar(
                  backgroundColor: context.colorScheme.surface,
                  radius: 55,
                  backgroundImage: const AssetImage(
                    GifsConstants.imagesIcUser,
                  ),
                )
              else if (state.image != null)
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 55,
                  backgroundImage: FileImage(state.image!),
                )
              else
                localSource.imageUrl.isEmpty || localSource.imageUrl == 'photo'
                    ? CircleAvatar(
                        backgroundColor: context.colorScheme.surface,
                        radius: 55,
                        backgroundImage: const AssetImage(
                          GifsConstants.imagesIcUser,
                        ),
                      )
                    : ClipOval(
                        child: CachedNetworkImage(
                          width: 110,
                          height: 110,
                          fit: BoxFit.cover,
                          imageUrl: localSource.imageUrl,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator.adaptive(),
                        ),
                      ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Material(
                  borderRadius: AppUtils.kBorderRadius12,
                  child: InkWell(
                    borderRadius: AppUtils.kBorderRadius12,
                    onTap: () async {
                      await showSelectImageSheet<dynamic>(
                        context: context,
                        imageUrl:
                            state.image == null && localSource.imageUrl.isEmpty
                                ? ''
                                : state.isRemoveImage
                                    ? ''
                                    : 'photo',
                      ).then(
                        (value) {
                          if (value == null) {
                            return;
                          } else if (value is String) {
                            if(!context.mounted) return;
                            context.read<EditProfileBloc>().add(
                                  const IsRemoveUserImageEvent(),
                                );
                          } else {
                            // ignore: avoid_dynamic_calls
                            final file = File(value.path);
                            if(!context.mounted) return;
                            context.read<EditProfileBloc>().add(
                                  ChangeImageEvent(image: file),
                                );
                          }
                        },
                      );
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      padding: AppUtils.kPaddingAll4,
                      decoration: const BoxDecoration(
                        borderRadius: AppUtils.kBorderRadius4,
                      ),
                      child: SvgPicture.asset(
                        SvgImage.icCamera,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
