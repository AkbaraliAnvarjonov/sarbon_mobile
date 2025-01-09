part of '../my_announcement_page.dart';

class _MyAnnouncementAppBar extends StatelessWidget {
  const _MyAnnouncementAppBar({
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: context.colorScheme.surface,
        centerTitle: false,
        systemOverlayStyle: systemUiOverlayStyle,
        title: Text('my_advertisements'.tr()),
        actions: [
          IconButton(
            onPressed: () async {
              await context.pushNamed(Routes.createNewAnnouncement).then(
                (value) {
                  if (value != null && value == true) {
                    if (!context.mounted) return;
                    context.read<AnnouncementBloc>().add(
                          const GetActiveAnnouncementEvent(),
                        );
                  }
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: AppUtils.kPaddingHor16Ver12,
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
                labelColor: context.colorScheme.onSurface,
                unselectedLabelColor: context.colorScheme.onSurface,
                tabs: [
                  Tab(
                    height: 36,
                    iconMargin: AppUtils.kPaddingZero,
                    text: 'published'.tr(),
                  ),
                  Tab(
                    height: 36,
                    iconMargin: AppUtils.kPaddingZero,
                    text: 'archive'.tr(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
