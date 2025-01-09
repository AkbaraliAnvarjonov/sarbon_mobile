part of '../add_car_page.dart';

class CarPhotoPage extends StatelessWidget {
  CarPhotoPage({
    super.key,
    required this.rusNumberController,
    required this.kzNumberController,
    required this.turkNumberController,
  });

  final TextEditingController rusNumberController;

  final TextEditingController kzNumberController;

  final TextEditingController turkNumberController;

  final FocusNode focusRus = FocusNode();
  final FocusNode focusKz = FocusNode();
  final FocusNode focusTr = FocusNode();

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              const _AddCarPhotoWidget(),
              AppUtils.kGap12,
              const _TechnicalPassportPhotoWidget(),
              AppUtils.kGap12,
              CustomTextField(
                hintText: 'enter_phone_number'.tr(),
                labelText: 'ru_phone_number'.tr(),
                controller: rusNumberController,
                textInputFormatter: MaskedTextInputFormatter(
                  mask: '000 0000 000',
                  separator: ' ',
                  filter: RegExp('[0-9]'),
                ),
                fillColor: Colors.transparent,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: AppUtils.kBorderRadius12,
                  borderSide: BorderSide(
                    color: Color(0xff626FFF),
                  ),
                ),
                focusNode: focusRus,
                textInputType: TextInputType.number,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        PngImage.ruFlag,
                        width: 28,
                        height: 18,
                      ),
                      AppUtils.kGap8,
                      Text(
                        '+7',
                        style: context.textStyle.regularCallout,
                      ),
                    ],
                  ),
                ),
                prefixTextStyle: context.textStyle.regularSubheadline,
              ),
              AppUtils.kGap12,
              CustomTextField(
                hintText: 'enter_phone_number'.tr(),
                labelText: 'kz_phone_number'.tr(),
                controller: kzNumberController,
                textInputFormatter: MaskedTextInputFormatter(
                  mask: '000 000 0000',
                  separator: ' ',
                  filter: RegExp('[0-9]'),
                ),
                fillColor: Colors.transparent,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: AppUtils.kBorderRadius12,
                  borderSide: BorderSide(
                    color: Color(0xff626FFF),
                  ),
                ),
                focusNode: focusKz,
                textInputType: TextInputType.number,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        PngImage.kzFlag,
                        width: 28,
                        height: 18,
                      ),
                      AppUtils.kGap8,
                      Text(
                        '+7',
                        style: context.textStyle.regularCallout,
                      ),
                    ],
                  ),
                ),
                prefixTextStyle: context.textStyle.regularSubheadline,
              ),
              AppUtils.kGap12,
              CustomTextField(
                hintText: 'enter_phone_number'.tr(),
                labelText: 'tr_phone_number'.tr(),
                controller: turkNumberController,
                textInputFormatter: MaskedTextInputFormatter(
                  mask: '000 000 00 00',
                  separator: ' ',
                  filter: RegExp('[0-9]'),
                ),
                fillColor: Colors.transparent,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: AppUtils.kBorderRadius12,
                  borderSide: BorderSide(
                    color: Color(0xff626FFF),
                  ),
                ),
                focusNode: focusTr,
                textInputType: TextInputType.number,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        PngImage.trFlag,
                        width: 28,
                        height: 18,
                      ),
                      AppUtils.kGap8,
                      Text(
                        '+90',
                        style: context.textStyle.regularCallout,
                      ),
                    ],
                  ),
                ),
                prefixTextStyle: context.textStyle.regularSubheadline,
              ),
              AppUtils.kGap12,
            ]),
          ),
        ],
      );
}
