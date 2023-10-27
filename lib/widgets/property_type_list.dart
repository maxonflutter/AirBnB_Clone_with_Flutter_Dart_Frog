import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PropertyTypeList extends StatefulWidget {
  const PropertyTypeList({Key? key}) : super(key: key);

  @override
  State<PropertyTypeList> createState() => _PropertyTypeListState();
}

class _PropertyTypeListState extends State<PropertyTypeList> {
  int selectedIndex = 0;
  final List<Map<String, dynamic>> propertyTypes = [
    {'type': 'Hotel', 'icon': Icons.hotel},
    {'type': 'Apartment', 'icon': Icons.apartment},
    {'type': 'BnB', 'icon': Icons.bedroom_child},
    {'type': 'Villa', 'icon': Icons.villa},
    {'type': 'Resort', 'icon': Icons.holiday_village},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 56.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: propertyTypes.length,
        itemBuilder: (context, index) {
          return Container(
            width: size.width * 0.2,
            margin: const EdgeInsets.only(
              right: 4.0,
              left: 4.0,
              top: 4.0,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Column(
                children: [
                  Icon(propertyTypes[index]['icon']),
                  const SizedBox(height: 2.0),
                  Text(
                    propertyTypes[index]['type'],
                    style: textTheme.bodySmall!.copyWith(
                      fontWeight: index == selectedIndex
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  index == selectedIndex
                      ? Container(
                          margin: const EdgeInsets.only(top: 8.0),
                          height: 2.0,
                          width: 64.0,
                          color: Colors.black,
                        )
                          .animate()
                          .fadeIn(duration: const Duration(milliseconds: 300))
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
