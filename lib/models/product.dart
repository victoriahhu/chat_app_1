import 'package:flutter/foundation.dart';

class Product{
  @required final String id;
  @required final String title;
  final String description;
  @required final double price;
  @required final String imageUrl;
  final int numberItems;
  bool isFavorite=false;
  Product({this.id,this.title,this.description,this.price,this.imageUrl,this.numberItems,this.isFavorite});
}