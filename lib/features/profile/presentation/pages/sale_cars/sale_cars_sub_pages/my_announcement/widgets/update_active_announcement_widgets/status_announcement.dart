part of '../../announcement_tab_pages/sub_pages/update_active_announcement_page.dart';

class _AnnouncementStatus extends StatelessWidget {
  const _AnnouncementStatus();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<UpdateActiveAnnouncementBloc, UpdateActiveAnnouncementState>(
        buildWhen: (previous, current) =>
            previous.announcementStatus != current.announcementStatus,
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'status'.tr(),
              style: context.textStyle.buttonStyle.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
            AppUtils.kGap8,
            Row(
              children: [
                SizedBox(
                  width: context.kSize.width / 2 - 20,
                  child: RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: AppUtils.kBorderRadius12,
                      side: BorderSide(
                        color: state.announcementStatus == 'active'
                            ? context.colorScheme.primary
                            : context.colorScheme.surface,
                      ),
                    ),
                    value: state.announcementStatus,
                    groupValue: 'active',
                    onChanged: (value) {
                      context.read<UpdateActiveAnnouncementBloc>().add(
                            const UpdateAnnouncementStatusEvent(
                              status: 'active',
                            ),
                          );
                    },
                    title: Text(
                      'activation'.tr(),
                      style: context.textStyle.size14Weight400Black,
                    ),
                  ),
                ),
                AppUtils.kGap8,
                SizedBox(
                  width: context.kSize.width / 2 - 20,
                  child: RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: AppUtils.kBorderRadius12,
                      side: BorderSide(
                        color: state.announcementStatus == 'in_active'
                            ? context.colorScheme.primary
                            : context.colorScheme.surface,
                      ),
                    ),
                    value: state.announcementStatus,
                    groupValue: 'in_active',
                    onChanged: (value) {
                      context.read<UpdateActiveAnnouncementBloc>().add(
                            const UpdateAnnouncementStatusEvent(
                              status: 'in_active',
                            ),
                          );
                    },
                    title: Text(
                      'archive'.tr(),
                      style: context.textStyle.size14Weight400Black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
