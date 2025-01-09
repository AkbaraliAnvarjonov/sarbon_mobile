part of '../order_detail_page.dart';

class _OrderTransportInfoWidget extends StatefulWidget {
  const _OrderTransportInfoWidget({
    required this.transportType,
    required this.numberOfCars,
  });

  final String transportType;
  final int numberOfCars;

  @override
  State<_OrderTransportInfoWidget> createState() =>
      _OrderTransportInfoWidgetState();
}

class _OrderTransportInfoWidgetState extends State<_OrderTransportInfoWidget> {
  List<String> infoTypes = [
    'Тип: ',
    'Количество: ',
  ];

  late final List<String> info;

  @override
  void initState() {
    info = [
      widget.transportType,
      widget.numberOfCars.toString(),
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
              isLastItem: index == infoTypes.length - 1,
            ),
          ),
        ),
      );
}
