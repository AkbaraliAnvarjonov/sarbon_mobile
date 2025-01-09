part of '../my_cars_page.dart';

class ActiveCarsTabItem extends StatelessWidget {
  const ActiveCarsTabItem({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) => BlocBuilder<MyCarsBloc, MyCarsState>(
        builder: (context, state) => state.status.isLoading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : state.activeCars?.isNotEmpty ?? false
                ? CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverSafeArea(
                        minimum: AppUtils.kPaddingVertical16,
                        sliver: SliverList.separated(
                          itemBuilder: (_, index) {
                            if (index > state.activeCars!.length - 1) {
                              if (state.activeCarsPagination.isLoading) {
                                return const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              }
                              return AppUtils.kGap;
                            } else {
                              return MyCarsItem(
                                onTap: () async {
                                  await context
                                      .pushNamed(
                                    Routes.editCar,
                                    extra: EditCarPageArguments(
                                      adrBackFile: state.activeCars?[index].adrPictureBack ?? '',
                                      adrFrontFile: state.activeCars?[index].adrPictureFront ?? '',
                                      techPassportFront: state.activeCars?[index].techPassportFront ?? '',
                                      vehicleNumber: state.activeCars?[index].vehicleNumber ?? '',
                                      vehicleFile: state.activeCars?[index].vehicleFile ?? '',
                                      techPassportBack: state.activeCars?[index].techPassportBack ?? '',
                                      techPassportTrailerFront1:
                                          state.activeCars?[index].techPassportTrailerFront1 ?? '',
                                      techPassportTrailerFront2:
                                          state.activeCars?[index].techPassportTrailerFront2 ?? '',
                                      techPassportTrailerBack1: state.activeCars?[index].techPassportTrailerBack1 ?? '',
                                      techPassportTrailerBack2: state.activeCars?[index].techPassportTrailerBack2 ?? '',
                                      selectedCargoType: CargoTypeItem(
                                        name: state.activeCars?[index].cargoTypeData?.name,
                                        guid: state.activeCars?[index].cargoTypeData?.guid,
                                      ),
                                      selectedTrailerType: TrailerTypeItem(
                                        name: state.activeCars?[index].trailerTypeData?.name,
                                        guid: state.activeCars?[index].trailerTypeData?.guid,
                                      ),
                                      selectedLoadType: LoadTypeItem(
                                        name: state.activeCars?[index].loadTypeData?.name,
                                        guid: state.activeCars?[index].loadTypeData?.guid,
                                      ),
                                      carGuid: state.activeCars?[index].guid ?? '',
                                      capacity: (state.activeCars?[index].capacity ?? 0).toString(),
                                      volume: (state.activeCars?[index].height ?? 0).toString(),
                                      bodyDimensions: state.activeCars?[index].isBodyDimensions ?? false,
                                      hydraLift: state.activeCars?[index].isHydroLift ?? false,
                                      koniky: state.activeCars?[index].isKoniky ?? false,
                                      status: state.activeCars?[index].status ?? 'active',
                                    ),
                                  )
                                      .then(
                                    (value) {
                                      if (value != null && value == true) {
                                        if(!context.mounted) return;
                                        context.read<MyCarsBloc>().add(const InitialEvent());
                                      }
                                    },
                                  );
                                },
                                userCar: state.activeCars?[index],
                              );
                            }
                          },
                          separatorBuilder: (_, index) => AppUtils.kGap12,
                          itemCount: (state.activeCars?.length ?? 0) + 1,
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: AppUtils.kPaddingAll12,
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: AppUtils.kBorderRadius12,
                        color: context.colorScheme.onPrimary,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Image(
                            height: 210,
                            width: double.infinity,
                            image: AssetImage(
                              PngImage.car,
                            ),
                          ),
                          Padding(
                            padding: AppUtils.kPaddingAll12,
                            child: Text(
                              'your_cars_will_be_here_add_them_or_restore_from_archive'.tr(),
                              style: context.textStyle.regularSubheadline.copyWith(
                                color: context.color.greyText,
                              ),
                              maxLines: 4,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          AppUtils.kDivider,
                          Padding(
                            padding: AppUtils.kPaddingAll12,
                            child: ElevatedButton(
                              onPressed: () async {
                                await context.pushNamed(Routes.addCar).then((value) {
                                  if (value != null && value is bool && value) {
                                    if(!context.mounted) return;
                                    context.read<MyCarsBloc>().add(
                                          const GetActiveCarsEvent(),
                                        );
                                  }
                                });
                              },
                              child: Text('add_car'.tr()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
      );
}
