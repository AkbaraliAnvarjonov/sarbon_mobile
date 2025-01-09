part of '../confirm_otp_page.dart';

class _TimerWidget extends StatefulWidget {
  const _TimerWidget({
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  State<_TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<_TimerWidget> {
  late Timer? _timer;
  late String _timerText = '60';
  late int secondsRemaining = 60;
  late bool reverseSendCode = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (secondsRemaining == 0) {
          setState(() {
            reverseSendCode = true;
          });
        } else {
          secondsRemaining--;
          setState(() {
            _timerText = secondsRemaining.toString().padLeft(2, '0');
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (reverseSendCode) {
      return GestureDetector(
        onTap: () {
          context.read<ConfirmationUserBloc>().add(
                SendCodeEvent(
                  widget.phoneNumber.replaceAll(' ', '').trim(),
                ),
              );
          reverseSendCode = false;
          secondsRemaining = 60;
          _timerText = '60';
        },
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'resend_sms_code'.tr(),
            style: context.textStyle.regularCallout.copyWith(
              color: context.colorScheme.onSurface,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: '00:$_timerText',
        style: context.textStyle.regularCallout.copyWith(
          color: context.colorScheme.onSurface,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
