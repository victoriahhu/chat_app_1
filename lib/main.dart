import 'package:chatapp/screens/chat_screen.dart';
import './screens/auth_screen.dart';
import 'package:flutter/material.dart';
import'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './screens/splash_screen.dart';
import './screens/home_screen.dart';
import './screens/all_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        backgroundColor: Colors.black,
        accentColor: Colors.blueAccent[400],
        accentColorBrightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnapshot) {
          if(userSnapshot.connectionState==ConnectionState.waiting){return SplashScreen();}
          if (userSnapshot.hasData) {
            return HomeScreen();
          }
          return AuthScreen();
        },
      ),
    );
  }
}
