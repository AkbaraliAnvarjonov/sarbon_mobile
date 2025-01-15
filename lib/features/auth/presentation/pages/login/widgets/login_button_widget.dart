part of '../login_page.dart';

class _LoginButtonWidget extends StatelessWidget {
  const _LoginButtonWidget();

  @override
  Widget build(BuildContext context) => BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) => SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.color.textColor2,
              disabledBackgroundColor: context.color.textColor2.withOpacity(0.4),
            ),
            onPressed: state.status.isLoading
                ? () {}
                : () {
                    context.read<LoginBloc>().add(
                          const LoginButtonPressedEvent(),
                        );
                  },
            child: Text(
              'login'.tr(),
            ),
          ),
        ),
      );
}
