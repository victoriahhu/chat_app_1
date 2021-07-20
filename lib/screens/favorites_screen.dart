import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'all_screens.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orangeAccent,
        leading: GestureDetector(child: Icon(CupertinoIcons.back, color: Colors.white,), onTap: (){_navigateToConsumptionScreen(context);},),
      ),
      body: Column(
        children: [Container(
          height: 70,
          width: double.infinity,
          color: Colors.orangeAccent,
          child: Text(
            "   Your favourites",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white),
          ),
        ),
          //Expanded(
          //child: SingleChildScrollView(child: GridTile(
          //...
        //),),),
            ]
      ),);
  }
}
void _navigateToConsumptionScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForYouPage()));
}
