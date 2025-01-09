part of '../add_car_page.dart';

class CarInfoPage extends StatelessWidget {
  const CarInfoPage({
    super.key,
    required this.loadCapacityController,
    required this.loadWeightController,
    required this.vehicleNumberController,
    required this.vehicleCountryController,
    required this.deBounce,
  });

  final TextEditingController loadCapacityController;
  final TextEditingController loadWeightController;
  final TextEditingController vehicleNumberController;
  final TextEditingController vehicleCountryController;
  final DeBouncer deBounce;

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              CustomTextField(
                controller: loadCapacityController,
                labelText: 'load_capacity'.tr(),
                onChanged: (value) {
                  context.read<AddCarBloc>().add(
                        WriteLoadCapacityEvent(value),
                      );
                },
                hintText: 'write_weight_of_cargo'.tr(),
                textInputFormatter: FilteringTextInputFormatter.digitsOnly,
              ),
              AppUtils.kGap12,
              CustomTextField(
                controller: loadWeightController,
                labelText: 'volume_m³'.tr(),
                onChanged: (value) {
                  context.read<AddCarBloc>().add(
                        WriteLoadWeightEvent(value),
                      );
                },
                hintText: 'write_volume_cargo'.tr(),
                textInputFormatter: FilteringTextInputFormatter.digitsOnly,
              ),
              AppUtils.kGap12,
              Text(
                'Страна регистрация автомобиля',
                style: context.textStyle.size14Weight500Black.copyWith(
                  color: context.color.gray700,
                ),
              ),
              AppUtils.kGap6,
              const _DropDownCountryWidget2(),
              AppUtils.kGap12,
              BlocSelector<AddCarBloc, AddCarState, ApiStatus>(
                selector: (state) => state.vehicleStatus,
                builder: (context, state) {
                  return CustomTextField(
                    controller: vehicleNumberController,
                    labelText: 'number_vehicle'.tr(),
                    onChanged: (value) {
                      deBounce.run(() {
                        context.read<AddCarBloc>().add(
                              WriteVehicleNumberEvent(value),
                            );
                      });
                    },
                    hintText: 'write_car_number'.tr(),
                    textInputFormatter: CarNumberInputFormatter(),
                    errorText: 'already_used_number'.tr(),
                    showError: state.isError,
                  );
                },
              ),
              AppUtils.kGap12,
              BlocBuilder<AddCarBloc, AddCarState>(
                buildWhen: (previous, current) => previous.selectedTrailerType != current.selectedTrailerType,
                builder: (context, state) => DropDownWidget(
                  label: 'type_body'.tr(),
                  hintText: 'select_body_type'.tr(),
                  list: state.trailerTypes ?? [],
                  selectedItem: state.selectedTrailerType,
                  onChanged: (type) {
                    context.read<AddCarBloc>().add(
                          SelectTrailerTypeEvent(
                            type,
                          ),
                        );
                  },
                ),
              ),
              AppUtils.kGap12,
              BlocBuilder<AddCarBloc, AddCarState>(
                buildWhen: (previous, current) => previous.ecoStandartType != current.ecoStandartType,
                builder: (context, state) => DropDownWidget(
                  label: 'eco_standart'.tr(),
                  hintText: 'select_eco_standart'.tr(),
                  list: Constants.ecoStandartTypes,
                  selectedItem: state.ecoStandartType,
                  onChanged: (type) {
                    context.read<AddCarBloc>().add(
                          SelectEcoTypeEvent(type),
                        );
                  },
                ),
              ),
              AppUtils.kGap12,
              BlocBuilder<AddCarBloc, AddCarState>(
                buildWhen: (previous, current) => previous.selectedLoadType != current.selectedLoadType,
                builder: (context, state) => DropDownWidget(
                  label: 'load_type'.tr(),
                  hintText: 'select_load_type'.tr(),
                  list: state.loadTypes ?? [],
                  selectedItem: state.selectedLoadType,
                  onChanged: (type) {
                    context.read<AddCarBloc>().add(
                          SelectLoadTypeEvent(type),
                        );
                  },
                ),
              ),
              AppUtils.kGap12,
              BlocBuilder<AddCarBloc, AddCarState>(
                buildWhen: (previous, current) => previous.selectedFuelType != current.selectedFuelType,
                builder: (context, state) => DropDownWidget(
                  label: 'fuel_type'.tr(),
                  hintText: 'select_fuel_type'.tr(),
                  list: state.fuelTypes ?? [],
                  selectedItem: state.selectedFuelType,
                  onChanged: (type) {
                    context.read<AddCarBloc>().add(
                          SelectFuelEvent(
                            type,
                          ),
                        );
                  },
                ),
              ),
              AppUtils.kGap48,
            ]),
          )
        ],
      );
}
