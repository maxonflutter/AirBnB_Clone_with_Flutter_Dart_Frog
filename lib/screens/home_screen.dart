import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/property.dart';
import '../shared/theme/colors.dart';
import '../widgets/app_nav_bar.dart';
import '../widgets/property_type_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      bottomNavigationBar: const AppNavBar(),
      appBar: AppBar(
        toolbarHeight: 128,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: appBlack.withOpacity(0.1),
                blurRadius: 1.0,
                spreadRadius: 1.0,
                offset: const Offset(0.0, 1.0),
              )
            ],
          ),
          child: Stack(
            children: [
              const Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: PropertyTypeList(),
              ),
              Positioned(
                right: 16.0,
                top: 70.0,
                child: IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    shape: const CircleBorder(
                      side: BorderSide(color: appGrey, width: 1.0),
                    ),
                  ),
                  icon: const Icon(Icons.tune),
                ),
              ),
              Positioned(
                left: 16.0,
                right: 72.0,
                top: 64.0,
                child: GestureDetector(
                  onTap: () => context.pushNamed('booking-details'),
                  child: Hero(
                    tag: 'planning',
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: appWhite,
                        border: Border.all(color: appGrey, width: 1.0),
                        borderRadius: BorderRadius.circular(32.0),
                        boxShadow: [
                          BoxShadow(
                            color: appGrey.withOpacity(0.5),
                            blurRadius: 8.0,
                            spreadRadius: 8.0,
                            offset: const Offset(0, 4.0),
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
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: Property.sampleData
            .map(
              (property) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: size.width,
                    height: size.width - 32.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: PageView(
                      children: [
                        Image.network(
                          property.mainPhotoUrl,
                          fit: BoxFit.cover,
                        ),
                        property.photoUrls.isNotEmpty
                            ? Image.network(
                                property.photoUrls[0],
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                property.mainPhotoUrl,
                                fit: BoxFit.cover,
                              ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${property.city} • ${property.country}',
                            style: textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            property.amenities.take(3).join(' • '),
                            style: textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            '\$${property.pricePerNight} / night',
                            style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(Icons.star),
                          SizedBox(width: 4.0),
                          Text('4.8'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
