import 'package:flutter/material.dart';

import '../shared/theme/colors.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: appWhite.withOpacity(0.5),
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
