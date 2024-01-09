import 'package:flutter/material.dart';

class HostDetailsScreen extends StatefulWidget {
  const HostDetailsScreen({super.key});

  @override
  State<HostDetailsScreen> createState() => _HostDetailsScreenState();
}

class _HostDetailsScreenState extends State<HostDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
