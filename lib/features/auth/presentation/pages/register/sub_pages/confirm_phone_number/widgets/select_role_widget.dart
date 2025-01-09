part of '../confirm_phone_number.dart';

class _SelectUserRoleWidget extends StatelessWidget {
  const _SelectUserRoleWidget();

  @override
  Widget build(BuildContext context) => BlocBuilder<ConfirmationUserBloc, ConfirmationUserState>(
        buildWhen: (previous, current) => previous.selectedRole != current.selectedRole,
        builder: (context, state) => DropdownButtonHideUnderline(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'role'.tr(),
                style: context.textStyle.size14Weight500Black.copyWith(
                  color: context.color.gray700,
                ),
              ),
              AppUtils.kGap6,
              DropdownButton2<UserRole>(
                isExpanded: true,
                hint: Text(
                  'select_role'.tr(),
                  style: context.textStyle.regularSubheadline.copyWith(
                    color: context.color.greyText,
                  ),
                ),
                items: UserRole.userRoles
                    .map(
                      (roles) => DropdownMenuItem<UserRole>(
                        value: roles,
                        child: Text(
                          roles.title.tr(),
                          style: context.textStyle.size14Weight400Black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                value: state.selectedRole,
                onChanged: (value) {
                  context.read<ConfirmationUserBloc>().add(
                        SelectedRoleChangedEvent(
                          value!,
                        ),
                      );
                },
                buttonStyleData: ButtonStyleData(
                  height: 48,
                  width: double.maxFinite,
                  padding: AppUtils.kPaddingHorizontal12,
                  decoration: BoxDecoration(
                    borderRadius: AppUtils.kBorderRadius12,
                    color: context.colorScheme.surface,
                    border: Border.all(
                      color: context.color.midGrey5,
                    ),
                  ),
                ),
                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: context.color.greyText,
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  scrollPadding: AppUtils.kPaddingAll8,
                  maxHeight: 200,
                  decoration: BoxDecoration(
                    borderRadius: AppUtils.kBorderRadius12,
                    color: context.colorScheme.onPrimary,
                  ),
                  offset: const Offset(0, -8),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
