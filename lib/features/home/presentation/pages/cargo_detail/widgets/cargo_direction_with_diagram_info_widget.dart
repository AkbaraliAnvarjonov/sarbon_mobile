part of '../cargo_detail_page.dart';

class CargoDirectionWithDiagramInfoWidget extends StatefulWidget {
  const CargoDirectionWithDiagramInfoWidget({
    super.key,
    required this.details,
    required this.isLastItem,
    required this.isFirstItem,
    required this.onTap,
  });

  final FetchListPositionsEntity details;
  final bool isLastItem;
  final bool isFirstItem;
  final VoidCallback onTap;

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
                CircleAvatar(
                  radius: 10,
                  backgroundColor: widget.isFirstItem ? context.colorScheme.primary : context.color.greyText,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: context.colorScheme.onPrimary,
                  ),
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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.kSize.width - 140,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.details.addressType,
                                  style: context.textStyle.size15Weight600Black.copyWith(
                                    color: context.color.textColor,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' (${(widget.details.type == 'shipper' ? 'loading_status' : 'unloading_status').tr()})',
                                  style: context.textStyle.size10Weight400Black.copyWith(
                                    color: context.color.midGray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppUtils.kGap36,
                    Visibility(
                      visible: !widget.isFirstItem,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: context.color.greyText,
                      ),
                    ),
                  ],
                ),
                AppUtils.kGap8,
                Visibility(
                  visible: !widget.isLastItem,
                  child: SizedBox(
                    width: context.kSize.width - 90,
                    child: AppUtils.kDivider,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
