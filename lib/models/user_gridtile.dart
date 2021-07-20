import 'package:chatapp/screens/all_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:geocoding_platform_interface/geocoding_platform_interface.dart';


class UserGridTile extends StatelessWidget {

  final String id;
  final String name;
  final String profession;
  final String city;
  final int numberRelations;
  final String pastProf;
  final String college;
  final String description;
  final String website;
  final int age;
  final String imageUrl;
  final bool isFavorite;

  UserGridTile(this.id, this.name, this.profession, this.city, this.numberRelations, this.pastProf, this.college, this.description, this.website, this.age, this.imageUrl, this.isFavorite);



  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: ()=>Navigator.pushReplacement(context, PageTransition(
          child: UserProfile(id, name, profession, city, numberRelations, pastProf, college, description, website, age, imageUrl, isFavorite), type: PageTransitionType.rightToLeftWithFade)),
      child: Container(
        decoration: BoxDecoration( boxShadow: [
          BoxShadow(
            color: Colors.grey[400].withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
            borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(child: Image.network(imageUrl, fit: BoxFit.cover,),
            header: GridTileBar(title: Text(profession, textAlign: TextAlign.center, style: GoogleFonts.lato(
                fontSize: 14, fontWeight: FontWeight.w700, color: Colors.blue[900]),),
              backgroundColor: Colors.white,),
            footer: GridTileBar( trailing:IconButton(icon: Icon(CupertinoIcons.star, color: Colors.amberAccent,), onPressed: (){},), title: Text(name, textAlign: TextAlign.center, style: GoogleFonts.lato(
                fontSize: 14, fontWeight: FontWeight.w700, color: Colors.grey[600]),),
              backgroundColor: Colors.white,),
            //header: GridTileBar(title:Text(supermarket),),
          ),
        ),
      ),
    );
  }
}