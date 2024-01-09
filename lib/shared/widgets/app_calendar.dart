import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../theme/colors.dart';

enum CalendarOptions { year, month, week, day }

class AppCalendar extends StatefulWidget {
  const AppCalendar({super.key});

  @override
  State<AppCalendar> createState() => _AppCalendarState();
}

class _AppCalendarState extends State<AppCalendar> {
  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      onSelectionChanged: _onSelectedChanged,
      selectionMode: DateRangePickerSelectionMode.range,
      initialSelectedRange: PickerDateRange(
        DateTime.now().subtract(const Duration(days: 5)),
        DateTime.now().add(const Duration(days: 5)),
      ),
    );
  }

  void _onSelectedChanged(DateRangePickerSelectionChangedArgs args) {
    print(args.value);
  }
}

// class CalendarOptionsSegmentedButton extends StatefulWidget {
//   const CalendarOptionsSegmentedButton({super.key});

//   @override
//   State<CalendarOptionsSegmentedButton> createState() =>
//       _CalendarOptionsSegmentedButtonState();
// }

// class _CalendarOptionsSegmentedButtonState
//     extends State<CalendarOptionsSegmentedButton> {
//   CalendarOptions selected = CalendarOptions.month;

//   @override
//   Widget build(BuildContext context) {
//     return SegmentedButton<CalendarOptions>(
//       segments: const <ButtonSegment<CalendarOptions>>[
//         ButtonSegment<CalendarOptions>(
//           value: CalendarOptions.day,
//           label: Text('Dates'),
//         ),
//         ButtonSegment<CalendarOptions>(
//           value: CalendarOptions.month,
//           label: Text('Month'),
//         ),
//         ButtonSegment<CalendarOptions>(
//           value: CalendarOptions.year,
//           label: Text('Flexible'),
//         ),
//       ],
//       selected: <CalendarOptions>{selected},
//       onSelectionChanged: (newValue) {
//         setState(() {
//           selected = newValue.first;
//         });
//       },
//     );
//   }
// }

class CalendarOptionsSegmentedButton extends StatefulWidget {
  const CalendarOptionsSegmentedButton({super.key});

  @override
  State<CalendarOptionsSegmentedButton> createState() =>
      _CalendarOptionsSegmentedButtonState();
}

class _CalendarOptionsSegmentedButtonState
    extends State<CalendarOptionsSegmentedButton> {
  CalendarOptions calendarView = CalendarOptions.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButtonTheme(
      data: SegmentedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
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
