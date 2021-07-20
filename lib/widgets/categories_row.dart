import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../screens/all_screens.dart';

class CategoriesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: ()=> Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: ProfessionalsScreen(), type: PageTransitionType.rightToLeftWithFade)),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).primaryColor,
                          blurRadius: 15.0)
                    ],
                    borderRadius:
                    BorderRadius.all(Radius.circular(50)), color: Colors.grey.shade100),
                height: 40.0,
                width: 100.0,
                child: Center(child:Text("Professionals", style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
            ),
            SizedBox(width: 7,),
            GestureDetector(
              onTap: ()=> Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: TravelScreen(), type: PageTransitionType.rightToLeftWithFade)),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).primaryColor,
                          blurRadius: 15.0)
                    ],
                    borderRadius:
                    BorderRadius.all(Radius.circular(50)), color: Colors.grey.shade100),
                height: 40.0,
                width: 100.0,
                child: Center(child:Text("Travel", style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
            ),
            SizedBox(width: 7,),
            GestureDetector(
              onTap: ()=> Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: FoodScreen(), type: PageTransitionType.rightToLeftWithFade)),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).primaryColor,
                          blurRadius: 15.0)
                    ],
                    borderRadius:
                    BorderRadius.all(Radius.circular(50)), color: Colors.grey.shade100),
                height: 40.0,
                width: 100.0,
                child: Center(child:Text("Food", style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
            ),
            SizedBox(width: 7,),
            GestureDetector(
              onTap: ()=> Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: EventsScreen(), type: PageTransitionType.rightToLeftWithFade)),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).primaryColor,
                          blurRadius: 15.0)
                    ],
                    borderRadius:
                    BorderRadius.all(Radius.circular(50)), color: Colors.grey.shade100),
                height: 40.0,
                width: 100.0,
                child: Center(child:Text("Around you", style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
            ),
            SizedBox(width: 7,),
            GestureDetector(
              onTap: ()=> Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: FavoritesScreen(), type: PageTransitionType.rightToLeftWithFade)),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).primaryColor,
                          blurRadius: 15.0)
                    ],
                    borderRadius:
                    BorderRadius.all(Radius.circular(50)), color: Colors.grey.shade100),
                height: 40.0,
                width: 100.0,
                child: Center(child:Text("Favorites", style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
