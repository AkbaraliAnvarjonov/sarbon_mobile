import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/gifs_constants.dart';
import '../../../../../constants/icons_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/isolate/file_upload.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/dialogs/select_image_sheet.dart';
import '../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../core/widgets/loading/modal_progress_hud.dart';

import '../../../../../router/app_routes.dart';
import '../../../data/models/user_update/put_user_info_request.dart';
import '../../bloc/edit_profile/edit_profile_bloc.dart';

part '../mixins/edit_profile_mixin.dart';

part 'widget/user_image_widget.dart';

part 'widget/add_additional_infos_widget.dart';

part 'widget/save_button_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage>
    with EditProfileMixin {
  @override
  void initState() {
    super.initState();
    initControllers();
  }

  @override
  void dispose() {
    super.dispose();
    disposeControllers();
  }

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<EditProfileBloc, EditProfileState>(
        listener: (_, state) {
          if (state.updateInfoStatus.isSuccess) {
            context.pop(true);
          }
        },
        builder: (_, state) => Scaffold(
          appBar: AppBar(
            title: Text('edit_profile'.tr()),
            titleSpacing: 0,
          ),
          body: ModalProgressHUD(
            inAsyncCall: state.updateInfoStatus.isLoading,
            child: Form(
              key: formKey,
              child: CustomScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                slivers: [
                  SliverSafeArea(
                    minimum: AppUtils.kPaddingAll16,
                    sliver: SliverMainAxisGroup(
                      slivers: [
                        SliverList.list(
                          children: [
                            AppUtils.kGap16,
                            const UserImageWidget(),
                            AppUtils.kGap24,
                            Text(
                              'total_information'.tr(),
                              style: context.textStyle.regularHeadline.copyWith(
                                color: context.color.subHeadline,
                              ),
                            ),
                            AppUtils.kGap12,
                            CustomTextField(
                              controller: nameController,
                              hintText: 'edit_full_name'.tr(),
                              fillColor: context.colorScheme.surface,
                              contentPadding: AppUtils.kPaddingHorizontal12,
                              labelText: 'f_i_o'.tr(),
                              labelTextStyle: context.textStyle.regularCaption1,
                              showBorder: false,
                            ),
                            AppUtils.kGap12,
                            CustomTextField(
                              controller: emailController,
                              hintText: 'edit_email'.tr(),
                              fillColor: context.colorScheme.surface,
                              contentPadding: AppUtils.kPaddingHorizontal12,
                              labelText: 'email'.tr(),
                              labelTextStyle: context.textStyle.regularCaption1,
                              showBorder: false,
                            ),
                            AppUtils.kGap12,
                            CustomTextField(
                              enabled: false,
                              style: context.textStyle.regularCallout.copyWith(
                                color: context.color.labelTextColor,
                              ),
                              controller: phoneNumberController,
                              hintText: 'edit_phone_number'.tr(),
                              fillColor: context.colorScheme.surface,
                              contentPadding: AppUtils.kPaddingHorizontal12,
                              labelText: 'phone_number'.tr(),
                              labelTextStyle: context.textStyle.regularCaption1,
                              showBorder: false,
                            ),
                            // AppUtils.kGap12,
                            // CustomTextField(
                            //   controller: loginController,
                            //   hintText: 'edit_login'.tr(),
                            //   fillColor: context.colorScheme.surface,
                            //   contentPadding: AppUtils.kPaddingHorizontal12,
                            //   labelText: 'add_login'.tr(),
                            //   labelTextStyle: context.textStyle.regularCaption1,
                            //   showBorder: false,
                            // ),
                            AppUtils.kGap12,
                            CustomTextField(
                              validator: state.password.isNotEmpty
                                  ? (value) {
                                      if (value != null && value.length < 8) {
                                        return 'password_error'.tr();
                                      }
                                      return null;
                                    }
                                  : null,
                              onChanged: (value) {
                                context.read<EditProfileBloc>().add(
                                      ChangePasswordEvent(password: value),
                                    );
                              },
                              controller: passwordController,
                              hintText: 'edit_password'.tr(),
                              fillColor: context.colorScheme.surface,
                              contentPadding: AppUtils.kPaddingHorizontal12,
                              labelText: 'password'.tr(),
                              labelTextStyle: context.textStyle.regularCaption1,
                              showBorder: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: _SaveButtonWidget(
            formKey: formKey,
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController,
          ),
        ),
      );
}
