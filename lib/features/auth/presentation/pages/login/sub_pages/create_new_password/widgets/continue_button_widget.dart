part of '../../forgot_password/forgot_password_page.dart';

class _ContinueButtonCreatePasswordWidget extends StatelessWidget {
  const _ContinueButtonCreatePasswordWidget({
    required this.formKey,
    required this.confirmPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: EdgeInsets.only(
          bottom: context.viewInsets.bottom + 16,
          top: 16,
          left: 16,
          right: 16,
        ),
        child: ElevatedButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              context.read<ForgotPasswordBloc>().add(
                    UpdateUserPasswordEvent(
                      password: confirmPasswordController.text,
                    ),
                  );
            }
          },
          child: Text('continue'.tr()),
        ),
      );
}
