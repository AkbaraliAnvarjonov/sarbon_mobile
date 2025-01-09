part of '../add_car_page.dart';

class TrailerPhotoPage extends StatelessWidget {
  const TrailerPhotoPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              const _Trailer1PhotoWidget(),
              AppUtils.kGap12,
              const _Trailer2PhotoWidget(),
            ]),
          )
        ],
      );
}
