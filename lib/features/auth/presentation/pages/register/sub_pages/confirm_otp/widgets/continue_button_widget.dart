part of '../confirm_otp_page.dart';

class _ContinueRegisterButtonWidget extends StatelessWidget {
  const _ContinueRegisterButtonWidget({
    required this.pinPutController,
    required this.phoneNumber,
  });

  final TextEditingController pinPutController;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: EdgeInsets.only(
          bottom: context.viewInsets.bottom + 16,
          top: 16,
          left: 16,
          right: 16,
        ),
        child: BlocBuilder<ConfirmationUserBloc, ConfirmationUserState>(
          buildWhen: (previous, current) => previous.otp != current.otp,
          builder: (context, state) => ElevatedButton(
            onPressed: state.otp.isNotEmpty
                ? () async {
                    context.read<ConfirmationUserBloc>().add(
                          VerifyOtpChangedEvent(
                            otp: pinPutController.text,
                            phoneNumber:
                                '+998${phoneNumber.replaceAll(' ', '').trim()}',
                          ),
                        );
                  }
                : null,
            child: Text('continue'.tr()),
          ),
        ),
      );
}
