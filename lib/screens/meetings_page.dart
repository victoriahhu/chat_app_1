import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/all_widgets.dart';

class MeetingsPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Your scheduled meetings"),
        trailing: IconButton(
          icon: Icon(
            CupertinoIcons.plus,
            size: 40,
            color: Colors.blueAccent,
          ),
        ),
      ),
      body: Column(children: [SizedBox(height: 50,), Container(child: CupertinoSearchTextField(), height: 40, padding: EdgeInsets.symmetric(horizontal:30),), SizedBox(height: 100, ), Text("No meetings yet!", style: TextStyle(color: Colors.grey, fontSize: 25),)],),
    );
  }
}
