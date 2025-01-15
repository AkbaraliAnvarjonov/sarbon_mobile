import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../router/app_routes.dart';
import '../../../data/on_boarding_model.dart';
import '../../bloc/onboarding_bloc.dart';
import 'widgets/indicator_widget.dart';

part 'mixin/on_boarding_mixin.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> with SingleTickerProviderStateMixin, OnBoardingMixin {
  @override
  Widget build(BuildContext context) => BlocBuilder<OnBoardingBloc, OnBoardingState>(
        builder: (context, state) {
          int currentPage = context.watch<OnBoardingBloc>().state.currentPage;
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Stack(
                children: [
                  PageView.builder(
                    controller: pageController,
                    itemCount: OnBoardingModel.pages.length,
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (value) {
                      context.read<OnBoardingBloc>().add(OnBoardingTabChangedEvent(currentPage: value));
                      currentPage = value;
                    },
                    itemBuilder: (context, int index) => OnBoardingModel.pages[index],
                  ),
                  Positioned(
                    bottom: 52,
                    left: 0,
                    right: 0,
                    child: IndicatorWidget(currentPage: currentPage),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: AppUtils.kPaddingAll16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (currentPage == (OnBoardingModel.pages.length - 1)) {
                          await localSource.setFirstTime(firstTime: true);
                          if (!context.mounted) return;
                          context.pushReplacementNamed(Routes.selectAuth);
                        } else {
                          await pageController.nextPage(
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeInOutQuint,
                          );
                        }
                      },
                      child: Text('continue'.tr()),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
