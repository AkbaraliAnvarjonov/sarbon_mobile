part of '../cargo_detail_page.dart';

class CargoDirectionWithDiagramInfoWidget extends StatefulWidget {
  const CargoDirectionWithDiagramInfoWidget({
    super.key,
    required this.details,
    required this.isLastItem,
    required this.isFirstItem,
    required this.onTap,
    this.detailsCargo,
  });

  final FetchListPositionsEntity details;
  final bool isLastItem;
  final bool isFirstItem;
  final VoidCallback onTap;
  final GetCargoDetailsResponseEntity? detailsCargo;

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: context.kSize.width * 0.48,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: widget.details.addressType.cutString(13),
                                style: context.textStyle.buttonStyle.copyWith(
                                  color: const Color(0xFF211F26),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              if (widget.isFirstItem || widget.isLastItem)
                                TextSpan(
                                  text:
                                      ' - ${(widget.isFirstItem ? widget.detailsCargo?.countryCodeFrom : widget.detailsCargo?.countryCodeTo)}',
                                  style: context.textStyle.size14Weight400Black.copyWith(
                                    color: context.color.midGray,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      if (widget.isLastItem)
                        Text(
                          '~ ${widget.detailsCargo?.distance}',
                          style: context.textStyle.size14Weight400Black.copyWith(color: const Color(0xFF7E7B86)),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  width: context.kSize.width - 72,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: context.kSize.width * 0.48,
                        child: Text(
                          widget.details.addressType.afterFirstComma,
                          style: context.textStyle.size14Weight400Black.copyWith(
                            color: context.color.midGray,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      Text(
                        '${widget.isFirstItem ? (widget.detailsCargo?.asSoonAsA ?? false) ? 'ready_for_loading'.tr() : widget.detailsCargo?.loadTime?.dateMothWeek() : (widget.detailsCargo?.asSoonAsB ?? false) ? 'as_soon_as_possible'.tr() : widget.detailsCargo?.date?.dateMothWeek()}',
                        style: context.textStyle.size14Weight400Black.copyWith(
                          color: context.color.dark1,
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
