part of '../confirm_phone_number.dart';

class _NextButtonWidget extends StatelessWidget {
  const _NextButtonWidget({
    required this.phoneNumberController,
  });

  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) => BlocBuilder<ConfirmationUserBloc, ConfirmationUserState>(
        buildWhen: (previous, current) => previous.isValidPhoneNumber != current.isValidPhoneNumber,
        builder: (context, state) => SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.color.textColor2,
              disabledBackgroundColor: context.color.textColor2.withOpacity(0.4),
            ),
            onPressed: state.isValidPhoneNumber
                ? () async {
                    context.read<ConfirmationUserBloc>().add(
                          CheckUserEvent(
                            phoneNumberController.text.replaceAll(' ', '').trim(),
                          ),
                        );
                  }
                : null,
            child: Text(
              'next'.tr(),
              style: context.textStyle.size15Weight500Black.copyWith(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
}
