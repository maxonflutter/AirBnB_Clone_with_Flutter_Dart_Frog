import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AccomodationType extends StatefulWidget {
  const AccomodationType({
    super.key,
  });

  @override
  State<AccomodationType> createState() => _AccomodationTypeState();
}

class _AccomodationTypeState extends State<AccomodationType> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 56.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: size.width * 0.2,
            margin: const EdgeInsets.only(
              right: 4.0,
              left: 4.0,
              top: 4.0,
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  this.index = index;
                });
              },
              child: Column(
                children: [
                  const Icon(Icons.location_on_outlined),
                  const SizedBox(height: 2.0),
                  Text(
                    'Anywhere',
                    style: textTheme.bodySmall!.copyWith(
                        fontWeight: index == this.index
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                  index == this.index
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
