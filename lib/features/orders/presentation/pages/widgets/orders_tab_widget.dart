part of 'orders_tab_bar_widget.dart';

class OrderTabWidget extends StatelessWidget {
  const OrderTabWidget({
    super.key,
    required this.title,
    required this.isActive,
  });

  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) => Tab(
        height: 40,
        iconMargin: AppUtils.kPaddingZero,
        child: Padding(
          padding: AppUtils.kPaddingHor8Ver10,
          child: Text(
            title,
            maxLines: 1,
          ),
        ),
      );
}
