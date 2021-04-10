import 'package:flutter/material.dart';
import '../screens/all_screens.dart';

class ConversationsTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Conversation 1", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
      leading: CircleAvatar(
        backgroundImage: NetworkImage("https://www.searchpng.com/wp-content/uploads/2019/02/Profile-ICon.png"),
      ),
      //subtitle: Text(message),
      dense: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17.0),
      ),
      onTap: () {
        _navigateToNextScreen(context);
      },
    );
  }
}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreen()));
}
