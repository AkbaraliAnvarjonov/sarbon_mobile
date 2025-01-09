import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/icons_constants.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../router/app_routes.dart';
import '../../../main/presentation/bloc/main_bloc.dart';
import '../bloc/profile_bloc.dart';
import 'widgets/change_language_widget.dart';
import 'widgets/contact_us_widget.dart';
import 'widgets/delete_profile_deialog.dart';
import 'widgets/log_out_profile_deialog.dart';
import 'widgets/profile_item_widget.dart';
import 'widgets/user_info_widget.dart';

part 'mixins/profile_mixin.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with ProfileMixin {
  @override
  void initState() {
    super.initState();
    initControllers();
  }

  @override
  Widget build(BuildContext context) => BlocListener<ProfileBloc, ProfileState>(
        listenWhen: (previous, current) => previous.deleteUserStatus != current.deleteUserStatus,
        listener: (context, state) async {
          if (state.deleteUserStatus.isSuccess) {
            await localSource.clear();
            if (!context.mounted) return;
            context.read<MainBloc>().add(
                  const MainEventChanged(BottomMenu.home),
                );
            context.goNamed(Routes.login);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('profile'.tr()),
            actions: [
              IconButton(
                icon: const Text(''),
                onPressed: () async {
                  await localSource.setHasChuck(
                    hasChuck: !localSource.hasChuck,
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Chuck is ${localSource.hasChuck ? 'enabled' : 'disabled'}',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          body: ModalProgressHUD(
            inAsyncCall: context.select((ProfileBloc bloc) => bloc.state.status.isLoading),
            child: CustomScrollView(
              controller: scrollController,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                SliverPadding(
                  padding: AppUtils.kPaddingAll16,
                  sliver: SliverToBoxAdapter(
                    child: ValueListenableBuilder(
                      valueListenable: localSource.prefers.listenable(
                        keys: [
                          AppKeys.phone,
                          AppKeys.imageUrl,
                          AppKeys.fullname,
                        ],
                      ),
                      builder: (context, box, widget) => UserInfoWidget(
                        fullName: localSource.fullName,
                        phoneNumber: localSource.phoneNumber,
                        imageUrl: localSource.imageUrl,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: AppUtils.kPaddingHorizontal16,
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ProfileItemWidget(
                          isTop: true,
                          text: 'contact_with_us'.tr(),
                          icon: SvgImage.contactUs,
                          onTap: () async {
                            await customModalBottomSheet<void>(
                              context: context,
                              builder: (_, controller) => const ContactUsWidget(),
                            );
                          },
                        ),
                        AppUtils.kPad52Divider,
                        ProfileItemWidget(
                          text: 'favourites'.tr(),
                          icon: SvgImage.icFavourite,
                          onTap: () async {
                            await context.pushNamed(Routes.favourites);
                          },
                        ),
                        AppUtils.kPad52Divider,
                        ProfileItemWidget(
                          text: 'my_cars'.tr(),
                          icon: SvgImage.icMyCars,
                          onTap: () {
                            unawaited(context.pushNamed(Routes.myCars));
                          },
                        ),
                        AppUtils.kPad52Divider,
                        ProfileItemWidget(
                          text: 'sale_car'.tr(),
                          icon: SvgImage.icUsers,
                          onTap: () async {
                            await context.pushNamed(Routes.carSale);
                          },
                        ),
                        AppUtils.kPad52Divider,
                        ProfileItemWidget(
                          text: 'calculator'.tr(),
                          icon: SvgImage.icCalculator,
                          onTap: () async {
                            await context.pushNamed(Routes.calculator);
                          },
                        ),
                        AppUtils.kPad52Divider,
                        ProfileItemWidget(
                          text: 'reference_book'.tr(),
                          icon: SvgImage.icNote,
                          onTap: () async {
                            await context.pushNamed(Routes.referenceBook);
                          },
                        ),
                        AppUtils.kPad52Divider,
                        ProfileItemWidget(
                          text: 'complain'.tr(),
                          icon: SvgImage.icReport,
                          onTap: () async {
                            await context.pushNamed(Routes.complain);
                          },
                        ),
                        AppUtils.kPad52Divider,
                        ProfileItemWidget(
                          isBottom: true,
                          text: 'language'.tr(),
                          icon: SvgImage.icChangeLanguage,
                          onTap: () async {
                            print('mana hozirgi til');
                            print(context.locale);
                            await customModalBottomSheet<void>(
                              context: context,
                              builder: (_, controller) => const ChangeLanguageWidget(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                AppUtils.kSliverGap16,
                SliverPadding(
                  padding: AppUtils.kPaddingHorizontal16,
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        ProfileItemWidget(
                          isTop: true,
                          isVisible: false,
                          text: 'log_out'.tr(),
                          icon: SvgImage.icLogOut,
                          onTap: () async {
                            await showDialog<void>(
                              context: context,
                              builder: (_) => LogOutProfileDialog(
                                onConfirm: () {
                                  localSource.clear();
                                  context.read<MainBloc>().add(
                                        const MainEventChanged(BottomMenu.home),
                                      );
                                  context.goNamed(Routes.login);
                                },
                              ),
                            );
                          },
                        ),
                        AppUtils.kPad52Divider,
                        ProfileItemWidget(
                          isBottom: true,
                          isVisible: false,
                          text: 'delete_account'.tr(),
                          icon: SvgImage.icTrash,
                          onTap: () async {
                            await showDialog<void>(
                              context: context,
                              builder: (_) => DeleteProfileDialog(
                                onConfirm: () {
                                  context.read<ProfileBloc>().add(
                                        const DeleteUserEvent(),
                                      );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                AppUtils.kSliverGap16,
              ],
            ),
          ),
        ),
      );
}
