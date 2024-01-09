import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:models/models.dart';

class SelectGuestsWidget extends StatelessWidget {
  const SelectGuestsWidget({
    super.key,
    required this.step,
  });

  final BookingStep step;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 0.0,
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
        height: step == BookingStep.selectGuests ? 274 : 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        duration: const Duration(milliseconds: 300),
        child: step == BookingStep.selectGuests
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Who\'s coming?',
                    style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    height: 190,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      children: [
                        _buildGuestsQuanitySelector(
                          context,
                          'Adults',
                          'Ages 13 or above',
                          () {},
                          () {},
                          '0',
                        ),
                        const Divider(),
                        _buildGuestsQuanitySelector(
                          context,
                          'Children',
                          'Ages 2-12',
                          () {},
                          () {},
                          '0',
                        ),
                        const Divider(),
                        _buildGuestsQuanitySelector(
                          context,
                          'Infants',
                          'Under 2',
                          () {},
                          () {},
                          '0',
                        ),
                      ],
                    ),
                  ),
                ],
              )
                .animate(delay: const Duration(milliseconds: 300))
                .fadeIn(duration: const Duration(milliseconds: 300))
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Who',
                    style: textTheme.bodyMedium,
                  ),
                  Text(
                    'Add guests',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
      ),
    );
  }

  Container _buildGuestsQuanitySelector(
    BuildContext context,
    String title,
    String subtitle,
    VoidCallback onDecrement,
    VoidCallback onIncrement,
    String value,
  ) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: textTheme.bodyLarge),
              Text(subtitle, style: textTheme.bodySmall),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: onDecrement,
                icon: const Icon(Icons.remove),
              ),
              Text(
                value,
                style:
                    textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: onIncrement,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
