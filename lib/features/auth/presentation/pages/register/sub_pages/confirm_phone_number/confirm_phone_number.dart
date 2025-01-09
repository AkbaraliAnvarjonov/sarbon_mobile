import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../constants/image_constants.dart';
import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../../../core/widgets/inputs/masked_text_input_formatter.dart';
import '../../../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../data/models/user_role/user_role_model.dart';
import '../../../../bloc/confirmation_user/confirmation_user_bloc.dart';
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
          appBar: AppBar(),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 36),
                          child: Text(
                            'your_phone_number'.tr(),
                            style: context.textStyle.size28Weight700White.copyWith(
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        AppUtils.kGap24,
                        Text(
                          'we_will_send_confirmation_code_to_your_number'.tr(),
                          style: context.textStyle.regularBody.copyWith(
                            color: context.color.grey400,
                          ),
                        ),
                        AppUtils.kGap24,
                        // const _SelectUserRoleWidget(),
                        // AppUtils.kGap24,
                        CustomTextField(
                          hintText: 'enter_phone_number'.tr(),
                          labelText: 'phone_number'.tr(),
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
                          fillColor: Colors.transparent,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: AppUtils.kBorderRadius12,
                            borderSide: BorderSide(
                              color: Color(0xff626FFF),
                            ),
                          ),
                          textInputType: TextInputType.number,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  PngImage.icFlag,
                                  width: 28,
                                  height: 18,
                                ),
                                AppUtils.kGap8,
                                Text(
                                  '+998',
                                  style: context.textStyle.regularCallout,
                                ),
                              ],
                            ),
                          ),
                          prefixTextStyle: context.textStyle.regularSubheadline,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: _NextButtonWidget(
            phoneNumberController: _phoneNumberController,
          ),
        ),
      );
}
