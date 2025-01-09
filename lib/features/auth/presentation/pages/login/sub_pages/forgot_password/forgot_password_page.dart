import 'dart:async';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import '../../../../../../../constants/image_constants.dart';
import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../../../core/widgets/inputs/masked_text_input_formatter.dart';
import '../../../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../../../router/app_routes.dart';
import '../../../../../data/models/user_role/user_role_model.dart';
import '../../../../bloc/forgot_password/forgot_password_bloc.dart';

part 'mixin/forgot_password_mixin.dart';

part '../confirm_number/mixin/confirm_number_mixin.dart';

part '../create_new_password/mixin/create_new_password_mixin.dart';

part '../confirm_number/confirm_phone_number_page.dart';

part '../confirm_otp/confirm_otp_page.dart';

part '../create_new_password/create_new_password_page.dart';

part '../confirm_otp/widgets/resend_code.dart';

part '../confirm_otp/mixin/confirm_otp_mixin.dart';

part '../confirm_number/widgets/select_role_widget.dart';

part '../confirm_number/widgets/confirm_number_error_dialog.dart';

part '../confirm_number/widgets/continue_button_widget.dart';

part '../confirm_otp/widgets/otp_error_dialog_widget.dart';

part '../confirm_otp/widgets/pinput_otp_widget.dart';

part '../confirm_otp/widgets/confirm_button_widget.dart';

part '../confirm_otp/widgets/send_message_text_widget.dart';

part '../create_new_password/widgets/continue_button_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with
        ConfirmOtpMixin,
        CreateNewPasswordMixin,
        ConfirmNumberMixin,
        ForgotPasswordMixin {
  @override
  void initState() {
    super.initState();
    initControllers();
    initControllersCreateNewPassword();
    pinPutFocusNode.requestFocus();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF3F4F7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.transparent),
      ),
    );
  }

  @override
  void dispose() {
    disposeControllers();
    disposeControllersCreateNewPassword();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.colorScheme.surface,
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _ConfirmPhoneNumberPage(
              pageController: _pageController,
              formKey: formKeyPhoneNumber,
            ),
            _ConfirmOtpPage(
              pageController: _pageController,
              phoneNumber: context.select(
                (ForgotPasswordBloc bloc) => bloc.state.phoneNumber,
              ),
              defaultPinTheme: defaultPinTheme,
              pinPutController: pinPutController,
              pinPutFocusNode: pinPutFocusNode,
            ),
            _CreateNewPasswordPage(
              pageController: _pageController,
              createNewPasswordController: createNewPasswordController,
              confirmPasswordController: confirmPasswordController,
              confirmPasswordFocusNode: confirmPasswordFocusNode,
              createNewPasswordFocusNode: createNewPasswordFocusNode,
              formKey: formKeyCreatePassword,
            ),
          ],
        ),
      );
}
