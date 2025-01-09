part of '../../forgot_password/forgot_password_page.dart';

class _ConfirmButtonWidget extends StatelessWidget {
  const _ConfirmButtonWidget({
    required this.pinPutController,
  });

  final TextEditingController pinPutController;

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: EdgeInsets.only(
          bottom: context.viewInsets.bottom + 16,
          top: 16,
          left: 16,
          right: 16,
        ),
        child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
          buildWhen: (previous, current) => previous.otp != current.otp,
          builder: (context, state) => ElevatedButton(
            onPressed: state.otp.isNotEmpty
                ? () async {
                    context.read<ForgotPasswordBloc>().add(
                          VerifyOtpChangedEvent(
                            otp: pinPutController.text,
                          ),
                        );
                  }
                : null,
            child: Text('confirm'.tr()),
          ),
        ),
      );
}
