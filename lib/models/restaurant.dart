import 'package:flutter/foundation.dart';
import 'all_models.dart';

class Restaurant{
  @required final String id;
  @required final String name;
  @required final String address;
  @required final String type;
   final String logoUrl;
  @required final String imageUrl;
  @required final String restauPicUrl;
  @required final List<Product> menu;
  bool isFavorite=false;
  Restaurant({this.id,this.name,this.address,this.type,this.logoUrl, this.imageUrl, this.restauPicUrl,this.menu});
}