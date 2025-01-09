part of '../order_detail_page.dart';

class OrderDirectionWithDiagramInfoWidget extends StatefulWidget {
  const OrderDirectionWithDiagramInfoWidget({
    super.key,
    required this.details,
    required this.isFirstItem,
    required this.onTap,
    required this.isForDeal,
    required this.isLastItem,
  });

  final OrderAddressesPoint details;
  final bool isFirstItem;
  final VoidCallback onTap;
  final bool isForDeal;
  final bool isLastItem;

  @override
  State<OrderDirectionWithDiagramInfoWidget> createState() =>
      _OrderDirectionWithDiagramInfoWidgetState();
}

class _OrderDirectionWithDiagramInfoWidgetState
    extends State<OrderDirectionWithDiagramInfoWidget> {

  double? height;
  GlobalKey heightKey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox =
      heightKey.currentContext!.findRenderObject()! as RenderBox;
      setState(() {
        height = renderBox.size.height;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: widget.isForDeal ? null : widget.onTap,
        // widget.isFirstItem || widget.isForDeal ? null : widget.onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: widget.isFirstItem
                      ? context.colorScheme.primary
                      : context.color.greyText,
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
                    child: VerticalDivider(
                      color: widget.isFirstItem
                          ? context.colorScheme.primary
                          : context.color.midGrey5,
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
                                  text: widget.details.addressName,
                                  style: context.textStyle.size15Weight600Black
                                      .copyWith(
                                    color: context.color.textColor,
                                  ),
                                ),
                                TextSpan(
                                  text: ' (${widget.details.cargoStatus.tr()})',
                                  style: context.textStyle.size10Weight400Black
                                      .copyWith(
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
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: context.color.greyText,
                    ),
                  ],
                ),
                AppUtils.kGap12,
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
