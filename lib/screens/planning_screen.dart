import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/select_date_widget.dart';
import '../widgets/select_destination_widget.dart';
import '../widgets/select_guests_widget.dart';

enum PlanningStep { destination, date, guests }

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({super.key});

  @override
  State<PlanningScreen> createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  PlanningStep step = PlanningStep.destination;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.background.withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.close),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Stays',
                style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Experiences',
                style: textTheme.titleMedium,
              ),
            ),
          ],
        ),
        actions: const [SizedBox(width: 48)],
      ),
      bottomNavigationBar: (step == PlanningStep.date)
          ? null
          : BottomAppBar(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              notchMargin: 0,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      if (step == PlanningStep.destination) {
                        setState(() {
                          step = PlanningStep.guests;
                        });
                      } else {
                        setState(() {
                          step = PlanningStep.destination;
                        });
                      }
                    },
                    child: Text(
                      'Clear all',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                  FilledButton.icon(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      minimumSize: Size(100, 56.0),
                      backgroundColor: const Color(0xFFD5354C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    icon: const Icon(Icons.search),
                    label: const Text('Search'),
                  ),
                ],
              ),
            ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      step = PlanningStep.destination;
                    });
                  },
                  child: Hero(
                    tag: 'planning',
                    child: SelectDestinationWidget(step: step),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      step = PlanningStep.date;
                    });
                  },
                  child: SelectDateWidget(
                    step: step,
                    // 60 = destination selection collapsed height,
                    // 32 = top/bottom padding, 16 = margin below each card
                    height: constraints.maxHeight - 60 - 32 - 16,
                  ),
                ),
                (step == PlanningStep.date)
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            step = PlanningStep.guests;
                          });
                        },
                        child: SelectGuestsWidget(step: step),
                      ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
