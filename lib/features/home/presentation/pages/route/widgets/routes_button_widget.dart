part of 'routes_item_widget.dart';

class _RoutesButtonWidget extends StatelessWidget {
  const _RoutesButtonWidget({
    required this.onPressed,
    required this.title,
    required this.icon,
    required this.color,
  });

  final VoidCallback onPressed;
  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: AppUtils.kBorderRadius4,
            border: Border.all(
              color: color,
            ),
          ),
          child: Padding(
            padding: AppUtils.kPaddingAll8,
            child: Row(
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
                AppUtils.kGap4,
                Text(
                  title,
                  style: context.textStyle.size14Weight500Black.copyWith(
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
