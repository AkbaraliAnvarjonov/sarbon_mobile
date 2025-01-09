part of '../edit_car_page.dart';

class _DropDownCargoWidget extends StatelessWidget {
  const _DropDownCargoWidget();

  @override
  Widget build(BuildContext context) => BlocBuilder<EditCarBloc, EditCarState>(
        builder: (context, state) => DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius12,
            color: context.colorScheme.onPrimary,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<CargoTypeItem>(
              isExpanded: true,
              hint: Text(
                'Тип груза',
                style: context.textStyle.regularSubheadline.copyWith(
                  color: context.color.greyText,
                ),
              ),
              items: state.cargoTypes
                  .map(
                    (item) => DropdownMenuItem<CargoTypeItem>(
                      value: item,
                      child: Text(
                        // ignore: avoid_dynamic_calls
                        item.name ?? '',
                        style: context.textStyle.size14Weight400Black,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                  .toList(),
              value: state.cargoTypes
                  .where(
                    (element) => element.guid == state.selectedCargoType?.guid,
                  )
                  .firstOrNull,
              onChanged: (value) {
                context.read<EditCarBloc>().add(
                      SelectCargoTypeEvent(
                        value!,
                      ),
                    );
              },
              buttonStyleData: ButtonStyleData(
                height: 48,
                width: double.maxFinite,
                padding: AppUtils.kPaddingHorizontal12,
                decoration: BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius8,
                  color: context.colorScheme.onPrimary,
                ),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                scrollPadding: AppUtils.kPaddingAll8,
                maxHeight: 200,
                decoration: BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius12,
                  color: context.colorScheme.onPrimary,
                ),
                offset: const Offset(0, -8),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all(6),
                  thumbVisibility: MaterialStateProperty.all(true),
                ),
              ),
            ),
          ),
        ),
      );
}

class _DropDownTrailerWidget extends StatelessWidget {
  const _DropDownTrailerWidget();

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'type_body'.tr(),
        style: context.textStyle.size14Weight500Black.copyWith(
                    color: context.color.gray700,
                  ),
      ),
      AppUtils.kGap6,
      BlocBuilder<EditCarBloc, EditCarState>(
            builder: (context, state) => DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppUtils.kBorderRadius12,
                color: context.colorScheme.onPrimary,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<TrailerTypeItem>(
                  isExpanded: true,
                  hint: Text(
                    'select_body_type'.tr(),
                    style: context.textStyle.regularSubheadline.copyWith(
                      color: context.color.greyText,
                    ),
                  ),
                  items: state.trailerTypes
                      .map(
                        (item) => DropdownMenuItem<TrailerTypeItem>(
                          value: item,
                          child: Text(
                            // ignore: avoid_dynamic_calls
                            item.name ?? '',
                            style: context.textStyle.size14Weight400Black,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                      .toList(),
                  value: state.trailerTypes
                      .where(
                        (element) =>
                            element.guid == state.selectedTrailerType?.guid,
                      )
                      .firstOrNull,
                  onChanged: (value) {
                    context.read<EditCarBloc>().add(
                          SelectTrailerTypeEvent(
                            value!,
                          ),
                        );
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 48,
                    width: double.maxFinite,
                    padding: AppUtils.kPaddingHorizontal12,
                    decoration: BoxDecoration(
                      borderRadius: AppUtils.kBorderRadius8,
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    scrollPadding: AppUtils.kPaddingAll8,
                    maxHeight: 200,
                    decoration: BoxDecoration(
                      borderRadius: AppUtils.kBorderRadius12,
                      color: context.colorScheme.onPrimary,
                    ),
                    offset: const Offset(0, -8),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: MaterialStateProperty.all(6),
                      thumbVisibility: MaterialStateProperty.all(true),
                    ),
                  ),
                ),
              ),
            ),
          ),
    ],
  );
}

class _DropDownLoadWidget extends StatelessWidget {
  const _DropDownLoadWidget();

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'load_type'.tr(),
        style: context.textStyle.size14Weight500Black.copyWith(
                    color: context.color.gray700,
                  ),
      ),
      AppUtils.kGap6,
      BlocBuilder<EditCarBloc, EditCarState>(
            builder: (context, state) => DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppUtils.kBorderRadius12,
                color: context.colorScheme.onPrimary,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<LoadTypeItem>(
                  isExpanded: true,
                  hint: Text(
                    'select_load_type'.tr(),
                    style: context.textStyle.regularSubheadline.copyWith(
                      color: context.color.greyText,
                    ),
                  ),
                  items: state.loadTypes
                      .map(
                        (item) => DropdownMenuItem<LoadTypeItem>(
                          value: item,
                          child: Text(
                            // ignore: avoid_dynamic_calls
                            item.name ?? '',
                            style: context.textStyle.size14Weight400Black,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                      .toList(),
                  value: state.loadTypes
                      .where(
                        (element) => element.guid == state.selectedLoadType?.guid,
                      )
                      .firstOrNull,
                  onChanged: (value) {
                    context.read<EditCarBloc>().add(
                          SelectLoadTypeEvent(
                            value!,
                          ),
                        );
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 48,
                    width: double.maxFinite,
                    padding: AppUtils.kPaddingHorizontal12,
                    decoration: BoxDecoration(
                      borderRadius: AppUtils.kBorderRadius8,
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    scrollPadding: AppUtils.kPaddingAll8,
                    maxHeight: 200,
                    decoration: BoxDecoration(
                      borderRadius: AppUtils.kBorderRadius12,
                      color: context.colorScheme.onPrimary,
                    ),
                    offset: const Offset(0, -8),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: MaterialStateProperty.all(6),
                      thumbVisibility: MaterialStateProperty.all(true),
                    ),
                  ),
                ),
              ),
            ),
          ),
    ],
  );
}
