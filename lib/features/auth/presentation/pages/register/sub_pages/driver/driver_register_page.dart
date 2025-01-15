import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../constants/constants.dart';
import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/mixins/location_mixin.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../../../router/app_routes.dart';
import '../../../../../../main/presentation/bloc/main_bloc.dart';
import '../../../../../../main/presentation/pages/widgets/location_bottom_sheet.dart';
import '../../../../../domain/entities/registration/driver/register_driver_request_entity.dart';
import '../../../../../domain/entities/registration/driver/trailer_type_response_entity.dart';
import '../../../../bloc/confirmation_user/confirmation_user_bloc.dart';
import '../../mixin/driver_tab_item_mixin.dart';

part 'widgets/driver_item_widgets.dart';

part 'widgets/driver_register_error_dialog.dart';

part 'widgets/bottom_buttons_widget.dart';

class DriverRegisterPage extends StatefulWidget {
  const DriverRegisterPage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<DriverRegisterPage> createState() => _DriverRegisterPageState();
}

class _DriverRegisterPageState extends State<DriverRegisterPage> with DriverTabItemMixin {
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
          listenWhen: (previous, current) => previous.registerStatus != current.registerStatus,
          listener: (context, state) async {
            if (state.registerStatus.isSuccess) {
              context.goNamed(Routes.main);
              context.read<MainBloc>().add(MainEventChanged(BottomMenu.values[0]));
            } else if (state.registerStatus.isError) {
              await showDialog<void>(
                context: context,
                builder: (_) => _DriverRegisterErrorDialog(
                  message: state.errorText,
                ),
              );
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('registration_driver'.tr()),
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
                  (ConfirmationUserBloc bloc) => bloc.state.registerStatus.isLoading,
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: AppUtils.kPaddingAll16,
                      sliver: SliverList.list(
                        children: [
                          _SelectNameWidget(
                            nameController,
                            nameFocusNode,
                          ),
                          AppUtils.kGap16,
                          Text(
                            'type_vehicle'.tr(),
                            style: context.textStyle.size14Weight500Black.copyWith(
                              color: context.color.gray700,
                            ),
                          ),
                          AppUtils.kGap6,
                          BlocBuilder<ConfirmationUserBloc, ConfirmationUserState>(
                            buildWhen: (previous, current) =>
                                previous.selectedTypeItem != current.selectedTypeItem ||
                                previous.companies != current.companies,
                            builder: (context, state) => _SelectVehicleTypeWidget(
                              trailerTypes: state.trailerTypes,
                              selectedTrailer: state.selectedTypeItem,
                              onChanged: (value) async {
                                context.read<ConfirmationUserBloc>().add(
                                      SelectedTrailerChangedEvent(value),
                                    );
                              },
                            ),
                          ),
                          AppUtils.kGap16,
                          // _SelectEmailWidget(
                          //   emailController,
                          //   emailFocusNode,
                          // ),
                          // AppUtils.kGap16,
                          _SelectLoginWidget(
                            loginController,
                            loginFocusNode,
                          ),
                          AppUtils.kGap16,
                          _SelectPasswordWidget(
                            controller: passwordController,
                            focusNode: passwordFocusNode,
                            loginController: loginController,
                          ),
                          AppUtils.kGap16,
                          // _SelectConfirmPasswordWidget(
                          //   controller: confirmPasswordController,
                          //   confirmPasswordController: passwordController,
                          //   focusNode: confirmPasswordFocusNode,
                          // ),
                          // AppUtils.kGap16,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: _BottomButtonsWidget(
              nameController: nameController,
              loginController: loginController,
              passwordController: passwordController,
              formKey: formKey,
            ),
          ),
        ),
      );
}
