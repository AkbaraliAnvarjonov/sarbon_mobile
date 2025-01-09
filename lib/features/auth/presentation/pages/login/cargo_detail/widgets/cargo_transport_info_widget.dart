part of '../cargo_detail_page.dart';

class _CargoTransportInfoWidget extends StatefulWidget {
  const _CargoTransportInfoWidget({
    super.key,
    required this.transportType,
    required this.numberOfCars,
  });

  final String transportType;
  final int numberOfCars;

  @override
  State<_CargoTransportInfoWidget> createState() =>
      _CargoTransportInfoWidgetState();
}

class _CargoTransportInfoWidgetState extends State<_CargoTransportInfoWidget> {
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
            (index) => CargoInfoItemWidget(
              title: infoTypes[index],
              info: info[index],
              isLastItem: index == infoTypes.length - 1,
            ),
          ),
        ),
      );
}
