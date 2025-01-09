part of '../opposite_offer_page.dart';

class _SendCommentWidget extends StatelessWidget {
  const _SendCommentWidget({
    required this.commentController,
    required this.driverCommentFocusNode,
  });

  final TextEditingController commentController;
  final FocusNode driverCommentFocusNode;

  @override
  Widget build(BuildContext context) => CustomTextField(
        textInputFormatter: FilteringTextInputFormatter.deny(RegExp(r'\d')),
        controller: commentController,
        focusNode: driverCommentFocusNode,
        hintText: 'add_your_comment'.tr(),
        contentPadding: AppUtils.kPaddingAll8,
        fillColor: context.colorScheme.onPrimary,
        onFieldSubmitted: (value) {
          driverCommentFocusNode.unfocus();
        },
        hintTextStyle: context.textStyle.regularSubheadline
            .copyWith(color: context.color.midGray),
        maxLines: 3,
      );
}
