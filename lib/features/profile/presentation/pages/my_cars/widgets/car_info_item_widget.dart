part of 'my_cars_item.dart';

class CarItemInfoWidget extends StatelessWidget {
  const CarItemInfoWidget({
    super.key,
    required this.type,
    required this.info,
  });

  final String type;
  final String info;

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(
          text: '$type: ',
          children: [
            TextSpan(
              text: info,
              style: context.textStyle.size14Weight400Black.copyWith(
                color: context.color.textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
          style: context.textStyle.size14Weight400Black.copyWith(
            color: context.color.greyText,
          ),
        ),
      );
}
