part of '../order_by_notification_page.dart';

class OrderDirectionNotificationWidget extends StatefulWidget {
  const OrderDirectionNotificationWidget({
    super.key,
    required this.details,
    required this.isLastItem,
    required this.isFirstItem,
  });

  final OrderAddressesByNotificationPoint details;
  final bool isLastItem;
  final bool isFirstItem;

  @override
  State<OrderDirectionNotificationWidget> createState() =>
      _OrderDirectionNotificationWidgetState();
}

class _OrderDirectionNotificationWidgetState
    extends State<OrderDirectionNotificationWidget> {
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
                      // SizedBox(
                      //   width: context.kSize.width - 140,
                      //   child: Text(
                      //     details.addressType,
                      //     style: context.textStyle.bodyCaption1.copyWith(
                      //       color: context.color.midGray,
                      //     ),
                      //   ),
                      // ),
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
              AppUtils.kGap12,
              Visibility(
                visible: !widget.isLastItem,
                child: SizedBox(
                  width: context.kSize.width - 90,
                  child: AppUtils.kDivider,
                ),
              ),
              AppUtils.kGap12,
            ],
          ),
        ],
      );
}
