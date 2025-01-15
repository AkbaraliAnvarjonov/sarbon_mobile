import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sarbon_mobile/features/main/presentation/pages/widgets/auth_bottom_sheet.dart';

import '../../../../constants/icons_constants.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/mixins/location_mixin.dart';
import '../../../../core/platform/network_info.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../injector_container.dart';
import '../../../../router/app_routes.dart';
import '../../../home/presentation/bloc/route/routes_bloc.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../home/presentation/pages/route/route_page.dart';
import '../../../orders/presentation/bloc/orders_bloc.dart';
import '../../../orders/presentation/pages/orders_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../bloc/main_bloc.dart';
import 'widgets/location_bottom_sheet.dart';

part '../mixin/main_mixin.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin, WidgetsBindingObserver, MainMixin {

  Future<void> _subscribeTopic() async {
    await FirebaseMessaging.instance.subscribeToTopic('sarbon');
  }

  @override
  void initState() {
    super.initState();
    unawaited(initController(this));
    tabController = TabController(length: 4, vsync: this);
    unawaited(_subscribeTopic());
  }

  @override
  Widget build(BuildContext context) => BlocSelector<MainBloc, MainState, BottomMenu>(
        selector: (state) => state.bottomMenu,
        builder: (_, bottomMenu) {
          if (bottomMenu.index != tabController.index) {
            tabController.index = bottomMenu.index;
            print("bottomMenu.index :${bottomMenu.index}");

            tabController.animateTo(bottomMenu.index);
          }
          return WillPopScope(
            onWillPop: () async {
              if (bottomMenu.index != 0) {
                context.read<MainBloc>().add(
                      MainEventChanged(
                        BottomMenu.values[0],
                      ),
                    );
                return false;
              }
              return true;
            },
            child: Scaffold(
              body: TabBarView(
                controller: tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const HomePage(),
                  BlocProvider(
                    create: (_) => sl<RoutesBloc>()..add(const FetchRoutesEvent()),
                    child: const RoutePage(),
                  ),
                  BlocProvider(
                    create: (context) => sl<OrdersBloc>(),
                    child: const OrdersPage(),
                  ),
                  const ProfilePage(),
                ],
              ),
              bottomNavigationBar: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: AppUtils.kBorderRadiusTop12,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TabIndicators(
                      numTabs: 4,
                      activeIdx: tabController.index,
                      activeColor: context.colorScheme.primary,
                      padding: 16,
                      height: 4,
                    ),
                    BottomNavigationBar(
                      elevation: 1,
                      currentIndex: bottomMenu.index,
                      onTap: (index) async {
                        if (localSource.userId.isEmpty && index == 2) {
                          await customModalBottomSheet<void>(
                            context: context,
                            maxHeight: 410,
                            minHeight: 380,
                            builder: (_, controller) => const AuthBottomSheet(),
                          );
                        } else {
                          tabController.index = index;

                          context.read<MainBloc>().add(MainEventChanged(BottomMenu.values[index]));
                        }
                      },
                      items: [
                        BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                            SvgImage.searchActive,
                            width: 24,
                            height: 24,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFF7E7B86),
                              BlendMode.srcIn,
                            ),
                          ),
                          activeIcon: SvgPicture.asset(
                            SvgImage.searchActive,
                            width: 24,
                            height: 24,
                            colorFilter: ColorFilter.mode(
                              context.colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                          label: 'search_cargo'.tr(),
                        ),
                        BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                            SvgImage.marshrutIcon,
                            width: 24,
                            height: 24,
                          ),
                          activeIcon: SvgPicture.asset(
                            SvgImage.marshrutIcon,
                            width: 24,
                            height: 24,
                            colorFilter: ColorFilter.mode(
                              context.colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                          label: 'route'.tr(),
                        ),
                        BottomNavigationBarItem(
                          icon: BlocBuilder<MainBloc, MainState>(
                            builder: (context, state) => Stack(
                              children: [
                                SvgPicture.asset(
                                  SvgImage.ordersInActive,
                                  width: 24,
                                  height: 24,
                                ),
                                if (state.signedOrderCount > 0)
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      width: 14,
                                      height: 14,
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        state.signedOrderCount.toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          activeIcon: BlocBuilder<MainBloc, MainState>(
                            builder: (context, state) => Stack(
                              children: [
                                SvgPicture.asset(
                                  SvgImage.ordersInActive,
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                    context.colorScheme.primary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                if (state.signedOrderCount > 0)
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      width: 14,
                                      height: 14,
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        state.signedOrderCount.toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          label: 'orders'.tr(),
                        ),
                        BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                            SvgImage.profileInActive,
                            width: 24,
                            height: 24,
                          ),
                          activeIcon: SvgPicture.asset(
                            SvgImage.profileInActive,
                            width: 24,
                            height: 24,
                            colorFilter: ColorFilter.mode(
                              context.colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                          label: 'profile'.tr(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}

class TabIndicators extends StatelessWidget {
  final int _numTabs;
  final int _activeIdx;
  final Color _activeColor;
  final Color _inactiveColor;
  final double _padding;
  final double _height;

  const TabIndicators({
    required int numTabs,
    required int activeIdx,
    required Color activeColor,
    required double padding,
    required double height,
    Color inactiveColor = const Color(0x00FFFFFF),
    super.key,
  })  : _numTabs = numTabs,
        _activeIdx = activeIdx,
        _activeColor = activeColor,
        _inactiveColor = inactiveColor,
        _padding = padding,
        _height = height;

  @override
  Widget build(BuildContext context) {
    final elements = <Widget>[];

    for (var i = 0; i < _numTabs; ++i) {
      elements.add(
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _padding),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: AppUtils.kBorderRadiusBottom12,
                color: i == _activeIdx ? _activeColor : _inactiveColor,
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: _height,
      child: Row(
        children: elements,
      ),
    );
  }
}
