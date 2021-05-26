import 'package:chatapp/widgets/conversations_tile.dart';
import 'package:flutter/material.dart';
import '../widgets/all_widgets.dart';
import '../screens/all_screens.dart';
import 'package:flutter/cupertino.dart';

class ConversationsScreen extends StatefulWidget {
  @override
  _ConversationsScreenState createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  int _sliding = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        elevation: 0.0,
        actions: [IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.person_2_fill, color: Colors.white,))],
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
          Padding(padding: EdgeInsets.all(15), child:
          CupertinoSlidingSegmentedControl(
              children: {
                0: Text('Professional'),
                1: Text('Close relations'),
                2: Text('Consumption'),
              },
              groupValue: _sliding,
              onValueChanged: (newValue) {
                setState(() {
                  _sliding = newValue;
                });
              }),),
        ConversationsTile()
        ],
      ),
    );
  }
}
