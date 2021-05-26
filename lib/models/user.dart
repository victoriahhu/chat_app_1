import 'package:flutter/foundation.dart';

class User{
  @required final String id;
  @required final String name;
  @required final String profession;
  final String description;
  @required final double age;
  @required final String imageUrl;
  bool isFavorite=false;
  User({this.id,this.name,this.profession,this.description,this.age,this.imageUrl,this.isFavorite});
}