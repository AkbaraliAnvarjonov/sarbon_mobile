part of '../sub_pages/map_page.dart';

class _MapMarkIconWidget extends StatelessWidget {
  const _MapMarkIconWidget();

  @override
  Widget build(BuildContext context) => Center(
    child: SvgPicture.asset(
      SvgImage.icMapMark,
      width: 38,
      height: 62,
    ),
  );
}
