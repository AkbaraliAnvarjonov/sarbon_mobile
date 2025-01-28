part of '../home_page.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) => PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16), // Adjust the radius as needed
            bottomRight: Radius.circular(16),
          ),
          child: AppBar(
            systemOverlayStyle: systemUiOverlayStyle,
            centerTitle: false,
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: context.colorScheme.primary,
            title: Text(
              'search_cargo'.tr(),
              style: context.textStyle.appBarTitle.copyWith(
                fontWeight: FontWeight.w500,
                color: context.colorScheme.onPrimary,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () async {
                  await customModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    enableDrag: false,
                    maxHeight: context.kSize.height * 0.93,
                    builder: (_, controller) => BlocProvider.value(
                      value: context.read<HomeBloc>(),
                      child: const FilterCargoBottomSheet(),
                    ),
                  );
                },
                child: Material(
                  color: context.colorScheme.onPrimary.withOpacity(0.1),
                  borderRadius: AppUtils.kBorderRadius20,
                  child: Padding(
                    padding: AppUtils.kPaddingAll8,
                    child: Row(
                      children: [
                        SvgPicture.asset(SvgImage.filterIcon),
                        AppUtils.kGap4,
                        Text(
                          'filter'.tr(),
                          style: context.textStyle.bodyFootnote.copyWith(
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              localSource.userId.isNotEmpty
                  ? IconButton(
                      onPressed: () async {
                        await context.pushNamed(Routes.notification);
                      },
                      icon: SvgPicture.asset(
                        SvgImage.icBellNotification,
                        height: 32,
                        width: 32,
                      ),
                    )
                  : AppUtils.kGap12,
              // IconButton(
              //   onPressed: () async {
              //     await context.pushNamed(Routes.route);
              //   },
              //   icon: ValueListenableBuilder(
              //     valueListenable: localSource.prefers.listenable(keys: [AppKeys.badgeNumberRoutes]),
              //     builder: (BuildContext context, value, Widget? child) => Padding(
              //       padding: EdgeInsets.only(
              //         right: localSource.badgeNumberRoutes > 9 ? 12 : 0,
              //       ),
              //       child: Badge(
              //         backgroundColor: context.colorScheme.error,
              //         textStyle: context.textStyle.regularFootnote.copyWith(
              //           color: context.colorScheme.primary,
              //         ),
              //         textColor: context.colorScheme.surface,
              //         label: Text(localSource.badgeNumberRoutes.toString()),
              //         isLabelVisible: localSource.badgeNumberRoutes > 0,
              //         child: SvgPicture.asset(
              //           SvgImage.routeActive,
              //           height: 34,
              //           width: 34,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      );

  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
