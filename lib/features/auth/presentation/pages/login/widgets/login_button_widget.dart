part of '../login_page.dart';

class _LoginButtonWidget extends StatelessWidget {
  const _LoginButtonWidget();

  @override
  Widget build(BuildContext context) => BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) => ElevatedButton(
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
      );
}
