import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
      this.message, this.enteredImage, this.userName, this.userImage, this.isMe,
      {this.key});

  final Key key;
  final String userName;
  final String userImage;
  final String enteredImage;
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        !isMe
            ? CircleAvatar(
                backgroundImage: NetworkImage(userImage),
              )
            : Container(),
        SizedBox(
          width: 10,
        ),
        CupertinoContextMenu(
          actions: [
            CupertinoContextMenuAction(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Row(
              children: [
                Icon(CupertinoIcons.conversation_bubble, color: Colors.blue,),
                Text("   Answer", style: TextStyle(fontSize: 15),)
              ],
            )),
            CupertinoContextMenuAction(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Row(
              children: [
                Icon(Icons.star_border, color: Colors.amberAccent,),
                Text("   Important message",style: TextStyle(fontSize: 15),)
              ],
            )),
            CupertinoContextMenuAction(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Row(
                  children: [
                    Icon(CupertinoIcons.trash, color: Colors.red,),
                    Text("   Delete message for me", style: TextStyle(fontSize: 15),)
                  ],
                ))
          ],
          child: Container(
            decoration: BoxDecoration(
                color: isMe ? Colors.blueAccent[200] : Colors.grey[500],
                borderRadius: BorderRadius.only(
                    bottomLeft:
                        !isMe ? Radius.circular(0) : Radius.circular(12),
                    bottomRight:
                        isMe ? Radius.circular(0) : Radius.circular(12),
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            width: 140,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            margin: EdgeInsets.only(left: 10, right: 2, top: 4, bottom: 4),
            child: FittedBox(
              //fit:BoxFit.contain,
              child: Column(
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    message.trim().isEmpty
                        ? Container(
                            child: Image.network(
                              enteredImage,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Text(
                            message,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline1
                                    .color),
                            //textAlign: isMe? TextAlign.end : TextAlign.start,
                          ),
                  ]),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        isMe
            ? CircleAvatar(
                backgroundImage: NetworkImage(userImage),
              )
            : Container(),
      ],
    );
  }
}
