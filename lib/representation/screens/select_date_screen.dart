import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app_flutter/core/constants/color_constants.dart';
import 'package:travel_app_flutter/core/constants/dismension_constants.dart';
import 'package:travel_app_flutter/representation/widgets/app_bar_container.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_flutter/representation/widgets/item_button_widget.dart';

class SelectDateScreen extends StatelessWidget {
  // const SelectDateScreen({super.key});
  static const String routeName = '/select_date_screen';

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Select Date',
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 2,
          ),
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            startRangeSelectionColor: ColorPalette.yellowColor,
            endRangeSelectionColor: ColorPalette.yellowColor,
            rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
            todayHighlightColor: ColorPalette.yellowColor,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs arg) {
              if (arg.value is PickerDateRange) {
                rangeStartDate = arg.value.startDate;
                rangeEndDate = arg.value.endDate;
              } else {
                rangeStartDate = null;
                rangeEndDate = null;
              }
            },
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          ItemButtonWidget(
            data: 'Select',
            onTap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          ItemButtonWidget(
            data: 'cancel',
            onTap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          )
        ],
      ),
    );
  }
}
