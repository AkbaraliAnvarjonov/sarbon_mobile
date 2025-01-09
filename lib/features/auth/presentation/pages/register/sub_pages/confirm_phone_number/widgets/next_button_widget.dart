part of '../confirm_phone_number.dart';

class _NextButtonWidget extends StatelessWidget {
  const _NextButtonWidget({
    required this.phoneNumberController,
  });

  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: EdgeInsets.only(
          bottom: context.viewInsets.bottom + 16,
          left: 16,
          right: 16,
        ),
        child: BlocBuilder<ConfirmationUserBloc, ConfirmationUserState>(
          buildWhen: (previous, current) => previous.isValidPhoneNumber != current.isValidPhoneNumber,
          builder: (context, state) => ElevatedButton(
            onPressed: state.isValidPhoneNumber
                ? () async {
                    context.read<ConfirmationUserBloc>().add(
                          CheckUserEvent(
                            phoneNumberController.text.replaceAll(' ', '').trim(),
                          ),
                        );
                  }
                : null,
            child: Text('next'.tr()),
          ),
        ),
      );
}
