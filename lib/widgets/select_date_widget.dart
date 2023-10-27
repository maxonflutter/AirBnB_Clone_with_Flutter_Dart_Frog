import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../models/booking_steps.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({
    super.key,
    required this.step,
    required this.height,
  });

  final BookingSteps step;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
          height: step == BookingSteps.selectDate ? height : 60,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          duration: const Duration(milliseconds: 300),
          child: step == BookingSteps.selectDate
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'When\'s your trip?',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 16.0),
                    const Row(
                      children: [Expanded(child: SingleChoice())],
                    ),
                    const SizedBox(height: 16.0),
                    const Calendar(),
                    const Spacer(),
                    const Divider(),
                    SizedBox(
                      height: 48,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text('Exact dates'),
                          ),
                          const SizedBox(width: 8.0),
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text('± 1 day'),
                          ),
                          const SizedBox(width: 8.0),
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text('± 2 days'),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            if (step == BookingSteps.selectDestination) {
                            } else {}
                          },
                          child: const Text('Skip'),
                        ),
                        FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            minimumSize: const Size(120, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text('Next'),
                        ),
                      ],
                    ),
                  ],
                )
                  .animate(delay: const Duration(milliseconds: 300))
                  .fadeIn(duration: const Duration(milliseconds: 300))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'When',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'I\'m flexible',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(
      () {
        if (args.value is PickerDateRange) {
          _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
              ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
        } else if (args.value is DateTime) {
          _selectedDate = args.value.toString();
        } else if (args.value is List<DateTime>) {
          _dateCount = args.value.length.toString();
        } else {
          _rangeCount = args.value.length.toString();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
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
}

enum CalendarOptions { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
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
                return Theme.of(context).colorScheme.secondary;
              }
              return Theme.of(context).colorScheme.surface;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Theme.of(context).colorScheme.onSecondary;
              }
              return Theme.of(context).colorScheme.onSurface;
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
            // By default there is only a single segment that can be
            // selected at one time, so its value is always the first
            // item in the selected set.
            calendarView = newSelection.first;
          });
        },
      ),
    );
  }
}
