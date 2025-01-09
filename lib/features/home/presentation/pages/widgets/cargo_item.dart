part of 'cargo_widget.dart';

class CargoItem extends StatelessWidget {
  const CargoItem({
    super.key,
    this.onTap,
    this.subTitle,
    this.icon,
    this.trailing,
    required this.title,
    this.isDateItem = false,
  });

  final VoidCallback? onTap;
  final String? subTitle;
  final String? icon;
  final String title;
  final bool isDateItem;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (subTitle?.isNotEmpty ?? false)
            Text(
              title,
              style: context.textStyle.size14Weight500Black.copyWith(
                color: context.color.gray700,
              ),
            ),
          AppUtils.kGap6,
          ListTile(
            visualDensity: const VisualDensity(vertical: -4),
            onTap: onTap,
            subtitle: Row(
              children: [
                if (icon != null)
                  SvgPicture.asset(
                    icon!,
                    height: 16,
                    width: 16,
                    color: context.colorScheme.primary,
                  ),
                AppUtils.kGap4,
                Text(
                  (subTitle?.isNotEmpty ?? false) ? (subTitle ?? '') : title,
                  style: context.textStyle.regularCallout.copyWith(
                    color: context.color.textColor,
                  ),
                ),
              ],
            ),
            trailing: trailing,
          ),
        ],
      );
}
