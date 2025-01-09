part of 'routes_item_widget.dart';

class _RoutesNameWidget extends StatelessWidget {
  const _RoutesNameWidget({
    required this.fromAddress,
    required this.toAddress,
    required this.fromCity,
    required this.toCity,
  });

  final String fromAddress;
  final String toAddress;
  final String fromCity;
  final String toCity;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fromCity,
                style: context.textStyle.buttonStyle.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
              Text(
                fromAddress,
                style: context.textStyle.regularFootnote.copyWith(
                  color: context.color.gray700,
                ),
              ),
            ],
          ),
          AppUtils.kGap8,
          Icon(
            Icons.arrow_forward,
            color: context.colorScheme.onSurface,
            size: 18,
          ),
          AppUtils.kGap8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                toCity,
                overflow: TextOverflow.ellipsis,
                style: context.textStyle.buttonStyle.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
              Text(
                toAddress,
                overflow: TextOverflow.ellipsis,
                style: context.textStyle.regularFootnote.copyWith(
                  color: context.color.gray700,
                ),
              ),
            ],
          ),
        ],
      );
}
