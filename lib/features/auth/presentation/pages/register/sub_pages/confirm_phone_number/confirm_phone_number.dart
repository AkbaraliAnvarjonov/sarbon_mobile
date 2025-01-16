import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../../../constants/image_constants.dart';
import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/theme/themes.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../../../core/widgets/inputs/masked_text_input_formatter.dart';
import '../../../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../data/models/user_role/user_role_model.dart';
import '../../../../bloc/confirmation_user/confirmation_user_bloc.dart';
import '../../widgets/social_widget.dart';
import '../confirm_otp/widgets/error_register_dialog.dart';

part 'widgets/select_role_widget.dart';

part 'widgets/next_button_widget.dart';

class ConfirmPhoneNumberPage extends StatefulWidget {
  const ConfirmPhoneNumberPage({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<ConfirmPhoneNumberPage> createState() => _ConfirmPhoneNumberPageState();
}

class _ConfirmPhoneNumberPageState extends State<ConfirmPhoneNumberPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) => BlocListener<ConfirmationUserBloc, ConfirmationUserState>(
        listenWhen: (previous, current) =>
            previous.getSmsIdStatus != current.getSmsIdStatus || previous.checkUserStatus != current.checkUserStatus,
        listener: (context, state) async {
          if (state.checkUserStatus.isSuccess) {
            context.read<ConfirmationUserBloc>().add(
                  SendCodeEvent(
                    _phoneNumberController.text.replaceAll(' ', '').trim(),
                  ),
                );
          } else if (state.checkUserStatus.isError) {
            await showDialog<void>(
              context: context,
              builder: (_) => const ErrorRegisterDialog(),
            );
          }
          if (state.getSmsIdStatus.isSuccess) {
            await widget.pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Scaffold(
          backgroundColor: context.colorScheme.surface,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16), // Adjust the radius as needed
                bottomRight: Radius.circular(16),
              ),
              child: AppBar(
                title: Text(
                  'Регистрация',
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
          body: ModalProgressHUD(
            inAsyncCall: context.select(
              (ConfirmationUserBloc bloc) => bloc.state.getSmsIdStatus.isLoading,
            ),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: AppUtils.kPaddingHorizontal16,
                  sliver: SliverList(
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
                              AppUtils.kGap16,
                              Text(
                                'Регистрация через телефон',
                                style: context.textStyle.size14Weight500Black,
                              ),
                              AppUtils.kGap24,
                              SizedBox(
                                height: 56,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 56,
                                      padding: AppUtils.kPaddingAll12,
                                      decoration: BoxDecoration(
                                        color: context.colorScheme.onPrimary,
                                        border: Border.all(color: const Color(0xFFDADADA)),
                                        borderRadius: AppUtils.kBorderRadius12,
                                      ),
                                      child: Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 13,
                                            foregroundImage: AssetImage(PngImage.icFlag) as ImageProvider,
                                          ),
                                          AppUtils.kGap6,
                                          Text(
                                            '+998',
                                            style: context.textStyle.size14Weight500Black,
                                          ),
                                          AppUtils.kGap2,
                                          const Icon(
                                            Icons.navigate_next,
                                            size: 20,
                                            color: Color(0xFF7E7B86),
                                          )
                                        ],
                                      ),
                                    ),
                                    AppUtils.kGap6,
                                    Expanded(
                                      child: CustomTextField(
                                        showEnabledBorder: true,
                                        onChanged: (value) {
                                          context.read<ConfirmationUserBloc>().add(
                                                WritePhoneNumberEvent(value),
                                              );
                                        },
                                        controller: _phoneNumberController,
                                        textInputFormatter: MaskedTextInputFormatter(
                                          mask: '00 000 00 00',
                                          separator: ' ',
                                          filter: RegExp('[0-9]'),
                                        ),
                                        hintText: 'Введите номер',
                                        contentPadding: AppUtils.kPaddingAll16,
                                        textInputType: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              AppUtils.kGap24,
                              _NextButtonWidget(phoneNumberController: _phoneNumberController),
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
                                        // try {
                                        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
                                        if (googleUser != null) {
                                          // Optionally, retrieve authentication details
                                          final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

                                          // Use the tokens if needed (e.g., Firebase login)
                                          final String? idToken = googleAuth.idToken;
                                          final String? accessToken = googleAuth.accessToken;

                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text('Welcome, ${googleUser.displayName}!'),
                                          ));
                                          print('idToken: $idToken, $accessToken');
                                          // Add further logic here (e.g., navigate to another page)
                                        }
                                        // } catch (error) {
                                        //   print(error);
                                        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        //     content: Text('Google Sign-In failed: $error'),
                                        //   ));
                                        // }
                                      }),
                                  AppUtils.kGap8,
                                  SocialWidget(icon: PngImage.faceBookIc, onTap: () {}),
                                  if (Platform.isIOS) AppUtils.kGap8,
                                  if (Platform.isIOS) SocialWidget(icon: PngImage.appleIc, onTap: () {}),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.only(top: 36),
                        //   child: Text(
                        //     'your_phone_number'.tr(),
                        //     style: context.textStyle.size28Weight700White.copyWith(
                        //       color: context.colorScheme.onSurface,
                        //     ),
                        //   ),
                        // ),
                        // AppUtils.kGap24,
                        // Text(
                        //   'we_will_send_confirmation_code_to_your_number'.tr(),
                        //   style: context.textStyle.regularBody.copyWith(
                        //     color: context.color.grey400,
                        //   ),
                        // ),
                        // AppUtils.kGap24,
                        // // const _SelectUserRoleWidget(),
                        // // AppUtils.kGap24,
                        // CustomTextField(
                        //   hintText: 'enter_phone_number'.tr(),
                        //   labelText: 'phone_number'.tr(),
                        //   fillColor: Colors.transparent,
                        //   enabledBorder: const OutlineInputBorder(
                        //     borderRadius: AppUtils.kBorderRadius12,
                        //     borderSide: BorderSide(
                        //       color: Color(0xff626FFF),
                        //     ),
                        //   ),
                        //   textInputType: TextInputType.number,
                        //   prefixIcon: Padding(
                        //     padding: const EdgeInsets.only(left: 12, right: 8),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.min,
                        //       children: [
                        //         Image.asset(
                        //           PngImage.icFlag,
                        //           width: 28,
                        //           height: 18,
                        //         ),
                        //         AppUtils.kGap8,
                        //         Text(
                        //           '+998',
                        //           style: context.textStyle.regularCallout,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        //   prefixTextStyle: context.textStyle.regularSubheadline,
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // bottomNavigationBar: _NextButtonWidget(
          //   phoneNumberController: _phoneNumberController,
          // ),
        ),
      );
}
