part of '../cargo_detail_page.dart';

class CargoDirectionWithDiagramInfoWidget extends StatefulWidget {
  const CargoDirectionWithDiagramInfoWidget({
    super.key,
    required this.details,
    required this.isLastItem,
    required this.isFirstItem,
    required this.onTap,
    required this.from,
    required this.to,
    required this.distance,
  });

  final FetchListPositionsEntity details;
  final bool isLastItem;
  final bool isFirstItem;
  final VoidCallback onTap;
  final String from;
  final String to;
  final String distance;

  @override
  State<CargoDirectionWithDiagramInfoWidget> createState() => _CargoDirectionWithDiagramInfoWidgetState();
}

class _CargoDirectionWithDiagramInfoWidgetState extends State<CargoDirectionWithDiagramInfoWidget> {
  double? height;
  GlobalKey heightKey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox = heightKey.currentContext!.findRenderObject()! as RenderBox;
      setState(() {
        height = renderBox.size.height;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: widget.onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  widget.isFirstItem ? SvgImage.loadingCargo : SvgImage.unloadingCargo,
                  width: 24,
                  height: 20,
                ),
                Visibility(
                  visible: !widget.isLastItem,
                  child: SizedBox(
                    height: height,
                    width: 20,
                    child: DashedVerticalDivider(
                      color: widget.isFirstItem ? context.colorScheme.primary : context.color.midGrey5,
                      thickness: 1,
                      indent: 2,
                      endIndent: 2,
                    ),
                  ),
                ),
              ],
            ),
            AppUtils.kGap12,
            Column(
              key: heightKey,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.kSize.width - 72,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: widget.details.addressType.checkStringLength(24),
                              style: context.textStyle.buttonStyle.copyWith(
                                color: const Color(0xFF211F26),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            if (widget.isFirstItem || widget.isLastItem)
                              TextSpan(
                                text: ' - ${(widget.isFirstItem ? widget.from : widget.to)}',
                                style: context.textStyle.size14Weight400Black.copyWith(
                                  color: context.color.midGray,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (widget.isLastItem)
                        Text(
                          '~ ${widget.distance}',
                          style: context.textStyle.size14Weight400Black.copyWith(color: const Color(0xFF7E7B86)),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  width: context.kSize.width - 72,
                  child: Row(
                    children: [
                      SizedBox(
                        width: context.kSize.width * 0.6,
                        child: Text(
                          widget.details.addressType.afterFirstComma,
                          style: context.textStyle.size14Weight400Black.copyWith(
                            color: context.color.midGray,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                ),
                AppUtils.kGap12,
              ],
            ),
          ],
        ),
      );
}
