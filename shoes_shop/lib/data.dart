import 'package:flutter/material.dart';

class DataShoes{
  final String brandName;
  final String modelName;
  final double price;
  final Color backgroundColor;
  final String mainImageURL;
  final List<String> thumbnails;
  final String description;

  DataShoes({
    this.price,
    this.brandName, this.modelName,
    this.backgroundColor, this.mainImageURL,
    this.thumbnails, this.description
  });
}

final List<DataShoes> shoesList = [
  DataShoes(
    backgroundColor: Color(0xFFff66ff),
    brandName: 'Vans',
    mainImageURL: 'https://images.footlocker.com/is/image/FLEU/314520264004_01?wid=763&hei=538&fmt=png-alpha',
    modelName: 'Vans Old School',
    price: 99.55,
    thumbnails: [
      'https://images.footlocker.com/is/image/FLEU/314520264004_01?wid=763&hei=538&fmt=png-alpha',
      'https://images.footlocker.com/is/image/FLEU/314520264004_02?wid=763&hei=538&fmt=png-alpha',
      'https://images.footlocker.com/is/image/FLEU/314520264004_03?wid=763&hei=538&fmt=png-alpha',
      'https://images.footlocker.com/is/image/FLEU/314520264004_05?wid=763&hei=538&fmt=png-alpha'
    ],
    description: 'Anyone who thinks he is dealing here with a simple linen shoe'
        ' without tradition, should immediately get a picture of the famous history '
        'of this skate icon. Because the Vans Old Skool has been a classic sneaker for '
        'years and will probably stay there for a long time to come. Not only skaters, '
        'but all those who want to spice up their look with the sporty and simple design of '
        'the Vans Old Skool, should not miss the cult sneaker! Look at the many different '
        'colors and models of the Old Skool and find your new favorite shoe!',

  ),
  DataShoes(
      backgroundColor: Color(0xFF6600cc),
      brandName: 'Vans',
      mainImageURL: 'https://images.footlocker.com/is/image/FLEU/314520431504_01?wid=763&hei=538&fmt=png-alpha',
      modelName: 'Vans Rowley',
      price: 120.99
  ),

];

final List<DataShoes> subShoesList = [
  DataShoes(
      backgroundColor: Color(0xFF6b6b47),
      brandName: 'Vans',
      mainImageURL: 'https://images.footlocker.com/is/image/FLEU/314521424904_01?wid=763&hei=538&fmt=png-alpha',
      modelName: 'Vans Old School',
      price: 74.55
  ),
  DataShoes(
      backgroundColor: Color(0xFFffcc00),
      brandName: 'Vans',
      mainImageURL: 'https://images.footlocker.com/is/image/FLEU/314520474504_01?wid=763&hei=538&fmt=png-alpha',
      modelName: 'Vans Sport',
      price: 120.99
  ),
  DataShoes(
      backgroundColor: Color(0xFF7a527a),
      brandName: 'Vans',
      mainImageURL: 'https://images.footlocker.com/is/image/FLEU/314520178204_01?wid=763&hei=538&fmt=png-alpha',
      modelName: 'Vans Old SChool',
      price: 85.99
  ),
];