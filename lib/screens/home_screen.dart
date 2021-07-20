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
    return ForYouPage();
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
        backgroundColor: Colors.white,
        activeColor: Colors.blueAccent[400],
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.conversation_bubble),
            //activeIcon: Icon(Icons.chat_bubble),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_filled)
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            //activeIcon: Icon(Icons.person)
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