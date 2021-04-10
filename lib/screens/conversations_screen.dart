import 'package:chatapp/widgets/conversations_tile.dart';
import 'package:flutter/material.dart';
import '../widgets/all_widgets.dart';
import '../screens/all_screens.dart';
import 'package:flutter/cupertino.dart';

class ConversationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            height: 70,
            width: double.infinity,
            color: Colors.blueAccent[400],
            child: Text(
              "  Conversations",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          SizedBox(height: 20,),
        Padding( padding: EdgeInsets.symmetric(horizontal: 15),
          child: CupertinoTextField(
            prefix: Icon(Icons.search),
            placeholder: 'search',
          ),
        ),
          SizedBox(height: 20,),
        ConversationsTile()
        ],
      ),
    );
  }
}
