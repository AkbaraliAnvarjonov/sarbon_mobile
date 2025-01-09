part of '../add_car_page.dart';

class AdrInfoPage extends StatelessWidget {
  const AdrInfoPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              const _AdrPhotoWidget(),
              AppUtils.kGap12,
              BlocBuilder<AddCarBloc, AddCarState>(
                buildWhen: (previous, current) => previous.hydrolift != current.hydrolift,
                builder: (context, state) => AddUpdateCarItemWidget(
                  onTap: () {
                    context.read<AddCarBloc>().add(
                          const ChangeHydroliftStatusEvent(),
                        );
                  },
                  title: 'hydro_lift'.tr(),
                  value: state.hydrolift,
                ),
              ),
              AppUtils.kGap12,
              BlocBuilder<AddCarBloc, AddCarState>(
                buildWhen: (previous, current) => previous.koniki != current.koniki,
                builder: (context, state) => AddUpdateCarItemWidget(
                  onTap: () {
                    context.read<AddCarBloc>().add(
                          const ChangeKonikiStatusEvent(),
                        );
                  },
                  title: 'koniky'.tr(),
                  value: state.koniki,
                ),
              ),
              AppUtils.kGap12,
              BlocBuilder<AddCarBloc, AddCarState>(
                buildWhen: (previous, current) => previous.bodyDimensions != current.bodyDimensions,
                builder: (context, state) => AddUpdateCarItemWidget(
                  onTap: () {
                    context.read<AddCarBloc>().add(
                          const ChangeBodyDimensionsStatusEvent(),
                        );
                  },
                  title: 'internal_body_dimensions'.tr(),
                  value: state.bodyDimensions,
                ),
              ),
              AppUtils.kGap12,
            ]),
          )
        ],
      );
}
