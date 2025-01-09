part of '../my_cars_page.dart';

class InActiveCarsTabItem extends StatelessWidget {
  const InActiveCarsTabItem({super.key, required this.inActiveScrollController});

  final ScrollController inActiveScrollController;

  @override
  Widget build(BuildContext context) => BlocBuilder<MyCarsBloc, MyCarsState>(
        builder: (context, state) => state.status.isLoading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : state.inActiveCars?.isNotEmpty ?? false
                ? CustomScrollView(
                    controller: inActiveScrollController,
                    slivers: [
                      SliverSafeArea(
                        minimum: AppUtils.kPaddingVertical16,
                        sliver: SliverList.separated(
                          itemBuilder: (_, index) {
                            if (index > state.inActiveCars!.length - 1) {
                              if (state.inActiveCarsPagination.isLoading) {
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
                                      adrBackFile: state.inActiveCars?[index].adrPictureBack ?? '',
                                      adrFrontFile: state.inActiveCars?[index].adrPictureFront ?? '',
                                      techPassportFront: state.inActiveCars?[index].techPassportFront ?? '',
                                      vehicleNumber: state.inActiveCars?[index].vehicleNumber ?? '',
                                      vehicleFile: state.inActiveCars?[index].vehicleFile ?? '',
                                      techPassportBack: state.inActiveCars?[index].techPassportBack ?? '',
                                      techPassportTrailerFront1:
                                          state.inActiveCars?[index].techPassportTrailerFront1 ?? '',
                                      techPassportTrailerFront2:
                                          state.inActiveCars?[index].techPassportTrailerFront2 ?? '',
                                      techPassportTrailerBack1:
                                          state.inActiveCars?[index].techPassportTrailerBack1 ?? '',
                                      techPassportTrailerBack2:
                                          state.inActiveCars?[index].techPassportTrailerBack2 ?? '',
                                      selectedCargoType: CargoTypeItem(
                                        name: state.inActiveCars?[index].cargoTypeData?.name,
                                        guid: state.inActiveCars?[index].cargoTypeData?.guid,
                                      ),
                                      selectedTrailerType: TrailerTypeItem(
                                        name: state.inActiveCars?[index].trailerTypeData?.name,
                                        guid: state.inActiveCars?[index].trailerTypeData?.guid,
                                      ),
                                      selectedLoadType: LoadTypeItem(
                                        name: state.inActiveCars?[index].loadTypeData?.name,
                                        guid: state.inActiveCars?[index].loadTypeData?.guid,
                                      ),
                                      carGuid: state.inActiveCars?[index].guid ?? '',
                                      capacity: (state.inActiveCars?[index].capacity ?? 0).toString(),
                                      volume: (state.inActiveCars?[index].height ?? 0).toString(),
                                      bodyDimensions: state.inActiveCars?[index].isBodyDimensions ?? false,
                                      hydraLift: state.inActiveCars?[index].isHydroLift ?? false,
                                      koniky: state.inActiveCars?[index].isKoniky ?? false,
                                      status: state.inActiveCars?[index].status ?? 'active',
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
                                userCar: state.inActiveCars?[index],
                              );
                            }
                          },
                          separatorBuilder: (_, index) => AppUtils.kGap12,
                          itemCount: (state.inActiveCars?.length ?? 0) + 1,
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      'empty_orders'.tr(),
                      textAlign: TextAlign.center,
                      style: context.textStyle.regularCallout,
                    ),
                  ),
      );
}
