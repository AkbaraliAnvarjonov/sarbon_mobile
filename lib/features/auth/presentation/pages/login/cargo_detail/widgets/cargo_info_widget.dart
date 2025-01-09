part of '../cargo_detail_page.dart';

class _CargoInfoWidget extends StatefulWidget {
  const _CargoInfoWidget({
    super.key,
    required this.details,
  });

  final GetCargoDetailsResponseEntity? details;

  @override
  State<_CargoInfoWidget> createState() => _CargoInfoWidgetState();
}

class _CargoInfoWidgetState extends State<_CargoInfoWidget> {
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
            (index) => CargoInfoItemWidget(
              title: infoTypes[index],
              info: info[index],
              infoColor: index == 3 ? context.color.pink : null,
              isLastItem: index == infoTypes.length - 1,
            ),
          ),
        ),
      );
}
