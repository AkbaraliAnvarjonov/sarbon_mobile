part of '../confirm_otp_page.dart';

class _PinPutRegisterWidget extends StatelessWidget {
  const _PinPutRegisterWidget({
    required this.pinPutFocusNode,
    required this.pinPutController,
    required this.defaultPinTheme,
    required this.phoneNumber,
  });

  final FocusNode pinPutFocusNode;
  final TextEditingController pinPutController;
  final PinTheme defaultPinTheme;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingHorizontal12,
        child: Pinput(
          focusNode: pinPutFocusNode,
          controller: pinPutController,
          onCompleted: (value) {
            context.read<ConfirmationUserBloc>().add(
                  VerifyOtpChangedEvent(
                    otp: value,
                    phoneNumber:
                        '+998${phoneNumber.replaceAll(' ', '').trim()}',
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
            context.read<ConfirmationUserBloc>().add(
                  WriteOtpEvent(value),
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
            (ConfirmationUserBloc bloc) => bloc.state.verifyOtpStatus.isError,
          ),
          errorPinTheme: defaultPinTheme.copyBorderWith(
            border: Border.all(color: Colors.redAccent),
          ),
        ),
      );
}
