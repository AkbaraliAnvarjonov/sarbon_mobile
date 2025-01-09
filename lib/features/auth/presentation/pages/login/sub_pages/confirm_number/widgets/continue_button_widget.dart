part of '../../forgot_password/forgot_password_page.dart';

class _ContinueButtonWidget extends StatelessWidget {
  const _ContinueButtonWidget({
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: EdgeInsets.only(
          bottom: context.viewInsets.bottom + 16,
          left: 16,
          right: 16,
        ),
        child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
          builder: (context, state) => ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                context.read<ForgotPasswordBloc>().add(
                      const SendCodeEvent(),
                    );
              }
            },
            child: Text('continue'.tr()),
          ),
        ),
      );
}
