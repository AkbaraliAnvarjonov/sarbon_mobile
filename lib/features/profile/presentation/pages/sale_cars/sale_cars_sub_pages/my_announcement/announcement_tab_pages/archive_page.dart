part of '../my_announcement_page.dart';

class _ArchiveTabPage extends StatelessWidget {
  const _ArchiveTabPage();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AnnouncementBloc, AnnouncementState>(
        builder: (context, state) => state.inActiveAnnouncementList.isEmpty &&
                !state.getInActiveAnnouncementStatus.isLoading
            ? Padding(
                padding: AppUtils.kPaddingAll16,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'empty_archived_my_sale_car'.tr(),
                        style: context.textStyle.appBarTitle.copyWith(
                          color: context.color.lightGray,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            : state.getInActiveAnnouncementStatus.isLoading
                ? const Center(child: CircularProgressIndicator.adaptive())
                : RefreshIndicator(
                    onRefresh: () async {
                      context.read<AnnouncementBloc>().add(
                            const GetInActiveAnnouncementEvent(),
                          );
                    },
                    child: SafeArea(
                      child: ListView.separated(
                        padding: AppUtils.kPaddingTop16,
                        itemBuilder: (context, index) => AnnouncementCarWidget(
                          onTap: () async {
                            await context
                                .pushNamed(
                              Routes.updateArchiveAnnouncement,
                              extra: state.inActiveAnnouncementList[index],
                            )
                                .then(
                              (value) {
                                if (value != null && value == true) {
                                  if(!context.mounted) return;
                                  context.read<AnnouncementBloc>()
                                    ..add(
                                      const GetInActiveAnnouncementEvent(),
                                    )
                                    ..add(
                                      const GetActiveAnnouncementEvent(),
                                    );
                                }
                              },
                            );
                          },
                          imageUrl:
                              state.inActiveAnnouncementList[index].imageUrl,
                          carName:
                              state.inActiveAnnouncementList[index].carName,
                          carPrice: state
                              .inActiveAnnouncementList[index].carPrice
                              .toInt(),
                          currency: state.inActiveAnnouncementList[index]
                              .currencyIdData.name,
                          carDescription: state
                              .inActiveAnnouncementList[index].carDescription,
                        ),
                        separatorBuilder: (context, index) => AppUtils.kGap8,
                        itemCount: state.inActiveAnnouncementList.length,
                      ),
                    ),
                  ),
      );
}
