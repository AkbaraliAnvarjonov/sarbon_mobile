import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../bloc/confirmation_user/confirmation_user_bloc.dart';
import 'page_arguments/otp_page_arguments.dart';
import 'widgets/error_register_dialog.dart';

part 'mixin/confirm_otp_mixin.dart';

part 'widgets/resend_code.dart';


part 'widgets/pinput_register_widget.dart';

part 'widgets/continue_button_widget.dart';

class ConfirmOtpPage extends StatefulWidget {
  const ConfirmOtpPage({
    super.key,
    required this.pageArguments,
  });

  final ConfirmOtpPageArguments pageArguments;

  @override
  State<ConfirmOtpPage> createState() => _ConfirmOtpPahState();
}

class _ConfirmOtpPahState extends State<ConfirmOtpPage> with ConfirmOtpMixin {
  @override
  void initState() {
    super.initState();
    initControllers();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        onPopInvoked: (value) async {
          await widget.pageArguments.pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: BlocListener<ConfirmationUserBloc, ConfirmationUserState>(
          listenWhen: (previous, current) =>
              previous.verifyOtpStatus != current.verifyOtpStatus,
          listener: (context, state) async {
            if (state.verifyOtpStatus.isSuccess) {
              await widget.pageArguments.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else if (state.verifyOtpStatus.isError) {
              pinPutController.clear();
            } else if (state.verifyOtpStatus.isUserFoundError) {
              await showDialog<void>(
                context: context,
                builder: (_) => const ErrorRegisterDialog(),
              ).then(
                (value) => widget.pageArguments.pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              );
            }
          },
          child: Scaffold(
            backgroundColor: context.colorScheme.onPrimary,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                ),
                onPressed: () async {
                  await widget.pageArguments.pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
            body: ModalProgressHUD(
              inAsyncCall: context.select(
                (ConfirmationUserBloc bloc) => bloc.state.verifyOtpStatus.isLoading,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: AppUtils.kPaddingAll16,
                    child: Text(
                      'confirmation_code'.tr(),
                      style: context.textStyle.headline,
                    ),
                  ),
                  AppUtils.kGap8,
                  Padding(
                    padding: AppUtils.kPaddingHorizontal16,
                    child: RichText(
                      text: TextSpan(
                        text: 'enter_sms_code'.tr(),
                        children: [
                          TextSpan(
                            text: '\n+998 ${widget.pageArguments.phoneNumber}',
                            style: context.textStyle.regularSubheadline,
                          ),
                        ],
                        style: context.textStyle.regularSubheadline.copyWith(
                          color: context.color.triarity,
                        ),
                      ),
                    ),
                  ),
                  AppUtils.kGap40,
                  Padding(
                    padding: AppUtils.kPaddingHorizontal16,
                    child: Text(
                      'sms_code'.tr(),
                      style: context.textStyle.size14Weight400Black,
                    ),
                  ),
                  AppUtils.kGap6,
                  _PinPutRegisterWidget(
                    pinPutController: pinPutController,
                    defaultPinTheme: defaultPinTheme,
                    pinPutFocusNode: pinPutFocusNode,
                    phoneNumber: widget.pageArguments.phoneNumber,
                  ),
                  AppUtils.kSpacer,
                  Center(
                    child: _TimerWidget(
                      phoneNumber: widget.pageArguments.phoneNumber,
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: _ContinueRegisterButtonWidget(
              pinPutController: pinPutController,
              phoneNumber: widget.pageArguments.phoneNumber,
            ),
          ),
        ),
      );
}
