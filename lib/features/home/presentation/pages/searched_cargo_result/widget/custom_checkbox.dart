part of 'filter_bottom_sheet.dart';

class _CustomCheckBoxWidget extends StatelessWidget {
  const _CustomCheckBoxWidget({
    required this.onTap,
    required this.isChecked,
    required this.title,
  });

  final VoidCallback onTap;
  final bool isChecked;
  final String title;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius8,
            color: context.colorScheme.surface,
            border: Border.all(
              color:
                  isChecked ? context.colorScheme.primary : Colors.transparent,
            ),
          ),
          child: Padding(
            padding: AppUtils.kPaddingHor8Ver12,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: isChecked
                      ? null
                      : context.colorScheme.onSurface.withOpacity(0.1),
                  radius: 8,
                  child: isChecked
                      ? Center(
                          child: Icon(
                            Icons.check,
                            color: context.colorScheme.surface,
                            size: 13,
                          ),
                        )
                      : null,
                ),
                AppUtils.kGap8,
                SizedBox(
                  width: context.kSize.width * 0.3,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyle.size14Weight400Black,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
