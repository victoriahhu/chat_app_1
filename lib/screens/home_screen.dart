import '../screens/all_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class MyFirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConversationsScreen();
  }
}

class MySecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConsumptionScreen();
  }
}
class MyThirdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileScreen();
  }
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
       //backgroundColor: Colors.black,
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.black,
        activeColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.conversation_bubble),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        if (index == 0) {
          return CupertinoTabView(
            //navigatorKey: firstTabNavKey,
            builder: (BuildContext context) => MyFirstTab(),
          );
        } else if(index == 1){
          return CupertinoTabView(
            //navigatorKey: secondTabNavKey,
            builder: (BuildContext context) => MySecondTab(),
          );
        } else{return CupertinoTabView(builder: (BuildContext context) => MyThirdTab(),);}
      },
    );
  }
}