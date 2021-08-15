import 'package:flutter/foundation.dart';

class ForyouItem{
  @required final String id;
  @required final String cover;
  @required final String company;
  @required final String productName;
  @required final String image;
  @required final double price;
  ForyouItem({this.id,this.cover,this.company,this.productName,this.image,this.price,});
}