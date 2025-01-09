part of '../edit_profile_page.dart';

class _SaveButtonWidget extends StatelessWidget {
  const _SaveButtonWidget({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
});

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: AppUtils.kDecorationWithShadow,
    child: SafeArea(
      minimum: AppUtils.kPaddingAll16,
      child: BlocBuilder<EditProfileBloc, EditProfileState>(
        builder: (context, state) => ElevatedButton(
          onPressed: state.updateInfoStatus.isLoading
              ? null
              : () async {
            if (formKey.currentState!.validate()) {
              context.read<EditProfileBloc>().add(
                const StatusChangedEvent(),
              );
              String? url;
              if (state.image != null) {
                url = await uploadFiles(
                  state.image!,
                );
              }
              if (!context.mounted) return;
              context.read<EditProfileBloc>().add(
                PutUserInfoEvent(
                  userInfo: PutUserInfoRequest(
                    data: Data(
                      guid: localSource.userId,
                      fullName: nameController.text,
                      email: emailController.text,
                      password:
                      passwordController.text.isEmpty
                          ? localSource.password
                          : passwordController.text,
                      photo: state.isRemoveImage
                          ? 'photo'
                          : url ?? localSource.imageUrl,
                    ),
                  ),
                ),
              );
            }
          },
          child: Text('save'.tr()),
        ),
      ),
    ),
  );
}
