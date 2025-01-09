import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../router/app_routes.dart';
import '../../bloc/login/login_bloc.dart';

part 'mixin/login_mixin.dart';

part 'widgets/not_account_text_widget.dart';

part 'widgets/login_button_widget.dart';

part 'widgets/forgot_password_text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginMixin {
  @override
  void initState() {
    initControllers();
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocListener<LoginBloc, LoginState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) async {
          if (state.status.isSuccess) {
            if (!context.mounted) return;
            context.goNamed(Routes.main);
          }
        },
        child: ModalProgressHUD(
          inAsyncCall: context.watch<LoginBloc>().state.status.isLoading,
          child: Scaffold(
            backgroundColor: context.colorScheme.surface,
            body: Padding(
              padding: AppUtils.kPaddingAll16,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: EdgeInsets.only(top: context.padding.top + 36),
                          child: Text(
                            'enter_logistics'.tr(),
                            style: context.textStyle.regularTitle1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        AppUtils.kGap24,
                        CustomTextField(
                          showEnabledBorder: true,
                          controller: usernameController,
                          focusNode: userNameFocus,
                          showError: context.watch<LoginBloc>().state.status.isError,
                          errorText: '',
                          hintText: 'input_username'.tr(),
                          labelText: 'add_login'.tr(),
                          onChanged: (value) {
                            context.read<LoginBloc>().add(
                                  UsernameEvent(
                                    username: value,
                                  ),
                                );
                          },
                          contentPadding: AppUtils.kPaddingAll12,
                        ),
                        if (context.select(
                          (LoginBloc bloc) => bloc.state.status.isError,
                        ))
                          AppUtils.kGap
                        else
                          AppUtils.kGap16,
                        CustomTextField(
                          showEnabledBorder: true,
                          controller: passwordController,
                          focusNode: passwordFocus,
                          hintText: 'password'.tr(),
                          labelText: 'password'.tr(),
                          showError: context.watch<LoginBloc>().state.status.isError,
                          errorText: 'username_or_code_incorrect'.tr(),
                          obscure: context.watch<LoginBloc>().state.isPasswordVisible,
                          onChanged: (value) {
                            context.read<LoginBloc>().add(PasswordEvent(password: value));
                          },
                          contentPadding: AppUtils.kPaddingAll12,
                          suffixIcon: IconButton(
                            onPressed: () {
                              context.read<LoginBloc>().add(
                                    const ChangePasswordVisibilityEvent(),
                                  );
                            },
                            icon: Icon(
                              context.watch<LoginBloc>().state.isPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: context.color.greyText,
                            ),
                          ),
                        ),
                        AppUtils.kGap16,
                        const _ForgotPasswordTextWidget(),
                        AppUtils.kGap24,
                        const _LoginButtonWidget(),
                        AppUtils.kGap24,
                        const _NoAccountTextWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
