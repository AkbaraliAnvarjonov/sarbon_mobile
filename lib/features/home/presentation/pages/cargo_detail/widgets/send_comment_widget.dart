part of '../cargo_detail_page.dart';

class _SendCommentWidget extends StatelessWidget {
  const _SendCommentWidget({
    required this.comment,
  });

  final String comment;

  @override
  Widget build(BuildContext context) => Material(
        borderRadius: AppUtils.kBorderRadius12,
        color: context.colorScheme.surface,
        child: Padding(
          padding: AppUtils.kPaddingAll12,
          child: HtmlWidget(
            comment,
            textStyle: context.textStyle.regularSubheadline,
          ),
        ),
      );
}
