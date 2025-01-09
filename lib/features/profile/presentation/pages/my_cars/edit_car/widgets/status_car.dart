part of '../edit_car_page.dart';

class _CarStatus extends StatelessWidget {
  const _CarStatus();

  @override
  Widget build(BuildContext context) => BlocBuilder<EditCarBloc, EditCarState>(
        buildWhen: (previous, current) =>
            previous.carStatus != current.carStatus,
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'status_advertisement'.tr(),
              style: context.textStyle.regularHeadline,
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
                        color: state.carStatus == 'active'
                            ? context.colorScheme.primary
                            : context.colorScheme.surface,
                        width: 2,
                      ),
                    ),
                    value: state.carStatus,
                    groupValue: 'active',
                    onChanged: (value) {
                      context.read<EditCarBloc>().add(
                            const ChangeActiveInActiveStatusEvent(
                              carStatus: 'active',
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
                        color: state.carStatus == 'in_active'
                            ? context.colorScheme.primary
                            : context.colorScheme.surface,
                        width: 2,
                      ),
                    ),
                    value: state.carStatus,
                    groupValue: 'in_active',
                    onChanged: (value) {
                      context.read<EditCarBloc>().add(
                            const ChangeActiveInActiveStatusEvent(
                              carStatus: 'in_active',
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
