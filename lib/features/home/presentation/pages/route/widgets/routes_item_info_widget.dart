part of 'routes_item_widget.dart';

class _RoutesItemInfoWidget extends StatelessWidget {
  const _RoutesItemInfoWidget({
    required this.value,
    required this.title,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(
          text: title,
          style: context.textStyle.size14Weight400Black.copyWith(
            color: context.color.midGray,
          ),
          children: [
            TextSpan(
              text: value,
              style: context.textStyle.size14Weight500Black,
            ),
          ],
        ),
      );
}
