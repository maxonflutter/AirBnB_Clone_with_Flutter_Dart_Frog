import 'package:airbnb_clone/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

enum CalendarOptions { day, week, month, year }

class AppCalendar extends StatefulWidget {
  const AppCalendar({super.key});

  @override
  State<AppCalendar> createState() => AppCalendarState();
}

class AppCalendarState extends State<AppCalendar> {
  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      endRangeSelectionColor: appRed,
      startRangeSelectionColor: appRed,
      rangeSelectionColor: appRed.withAlpha(50),
      onSelectionChanged: _onSelectionChanged,
      selectionMode: DateRangePickerSelectionMode.range,
      initialSelectedRange: PickerDateRange(
        DateTime.now().subtract(const Duration(days: 4)),
        DateTime.now().add(
          const Duration(days: 3),
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {}
}

class CalendarOptionSegmentedButton extends StatefulWidget {
  const CalendarOptionSegmentedButton({super.key});

  @override
  State<CalendarOptionSegmentedButton> createState() =>
      _CalendarOptionSegmentedButtonState();
}

class _CalendarOptionSegmentedButtonState
    extends State<CalendarOptionSegmentedButton> {
  CalendarOptions calendarView = CalendarOptions.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButtonTheme(
      data: SegmentedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return appRed;
              }
              return appGrey.withAlpha(100);
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return appWhite;
              }
              return appBlack;
            },
          ),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    );
              }
              return Theme.of(context).textTheme.bodyMedium!;
            },
          ),
        ),
      ),
      child: SegmentedButton<CalendarOptions>(
        showSelectedIcon: false,
        segments: const <ButtonSegment<CalendarOptions>>[
          ButtonSegment<CalendarOptions>(
            value: CalendarOptions.day,
            label: Text('Dates'),
          ),
          ButtonSegment<CalendarOptions>(
            value: CalendarOptions.month,
            label: Text('Months'),
          ),
          ButtonSegment<CalendarOptions>(
            value: CalendarOptions.year,
            label: Text('Flexible'),
          ),
        ],
        selected: <CalendarOptions>{calendarView},
        onSelectionChanged: (Set<CalendarOptions> newSelection) {
          setState(() {
            calendarView = newSelection.first;
          });
        },
      ),
    );
  }
}
