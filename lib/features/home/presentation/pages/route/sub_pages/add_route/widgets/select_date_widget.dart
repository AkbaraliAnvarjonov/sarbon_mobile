import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../bloc/route/add_route/add_route_bloc.dart';

class SelectDateRoutePageWidget extends StatefulWidget {
  const SelectDateRoutePageWidget({super.key});

  @override
  State<SelectDateRoutePageWidget> createState() =>
      _SelectDateRoutePageWidgetState();
}

class _SelectDateRoutePageWidgetState extends State<SelectDateRoutePageWidget> {
  late final DateRangePickerController dateController;

  @override
  void initState() {
    dateController = DateRangePickerController();
    super.initState();
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned(
            child: Ink(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: AppUtils.kRadius12,
                  topRight: AppUtils.kRadius12,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: AppUtils.kPaddingHor16Ver12,
                    child: Row(
                      children: [
                        AppUtils.kGap24,
                        Expanded(
                          child: Text(
                            'dates'.tr(),
                            style: context.textStyle.appBarTitle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: Icon(
                            Icons.close,
                            size: 24,
                            color: context.color.greyText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppUtils.kDivider,
                  AppUtils.kGap16,
                ],
              ),
            ),
          ),
          Positioned(
            top: 56,
            child: SfDateRangePicker(
              navigationDirection: DateRangePickerNavigationDirection.vertical,
              headerStyle: DateRangePickerHeaderStyle(
                textAlign: TextAlign.center,
                textStyle: context.textStyle.size15Weight600Black,
              ),
              enablePastDates: false,
              selectionShape: DateRangePickerSelectionShape.rectangle,
              controller: dateController,
              onSelectionChanged: (value) {
                context.read<AddRouteBloc>().add(
                      SelectDateEvent(
                        date: dateController.selectedDate ?? DateTime.now(),
                      ),
                    );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: context.kSize.width,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorScheme.onPrimary,
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(2, 0),
                      blurRadius: 14,
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Padding(
                    padding: AppUtils.kPaddingAll16,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text('confirm'.tr()),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
