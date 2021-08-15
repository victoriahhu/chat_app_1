import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/all_widgets.dart';

class ForYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(leading: new Container(), elevation: 0.0, backgroundColor: Colors.blueAccent[400],),
        body:
         SingleChildScrollView(
           child: Column(
              children: [
                Container(
                  height: 70,
                  width: double.infinity,
                  color: Colors.blueAccent[400],
                  child: Text(
                    "  For you",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ),
                SizedBox(height: 10.00,),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(child: CupertinoSearchTextField(), height: 40, padding: EdgeInsets.symmetric(horizontal:15),)
                  ),
                CategoriesRow(),
                SizedBox(height: 10.00,),
                ForYouGrid(),
              ]),
         )
    );
  }
}
