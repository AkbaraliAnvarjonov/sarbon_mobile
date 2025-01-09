part of 'update_route_item_widget.dart';

class _SelectDateRoutePageWidget extends StatefulWidget {
  const _SelectDateRoutePageWidget({
    required this.initialSelectedDate,
  });

  final DateTime initialSelectedDate;

  @override
  State<_SelectDateRoutePageWidget> createState() =>
      _SelectDateRoutePageWidgetState();
}

class _SelectDateRoutePageWidgetState
    extends State<_SelectDateRoutePageWidget> {
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
                            'Даты',
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
              initialSelectedDate: widget.initialSelectedDate,
              onSelectionChanged: (value) {
                context.read<UpdateRouteBloc>().add(
                      SelectDateEvent(
                        date: (dateController.selectedDate ?? DateTime.now())
                            .formatDate,
                        selectedDate: dateController.selectedDate,
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
                      child: const Text('Подтвердить'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
