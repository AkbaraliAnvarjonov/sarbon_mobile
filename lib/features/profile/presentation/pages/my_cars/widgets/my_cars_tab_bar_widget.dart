part of '../my_cars_page.dart';

class MyCarsTabBarWidget extends StatelessWidget {
  const MyCarsTabBarWidget({
    super.key,
    required this.tabController,
    required this.tabIndex,
    required this.activeCarsCount,
    required this.inActiveCarsCount,
  });

  final TabController tabController;
  final int tabIndex;
  final int activeCarsCount;
  final int inActiveCarsCount;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingAll16,
        child: Ink(
          height: 44,
          decoration: BoxDecoration(
            color: context.color.backgroundTabBarColor,
            borderRadius: AppUtils.kBorderRadius12,
          ),
          child: TabBar(
            padding: AppUtils.kPaddingAll4,
            controller: tabController,
            splashBorderRadius: AppUtils.kBorderRadius12,
            tabs: [
              Tab(
                height: 36,
                iconMargin: AppUtils.kPaddingZero,
                text: '${'published'.tr()} ($activeCarsCount)',
              ),
              Tab(
                height: 36,
                iconMargin: AppUtils.kPaddingZero,
                text: '${'archive'.tr()} ($inActiveCarsCount)',
              ),
            ],
          ),
        ),
      );
}
