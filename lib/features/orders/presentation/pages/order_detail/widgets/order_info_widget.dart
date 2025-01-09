part of '../order_detail_page.dart';

class _OrderInfoWidget extends StatefulWidget {
  const _OrderInfoWidget({
    required this.details,
  });

  final GetOrderDetailsResponseEntity? details;

  @override
  State<_OrderInfoWidget> createState() => _OrderInfoWidgetState();
}

class _OrderInfoWidgetState extends State<_OrderInfoWidget> {
  List<String> infoTypes = [
    'Вес: ',
    'Объем: ',
    'Товар: ',
    'Вид: ',
    // 'Доп: ',
  ];

  late final List<String> info;

  @override
  void initState() {
    info = [
      '${widget.details?.weight} т',
      '${widget.details?.volumeM3} м3',
      widget.details?.cargoTypeDetailsData?.name ?? '',
      if (widget.details?.hasAdditionalLoad ?? false)
        'возм.догруз'
      else
        'невозм.догруз',
      // 'выгрузка водителем',
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Ink(
        padding: AppUtils.kPaddingAll12,
        decoration: BoxDecoration(
          borderRadius: AppUtils.kBorderRadius12,
          color: context.colorScheme.onPrimary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            infoTypes.length,
            (index) => OrderInfoItemWidget(
              title: infoTypes[index],
              info: info[index],
              infoColor: index == 3 ? context.color.pink : null,
              isLastItem: index == infoTypes.length - 1,
            ),
          ),
        ),
      );
}
