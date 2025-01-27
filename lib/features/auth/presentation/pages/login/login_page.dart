import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sarbon_mobile/features/main/presentation/bloc/main_bloc.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../../constants/image_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/theme/themes.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../router/app_routes.dart';
import '../../bloc/login/login_bloc.dart';
import '../register/widgets/social_widget.dart';

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
            context.read<MainBloc>().add(MainEventChanged(BottomMenu.values[0]));
          }
        },
        child: ModalProgressHUD(
          inAsyncCall: context.watch<LoginBloc>().state.status.isLoading,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16), // Adjust the radius as needed
                  bottomRight: Radius.circular(16),
                ),
                child: AppBar(
                  title: Text(
                    'Вход',
                    style: context.textStyle.appBarTitle.copyWith(
                      fontWeight: FontWeight.w500,
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                  leading: IconButton(
                    icon: Icon(
                      Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                  centerTitle: false,
                  systemOverlayStyle: systemUiOverlayStyle,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  backgroundColor: context.colorScheme.primary,
                ),
              ),
            ),
            backgroundColor: context.colorScheme.surface,
            body: Padding(
              padding: AppUtils.kPaddingAll16,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        AppUtils.kGap44,
                        Image.asset(PngImage.appLogoColored, height: 50, width: 180),
                        AppUtils.kGap48,
                        Container(
                          padding: AppUtils.kPaddingAll16,
                          decoration: const BoxDecoration(
                            borderRadius: AppUtils.kBorderRadius16,
                            color: Color(0xFFEDEFF5),
                          ),
                          child: Column(
                            children: [
                              AppUtils.kGap24,
                              CustomTextField(
                                showEnabledBorder: true,
                                controller: usernameController,
                                focusNode: userNameFocus,
                                showError: context.watch<LoginBloc>().state.status.isError,
                                errorText: '',
                                hintText: 'input_username'.tr(),
                                labelText: 'Login или Телефон',
                                onChanged: (value) {
                                  context.read<LoginBloc>().add(
                                        UsernameEvent(
                                          username: value,
                                        ),
                                      );
                                },
                                contentPadding: AppUtils.kPaddingAll16,
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
                                contentPadding: AppUtils.kPaddingAll16,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    context.read<LoginBloc>().add(const ChangePasswordVisibilityEvent());
                                  },
                                  icon: Icon(
                                    context.watch<LoginBloc>().state.isPasswordVisible
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: context.colorScheme.primary,
                                  ),
                                ),
                              ),
                              AppUtils.kGap10,
                              const _ForgotPasswordTextWidget(),
                              AppUtils.kGap24,
                              const _LoginButtonWidget(),
                              AppUtils.kGap24,
                              Row(
                                children: [
                                  const Expanded(child: AppUtils.kDivider),
                                  AppUtils.kGap4,
                                  Text('Вход через соцсеть', style: context.textStyle.size14Weight400Black),
                                  AppUtils.kGap4,
                                  const Expanded(child: AppUtils.kDivider),
                                ],
                              ),
                              AppUtils.kGap16,
                              Row(
                                children: [
                                  SocialWidget(
                                    icon: PngImage.telegramIc,
                                    onTap: () {},
                                  ),
                                  AppUtils.kGap8,
                                  SocialWidget(
                                      icon: PngImage.googleIc,
                                      onTap: () async {
                                        try {
                                          final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
                                          if (googleUser != null) {
                                            // Optionally, retrieve authentication details
                                            final GoogleSignInAuthentication googleAuth =
                                                await googleUser.authentication;

                                            context.read<LoginBloc>().add(
                                                  RegisterWithSocialEvent(
                                                    displayName: googleUser.displayName ?? '',
                                                    loginType: googleUser.email,
                                                    idToken: googleAuth.idToken ?? '',
                                                    accessToken: googleAuth.accessToken ?? '',
                                                    type: 'login',
                                                    registerType: 'email',
                                                    uniqueId: '',
                                                  ),
                                                );
                                          }
                                        } catch (error) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text('Google Sign-In failed: $error'),
                                          ));
                                        }
                                      }),
                                  AppUtils.kGap8,
                                  SocialWidget(
                                      icon: PngImage.faceBookIc,
                                      onTap: () async {
                                        final LoginResult loginResult = await FacebookAuth.instance.login();

                                        context.read<LoginBloc>().add(
                                              RegisterWithSocialEvent(
                                                displayName: '',
                                                loginType: '',
                                                idToken: loginResult.accessToken?.tokenString ?? '',
                                                accessToken: loginResult.accessToken?.tokenString ?? '',
                                                type: 'register',
                                                registerType: 'facebook',
                                                uniqueId: loginResult.accessToken?.tokenString ?? '',
                                              ),
                                            );
                                      }),
                                  if (Platform.isIOS) AppUtils.kGap8,
                                  if (Platform.isIOS)
                                    SocialWidget(
                                      icon: PngImage.appleIc,
                                      onTap: () async {
                                        final credential = await SignInWithApple.getAppleIDCredential(
                                          scopes: [
                                            AppleIDAuthorizationScopes.email,
                                            AppleIDAuthorizationScopes.fullName,
                                          ],
                                        );
                                        context.read<LoginBloc>().add(
                                              RegisterWithSocialEvent(
                                                displayName: credential.familyName ?? '',
                                                loginType: '',
                                                idToken: credential.authorizationCode,
                                                accessToken: credential.authorizationCode,
                                                type: 'login',
                                                registerType: 'apple',
                                                uniqueId: credential.userIdentifier ?? '',
                                              ),
                                            );
                                      },
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
