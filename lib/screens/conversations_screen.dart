import 'package:chatapp/widgets/conversations_tile.dart';
import 'package:flutter/material.dart';
import '../widgets/all_widgets.dart';
import '../screens/all_screens.dart';
import 'package:flutter/cupertino.dart';

class ConversationsScreen extends StatefulWidget with NavigationStates {
  @override
  _ConversationsScreenState createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  int _sliding = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        elevation: 0.0,
        actions: [IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.person_2_fill, color: Colors.white,))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
              width: double.infinity,
              color: Colors.blueAccent[400],
              child: Text(
                "       Conversations",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 20,),
           Container(child: CupertinoSearchTextField(), height: 40, padding: EdgeInsets.symmetric(horizontal:20),),

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
      ),
    );
  }
}
