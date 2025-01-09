import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../constants/constants.dart';
import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../../../router/app_routes.dart';
import '../../../../../domain/entities/registration/operator/register_operator_request_entity.dart';
import '../../../../bloc/confirmation_user/confirmation_user_bloc.dart';
import '../../mixin/operator_tab_item_mixin.dart';

part 'widgets/operator_item_widgets.dart';

part 'widgets/operator_register_error_dialog.dart';

part 'widgets/bottom_buttons_widget.dart';

class OperatorRegisterPage extends StatefulWidget {
  const OperatorRegisterPage({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<OperatorRegisterPage> createState() => OperatorRegisterPageState();
}

class OperatorRegisterPageState extends State<OperatorRegisterPage>
    with OperatorTabItemMixin {
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
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        onPopInvoked: (value) async {
          await widget.pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: BlocListener<ConfirmationUserBloc, ConfirmationUserState>(
          listenWhen: (previous, current) =>
              previous.registerStatus != current.registerStatus,
          listener: (context, state) async {
            if (state.registerStatus.isSuccess) {
              context.goNamed(Routes.main);
            } else if (state.registerStatus.isError) {
              await showDialog<void>(
                context: context,
                builder: (_) => const _OperatorRegisterErrorDialog(),
              );
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('registration_dispatcher'.tr()),
              leading: IconButton(
                icon: Icon(
                  Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                ),
                onPressed: () async {
                  await widget.pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
            body: Form(
              key: formKey,
              child: ModalProgressHUD(
                inAsyncCall: context.select(
                  (ConfirmationUserBloc bloc) =>
                      bloc.state.registerStatus.isLoading,
                ),
                child: CustomScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [
                    SliverSafeArea(
                      minimum: AppUtils.kPaddingAll16,
                      sliver: SliverList.list(
                        children: [
                          _SelectNameWidget(nameController, nameFocusNode),
                          AppUtils.kGap16,
                          _SelectEmailWidget(emailController, emailFocusNode),
                          AppUtils.kGap16,
                          _SelectLoginWidget(loginController, loginFocusNode),
                          AppUtils.kGap16,
                          _SelectPasswordWidget(
                            controller: passwordController,
                            focusNode: passwordFocusNode,
                            loginController: loginController,
                          ),
                          AppUtils.kGap16,
                          _SelectConfirmPasswordWidget(
                            confirmPasswordController: passwordController,
                            focusNode: confirmPasswordFocusNode,
                            controller: confirmPasswordController,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: _BottomButtonsWidget(
              formKey: formKey,
              nameController: nameController,
              emailController: emailController,
              loginController: loginController,
              passwordController: passwordController,
            ),
          ),
        ),
      );
}
