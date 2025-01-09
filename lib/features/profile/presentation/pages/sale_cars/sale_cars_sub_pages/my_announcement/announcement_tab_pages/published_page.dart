part of '../my_announcement_page.dart';

class _PublishedTabPage extends StatelessWidget {
  const _PublishedTabPage();

  @override
  Widget build(BuildContext context) => BlocBuilder<AnnouncementBloc, AnnouncementState>(
        builder: (context, state) =>
            state.activeAnnouncementList.isEmpty && !state.getActiveAnnouncementStatus.isLoading
                ? Padding(
                    padding: AppUtils.kPaddingAll16,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'empty_published_my_sale_car'.tr(),
                          style: context.textStyle.appBarTitle.copyWith(
                            color: context.color.lightGray,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        AppUtils.kGap16,
                        SizedBox(
                          width: context.kSize.width,
                          child: ElevatedButton(
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
                            child: Text('add_publication'.tr()),
                          ),
                        ),
                      ],
                    ),
                  )
                : state.getActiveAnnouncementStatus.isLoading
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : SafeArea(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            context.read<AnnouncementBloc>().add(
                                  const GetActiveAnnouncementEvent(),
                                );
                          },
                          child: ListView.separated(
                            padding: AppUtils.kPaddingTop16,
                            itemBuilder: (context, index) => AnnouncementCarWidget(
                              onTap: () async {
                                await context
                                    .pushNamed(
                                  Routes.updateActiveAnnouncement,
                                  extra: state.activeAnnouncementList[index],
                                )
                                    .then(
                                  (value) {
                                    if (value != null && value == true) {
                                      if (!context.mounted) return;
                                      context.read<AnnouncementBloc>()
                                        ..add(
                                          const GetActiveAnnouncementEvent(),
                                        )
                                        ..add(
                                          const GetInActiveAnnouncementEvent(),
                                        );
                                    }
                                  },
                                );
                              },
                              imageUrl: state.activeAnnouncementList[index].imageUrl,
                              carName: state.activeAnnouncementList[index].carName,
                              carPrice: state.activeAnnouncementList[index].carPrice.toInt(),
                              currency: state.activeAnnouncementList[index].currencyIdData.name,
                              carDescription: state.activeAnnouncementList[index].carDescription,
                            ),
                            separatorBuilder: (context, index) => AppUtils.kGap8,
                            itemCount: state.activeAnnouncementList.length,
                          ),
                        ),
                      ),
      );
}
