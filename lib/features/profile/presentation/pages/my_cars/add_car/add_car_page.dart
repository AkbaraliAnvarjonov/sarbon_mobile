import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart' as picker;

import '../../../../../../constants/constants.dart';
import '../../../../../../constants/icons_constants.dart';
import '../../../../../../constants/image_constants.dart';
import '../../../../../../core/debaouncer/debouncer.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/isolate/upload_multiple_files.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../../core/widgets/dropdown/dropdown_widget.dart';
import '../../../../../../core/widgets/inputs/car_text_formatter.dart';
import '../../../../../../core/widgets/inputs/custom_text_field.dart';

import '../../../../../../core/widgets/inputs/masked_text_input_formatter.dart';
import '../../../../../../services/api_status.dart';
import '../../../bloc/my_cars/add_car/add_car_bloc.dart';
import 'widgets/add_car_item_widget.dart';
import 'widgets/page_indicator.dart';

part '../../mixins/add_car_mixin.dart';

part 'widgets/add_car_photo_widget.dart';

part 'widgets/technical_passport_photo_widget.dart';

part 'widgets/adr_photo_widget.dart';

part 'widgets/car_country_widget.dart';

part 'widgets/trailer_photo_widget.dart';

part 'widgets/trailer_2_photo_widget.dart';

part 'pages/car_info_page.dart';

part 'pages/car_photo_page.dart';

part 'pages/trailer_photo_page.dart';

part 'pages/adr_info_page.dart';

class AddCarPage extends StatefulWidget {
  const AddCarPage({super.key});

  @override
  State<AddCarPage> createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> with AddCarMixin {
  @override
  Widget build(BuildContext context) => BlocListener<AddCarBloc, AddCarState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) async {
          if (state.status.isSuccess) {
            context.pop(true);
          }
        },
        child: PopScope(
          child: Scaffold(
            appBar: AppBar(
              title: Text('add_car'.tr()),
            ),
            body: BlocBuilder<AddCarBloc, AddCarState>(
              buildWhen: (previous, current) => previous.status != current.status,
              builder: (context, state) => state.status.isLoading
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : SingleChildScrollView(
                      child: Padding(
                        padding: AppUtils.kPaddingAll16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocSelector<AddCarBloc, AddCarState, int>(
                              selector: (state) => state.pageNumber,
                              builder: (context, pageNumber) => PageIndicator(
                                currentPage: pageNumber,
                                pageController: pageController,
                                onTap: () {
                                  setState(() {});
                                },
                              ),
                            ),
                            AppUtils.kGap24,
                            Text(
                              'total_information'.tr(),
                              style: context.textStyle.regularHeadline,
                            ),
                            AppUtils.kGap24,
                            SizedBox(
                              height: MediaQuery.of(context).size.height - 268,
                              child: PageView(
                                controller: pageController,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  CarInfoPage(
                                    loadCapacityController: loadCapacityController,
                                    loadWeightController: loadWeightController,
                                    vehicleNumberController: vehicleNumberController,
                                    vehicleCountryController: vehicleCountryController,
                                    deBounce: deBounce,
                                  ),
                                  CarPhotoPage(
                                    rusNumberController: rusNumberController,
                                    kzNumberController: kzNumberController,
                                    turkNumberController: turkNumberController,
                                  ),
                                  const TrailerPhotoPage(),
                                  const AdrInfoPage(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
            bottomNavigationBar: DecoratedBox(
              decoration: AppUtils.kDecorationWithShadow,
              child: SafeArea(
                minimum: AppUtils.kPaddingAll16,
                child: BlocBuilder<AddCarBloc, AddCarState>(
                  builder: (context, state) => ElevatedButton(
                    onPressed:
                        state.status.isLoading || state.pageStatus.isLoading || !isButtonEnabled() ? null : toNextPage,
                    child: state.pageStatus.isLoading ? const CircularProgressIndicator.adaptive() : Text('add'.tr()),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
