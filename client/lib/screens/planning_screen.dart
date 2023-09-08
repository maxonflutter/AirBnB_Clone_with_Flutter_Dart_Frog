import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

enum PlanningStep {
  destination,
  date,
  guests,
}

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({super.key});

  @override
  State<PlanningScreen> createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  PlanningStep step = PlanningStep.destination;

  Widget _renderWhereWidget() {
    return step == PlanningStep.destination
        ? _widget2(context)
        : const _PlanningCard(
            key: Key('widget_1'),
            title: 'Where',
            subtitle: 'I\'m flexible',
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              child: const Text('Stays'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Experiences'),
            ),
          ],
        ),
        actions: const [SizedBox(width: 48)],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        notchMargin: 0,
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
              child: Text('Clear all'),
            ),
            FilledButton.icon(
              onPressed: () {},
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              icon: const Icon(Icons.search),
              label: Text('Search'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
                child: AnimatedSwitcher(
                  transitionBuilder: (child, animation) {
                    return child.animate().scaleY(
                          begin: 0.0,
                          end: 1.0,
                          curve: Curves.linear,
                          alignment: step == PlanningStep.destination
                              ? Alignment.topCenter
                              : Alignment.bottomCenter,
                          duration: const Duration(milliseconds: 300),
                        );
                  },
                  duration: const Duration(milliseconds: 300),
                  child: step == PlanningStep.destination
                      ? _widget2(context)
                      : const _PlanningCard(
                          key: Key('widget_1'),
                          title: 'Where',
                          subtitle: 'I\'m flexible',
                        ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    step = PlanningStep.date;
                  });
                },
                child: AnimatedSwitcher(
                  transitionBuilder: (child, animation) {
                    return child.animate().scaleY(
                          begin: 0.0,
                          end: 1.0,
                          curve: Curves.fastLinearToSlowEaseIn,
                          alignment: step == PlanningStep.date
                              ? Alignment.topCenter
                              : Alignment.bottomCenter,
                          duration: const Duration(milliseconds: 300),
                        );
                  },
                  duration: const Duration(milliseconds: 300),
                  child: step == PlanningStep.date
                      ? _widget4(context)
                      : const _PlanningCard(
                          key: Key('widget_3'),
                          title: 'When',
                          subtitle: 'Any week',
                        ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    step = PlanningStep.guests;
                  });
                },
                child: AnimatedSwitcher(
                  transitionBuilder: (child, animation) {
                    return child.animate().scaleY(
                          begin: 0.0,
                          end: 1.0,
                          curve: Curves.fastLinearToSlowEaseIn,
                          alignment: step == PlanningStep.guests
                              ? Alignment.topCenter
                              : Alignment.bottomCenter,
                          duration: const Duration(milliseconds: 300),
                        );
                  },
                  duration: const Duration(milliseconds: 300),
                  child: step == PlanningStep.guests
                      ? _widget6(context)
                      : const _PlanningCard(
                          key: Key('widget_5'),
                          title: 'Who',
                          subtitle: 'Add guests',
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card _widget6(BuildContext context) {
    return Card(
      key: Key('widget6'),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            height: 500,
            child: Text(
              'Who\'s coming?',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Card _widget4(BuildContext context) {
    return Card(
      key: Key('widget4'),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            height: 500,
            child: Text(
              'When\'s your trip?',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Card _widget2(BuildContext context) {
    return Card(
      key: const Key('widget2'),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            height: 500,
            child: Text(
              'Where to?',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlanningCard extends StatelessWidget {
  const _PlanningCard({
    super.key,
    this.title = 'Where',
    this.subtitle = 'I\'m flexible',
  });

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: key,
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class DestinationSelection extends StatelessWidget {
  const DestinationSelection({
    super.key,
    required this.selected,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Hero(
      tag: 'dialog',
      child: Material(
        child: Container(
          height: 400,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color:
                Theme.of(context).colorScheme.inversePrimary.withOpacity(0.1),
            border: Border.all(
              color: colorScheme.primary.withOpacity(0.1),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: colorScheme.surface.withOpacity(0.1),
                blurRadius: 8.0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Where to?',
                style: textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search destinations',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: colorScheme.primary,
                      width: 1.0,
                    ),
                  ),
                  suffixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 16.0),
              // SizedBox(
              //   height: 180,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       _buildImage(context),
              //       _buildImage(context),
              //       _buildImage(context),
              //       _buildImage(context),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateSelection extends StatelessWidget {
  const DateSelection({
    super.key,
    required this.selected,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: selected ? 500 : 200,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.1),
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.1),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: colorScheme.surface.withOpacity(0.1),
            blurRadius: 8.0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'When?',
            style: textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          selected
              ? CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  onDateChanged: (date) async {},
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class GuestSelection extends StatelessWidget {
  const GuestSelection({
    super.key,
    required this.selected,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: selected ? 500 : 200,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.1),
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.1),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: colorScheme.surface.withOpacity(0.1),
            blurRadius: 8.0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Who\'s Coming?',
            style: textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          selected
              ? ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      title: Text('Adult'),
                      subtitle: Text('Ages 13 or above'),
                      trailing: Icon(Icons.remove),
                    ),
                    const SizedBox(height: 16.0),
                    ListTile(
                      title: Text('Adult'),
                      subtitle: Text('Ages 13 or above'),
                      trailing: SizedBox(
                        width: 100,
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

// Padding _buildImage(BuildContext context) {
//   final imageUrl =
//       'https://images.unsplash.com/photo-1693795196345-8292e8d5cadb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3570&q=80';
//   final size = MediaQuery.sizeOf(context);

//   return Padding(
//     padding: const EdgeInsets.only(right: 8.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(8.0),
//           child: Image.network(
//             imageUrl,
//             height: size.width * 0.3,
//             width: size.width * 0.3,
//             fit: BoxFit.cover,
//           ),
//         ),
//         const SizedBox(height: 16.0),
//         Text(
//           'Nearby',
//           style: Theme.of(context)
//               .textTheme
//               .bodyMedium!
//               .copyWith(fontWeight: FontWeight.bold),
//         ),
//       ],
//     ),
//   );
// }
