import 'package:client/screens/planning_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              reverseTransitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return child;
                // .animate().slide(
                //       begin: const Offset(0.0, -1.0),
                //       end: Offset.zero,
                //       curve: Curves.easeOutCubic,
                //       duration: const Duration(milliseconds: 300),
                //     );
              },
              pageBuilder: (context, animation1, animation2) {
                return const PlanningScreen();
              },
            ),
          ),
          child: Hero(
            tag: 'dialog',
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 6.0,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .inversePrimary
                    .withOpacity(0.1),
                border: Border.all(
                  color: colorScheme.primary,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(32.0),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.surface.withOpacity(0.1),
                    blurRadius: 8.0,
                  )
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Where to?',
                        style: textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Anywhere • Any week • Add guest',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune_outlined),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
