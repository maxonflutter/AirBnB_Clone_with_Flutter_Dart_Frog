import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:models/models.dart';

import '../shared/theme/colors.dart';
import '../shared/widgets/select_date_widget.dart';
import '../shared/widgets/select_destination_widget.dart';
import '../shared/widgets/select_guests_widget.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  var step = BookingStep.selectDate;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
      child: Scaffold(
        backgroundColor: appWhite.withOpacity(0.5),
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
          actions: const [SizedBox(width: 48.0)],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      step = BookingStep.selectDestination;
                    });
                  },
                  child: Hero(
                    tag: 'search',
                    child: SelectDestinationWidget(step: step),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      step = BookingStep.selectDate;
                    });
                  },
                  child: SelectDateWidget(step: step),
                ),
                (step == BookingStep.selectDate)
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            step = BookingStep.selectGuests;
                          });
                        },
                        child: SelectGuestsWidget(step: step),
                      ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: (step == BookingStep.selectDate)
            ? null
            : BottomAppBar(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                notchMargin: 0,
                color: Colors.white,
                surfaceTintColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // if (step == BookingStep.selectDestination) {
                        //   setState(() {
                        //     step = BookingStep.selectGuests;
                        //   });
                        // } else {
                        //   setState(() {
                        //     step = BookingStep.selectDestination;
                        //   });
                        // }
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
                        backgroundColor: appRed,
                        minimumSize: const Size(100, 56.0),
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
      ),
    );
  }
}
