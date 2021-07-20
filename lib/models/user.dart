import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';

class User{
  @required final String id;
  @required final String name;
   final String profession;
  @required final String city;
  @required final int numberRelations;
  final String pastProf;
  final String college;
  final String description;
  final String website;
  final int age;
  @required final String imageUrl;
  bool isFavorite=false;
  User({this.id,this.name,this.profession,this.city, this.numberRelations, this.pastProf, this.college, this.description,this.website, this.age,this.imageUrl,this.isFavorite});
}