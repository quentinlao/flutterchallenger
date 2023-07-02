import 'package:flutter/material.dart';


final Color baseColor = Color(0xFFf0f0f5);
final Color blue = Color(0xFF0066cc);
final Color grey = Colors.grey[400];


class Rent{
  final String image,
  location,
  cityLocation,
  shortDescription;

  final Map<String, String> details;

  final double price;

  Rent({
    this.image,
    this.price,
    this.location,
    this.shortDescription,
    this.cityLocation,
    this.details
  });
}

final List<IconData> icons = [Icons.dashboard, Icons.hotel];

final List<Rent> rents = [
  Rent(
    price: 297,
    image: 'https://architecturebeast.com/wp-content/uploads/2014/08/Top_50_Modern_House_Designs_Ever_Built_featured_on_architecture_beast_24.jpg',
    location: '2 Boulevard Lafayette',
    shortDescription: '5-bedroom home',
    cityLocation: 'Paris, 16th Town',
    details: {'Area': '200 sq.ft', 'House Type': '4BTHK'},
  ),
  Rent(
      price: 555,
      image: 'https://dernieretage-paris.com/wp-content/uploads/2017/01/Dernier-etage-paris-sam.jpg',
      location: 'Brookfield Malahide',
      shortDescription: '5-bedroom home',
      cityLocation: 'North Co. Dublin',
      details: {'Area': '256 sq.ft', 'House Type': '5BTHK'},
  ),
  Rent(
      price: 456,
      image: 'https://q-cf.bstatic.com/images/hotel/max1024x768/214/21407149.jpg',
      location: 'Stanford, railway station',
      shortDescription: '5-bedroom home',
      cityLocation: 'San Francisco',
      details: {'Area': '350 sq.ft', 'House Type': '6BTHK'},
  ),
];