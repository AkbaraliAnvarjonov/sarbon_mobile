part of '../../announcement_tab_pages/sub_pages/create_new_announcement_page.dart';

class _InputCarNameViewWidget extends StatelessWidget {
  const _InputCarNameViewWidget({
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) => CustomTextField(
    labelText: 'info_about_vehicle'.tr(),
    validator: (value) =>
        value!.isEmpty ? 'validator_field_can_not_be_empty'.tr() : null,
    autoValidateMode: AutovalidateMode.onUserInteraction,
    controller: nameController,
    contentPadding: AppUtils.kPaddingHorizontal12,
    hintText: 'brand'.tr(),
    hintTextStyle: context.textStyle.regularSubheadline.copyWith(
      color: context.color.greyText,
    ),
    fillColor: context.colorScheme.surface,
  );
}
