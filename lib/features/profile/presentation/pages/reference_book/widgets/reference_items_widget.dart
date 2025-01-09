part of '../reference_book_page.dart';

class _ReferenceItemsWidget extends StatefulWidget {
  const _ReferenceItemsWidget({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  State<_ReferenceItemsWidget> createState() => _ReferenceItemsWidgetState();
}

class _ReferenceItemsWidgetState extends State<_ReferenceItemsWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  bool isTapExpansionTile = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          AppUtils.kGap4,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: HtmlWidget(
                  widget.title,
                  textStyle: context.textStyle.buttonStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isTapExpansionTile = !isTapExpansionTile;
                  });
                  if (isTapExpansionTile) {
                    animationController.forward();
                  } else {
                    animationController.reverse();
                  }
                },
                icon: Icon(
                  isTapExpansionTile
                      ? Icons.remove_circle_outline_outlined
                      : Icons.add_circle_outline_outlined,
                  color: context.color.middleGray,
                  size: 20,
                ),
              ),
            ],
          ),
          SizeTransition(
            sizeFactor: animationController,
            axisAlignment: -1,
            child: HtmlWidget(
              widget.description,
              textStyle: context.textStyle.size14Weight400Black.copyWith(
                color: context.color.greyText,
              ),
            ),
          ),
          AppUtils.kGap16,
        ],
      );
}
