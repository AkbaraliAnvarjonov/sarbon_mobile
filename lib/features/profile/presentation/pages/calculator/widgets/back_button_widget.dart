part of '../sub_pages/map_page.dart';

class _BackButtonWidget extends StatelessWidget {
  const _BackButtonWidget();

  @override
  Widget build(BuildContext context) => Positioned(
    top: kToolbarHeight,
    left: 16,
    child: GestureDetector(
      onTap: () {
        context.pop();
      },
      child: SvgPicture.asset(
        SvgImage.icBackButton,
        width: 50,
        height: 50,
      ),
    ),
  );
}
