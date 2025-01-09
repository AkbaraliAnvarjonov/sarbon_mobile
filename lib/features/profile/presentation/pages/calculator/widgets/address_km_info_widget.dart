part of '../sub_pages/calculate_route_page.dart';

class _AddressKmHourInfoWidget extends StatefulWidget {
  const _AddressKmHourInfoWidget({
    required this.isFirstItem,
    required this.isLastItem,
    required this.address,
    required this.addressDistanceTimeModel,
    required this.isTwoItems,
  });

  final bool isFirstItem;
  final bool isLastItem;
  final bool isTwoItems;
  final AddressModel address;
  final AddressDistanceTimeModel addressDistanceTimeModel;

  @override
  State<_AddressKmHourInfoWidget> createState() =>
      _AddressKmHourInfoWidgetState();
}

class _AddressKmHourInfoWidgetState extends State<_AddressKmHourInfoWidget> {
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
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: !widget.isFirstItem
                    ? context.color.lightGreen
                    : context.colorScheme.primary,
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
                    color: context.color.midGrey5,
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
              SizedBox(
                width: context.kSize.width - 116,
                child: Text(
                  widget.address.name,
                  style: context.textStyle.size15Weight600Black.copyWith(
                    color: context.color.textColor,
                  ),
                ),
              ),
              if (widget.isTwoItems)
                Visibility(
                  visible: widget.isLastItem,
                  child: Padding(
                    padding: AppUtils.kPaddingVertical8,
                    child: SizedBox(
                      width: context.kSize.width - 116,
                      child: Row(
                        children: [
                          Text(
                            widget.addressDistanceTimeModel.distance,
                            style:
                                context.textStyle.size15Weight600Black.copyWith(
                              color: context.color.midGray,
                            ),
                          ),
                          AppUtils.kSpacer,
                          Text(
                            widget.addressDistanceTimeModel.time,
                            style:
                                context.textStyle.size13Weight600Black.copyWith(
                              color: context.color.midGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else
                Padding(
                  padding: AppUtils.kPaddingVertical8,
                  child: SizedBox(
                    width: context.kSize.width - 116,
                    child: Row(
                      children: [
                        Text(
                          widget.addressDistanceTimeModel.distance,
                          style:
                              context.textStyle.size15Weight600Black.copyWith(
                            color: context.color.midGray,
                          ),
                        ),
                        AppUtils.kSpacer,
                        Text(
                          widget.addressDistanceTimeModel.time,
                          style:
                              context.textStyle.size13Weight600Black.copyWith(
                            color: context.color.midGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ],
      );
}
