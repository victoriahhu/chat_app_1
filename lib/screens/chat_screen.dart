import 'package:chatapp/widgets/messages.dart';
import 'package:chatapp/widgets/new_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import './home_screen.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    final fbm = FirebaseMessaging();
    fbm.requestNotificationPermissions();
    fbm.configure(onMessage: (msg) {
      print(msg);
      return;
    }, onLaunch: (msg) {
      print(msg);
      return;
    }, onResume: (msg) {
      print(msg);
      return;
    });
    fbm.subscribeToTopic("chat");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.phone_solid, color: Colors.white,)), IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.video_camera_solid, color: Colors.white,))],
        leading: IconButton(icon: Icon(CupertinoIcons.back, color: Colors.white,),onPressed: () {
          _navigateBack(context);
        },),
        backgroundColor: Colors.blueAccent[400],
        title:  Text("Conversation 1", style: TextStyle(color: Colors. white38),)  ,
        //actions: [DropdownButton(underline: Container(), icon: Icon(Icons.more_horiz, color: Colors.white,), items: [DropdownMenuItem(child: Container(child: Row(children: [Icon(CupertinoIcons.square_arrow_left), SizedBox(width: 8,), Text("Logout")],),), value: "logout",)], onChanged: (itemIdentifier) {if (itemIdentifier == "logout") {FirebaseAuth.instance.signOut();}},)]
      ),
      body: Container(
        child: Column(
          children: [Container(width: double.infinity, height: 0.4,color: Colors.grey[800],),Expanded(child: Messages()), NewMessage(), ],
        ),
      ),
    );
  }
}

void _navigateBack(BuildContext context) {
  Navigator.of(context).pop();
}
