part of '../../forgot_password/forgot_password_page.dart';

class _PinPutOtpWidget extends StatelessWidget {
  const _PinPutOtpWidget({
    required this.pinPutFocusNode,
    required this.pinPutController,
    required this.defaultPinTheme,
  });

  final FocusNode pinPutFocusNode;
  final TextEditingController pinPutController;
  final PinTheme defaultPinTheme;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingHorizontal12,
        child: Pinput(
          focusNode: pinPutFocusNode,
          controller: pinPutController,
          onCompleted: (value) {
            context.read<ForgotPasswordBloc>().add(
                  VerifyOtpChangedEvent(
                    otp: pinPutController.text,
                  ),
                );
          },
          autofocus: true,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          separatorBuilder: (_) => AppUtils.kGap12,
          length: 6,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp('[0-9]'),
            ),
          ],
          onChanged: (value) {
            context.read<ForgotPasswordBloc>().add(
                  SetOtpEvent(
                    otp: pinPutController.text,
                  ),
                );
          },
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: context.colorScheme.primary,
              ),
            ),
          ),
          submittedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: context.colorScheme.primary,
              ),
            ),
          ),
          errorText: 'un_correct_code'.tr(),
          forceErrorState: context.select(
            (ForgotPasswordBloc bloc) => bloc.state.verifyOtpStatus.isError,
          ),
          errorPinTheme: defaultPinTheme.copyBorderWith(
            border: Border.all(color: Colors.redAccent),
          ),
        ),
      );
}
