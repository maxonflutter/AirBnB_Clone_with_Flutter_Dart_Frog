import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

// Title: Property List Widget

class Property extends Equatable {
  final String id;
  final String description;
  final String propertyType;
  final String roomType;
  final double pricePerNight;
  final String country;
  final String city;
  final int maxGuests;
  final List<String> amenities;
  final String mainPhotoUrl;
  final List<String> photoUrls;

  const Property({
    required this.id,
    required this.description,
    required this.propertyType,
    required this.roomType,
    required this.pricePerNight,
    required this.country,
    required this.city,
    required this.maxGuests,
    required this.amenities,
    required this.mainPhotoUrl,
    required this.photoUrls,
  });

  @override
  List<Object> get props => [
    id,
    description,
    propertyType,
    roomType,
    pricePerNight,
    country,
    city,
    maxGuests,
    amenities,
    mainPhotoUrl,
    photoUrls,
  ];
}

class PropertyListWidget extends StatelessWidget {
  final List<Property> properties;

  const PropertyListWidget({Key? key, required this.properties}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: properties.length,
      itemBuilder: (context, index) {
        final property = properties[index];
        return PropertyCard(property: property);
      },
    );
  }
}

class PropertyCard extends StatelessWidget {
  final Property property;

  const PropertyCard({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(property.mainPhotoUrl),
          ListTile(
            title: Text(property.description),
            subtitle: Text('${property.country}, ${property.city}'),
          ),
          Text('Amenities: ${property.amenities.join(', ')}'),
          Text('Price per night: ${property.pricePerNight}'),
        ],
      ),
    );
  }
}