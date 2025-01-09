part of '../../forgot_password/forgot_password_page.dart';

class _SendMessageTextWidget extends StatelessWidget {
  const _SendMessageTextWidget({
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingHorizontal16,
        child: RichText(
          text: TextSpan(
            text: 'we_have_sent_you_confirmation_code_to_your_specified_number'
                .tr(),
            children: [
              TextSpan(
                text: '\n+998 $phoneNumber',
                style: context.textStyle.regularSubheadline.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
            style: context.textStyle.regularSubheadline.copyWith(
              color: context.color.triarity,
            ),
          ),
        ),
      );
}
