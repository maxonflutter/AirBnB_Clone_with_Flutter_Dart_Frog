import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

// Title: Property list with multiple images

class Property {
  final String title;
  final String description;
  final double rating;
  final List<String> imageUrls;

  Property({required this.title, required this.description, required this.rating, required this.imageUrls});
}

class PropertyListWidget extends StatelessWidget {
  final List<Property> properties;

  PropertyListWidget({Key? key, required this.properties}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: properties
                .map(
                  (property) => CustomCard(
                    property: property,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  final Property property;

  CustomCard({Key? key, required this.property}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  final controller = PageController();
  var currentPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: size.width,
              height: size.width - 32.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                children: widget.property.imageUrls.map((imageUrl) {
                  return Image.network(imageUrl, fit: BoxFit.cover);
                }).toList(),
              ),
            ),
            Positioned(
              bottom: 8.0,
              left: 0.0,
              right: 0.0,
              child: DotsIndicator(
                dotsCount: widget.property.imageUrls.length,
                position: currentPage.toDouble(),
                onTap: (index) {
                  controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                decorator: DotsDecorator(
                  color: colorScheme.onSecondary,
                  activeColor: colorScheme.secondary,
                  size: const Size.square(8.0),
                  activeSize: const Size(12.0, 8.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.property.title,
                      style: textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      widget.property.description,
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star),
                  const SizedBox(width: 4.0),
                  Text(
                    widget.property.rating.toStringAsFixed(1),
                    style: textTheme.subtitle1!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}