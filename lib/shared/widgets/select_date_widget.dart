import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:models/models.dart';

import '../theme/colors.dart';
import 'app_calendar.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({super.key, required this.step});

  final BookingStep step;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    // 112 = app bar height + safe area top padding,
    // 60 = destination selection collapsed height,
    // 32 = top/bottom padding
    // 16 = margin below each card
    var expandedHeight = size.height - 112 - 60 - 32 - 20;
    return Card(
      elevation: 0.0,
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
          height: step == BookingStep.selectDate ? expandedHeight : 60,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          duration: const Duration(milliseconds: 300),
          child: step == BookingStep.selectDate
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
                      children: [
                        Expanded(child: CalendarOptionsSegmentedButton()),
                      ],
                    ),
                    const AppCalendar(),
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
                          onPressed: () {},
                          child: const Text('Skip'),
                        ),
                        FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            backgroundColor: appRed,
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
