import 'package:flutter/material.dart';

class PropertyDetailsScreen extends StatefulWidget {
  const PropertyDetailsScreen({super.key});

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
