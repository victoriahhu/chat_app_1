import '../widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (ctx, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(color: Theme.of(context).backgroundColor,child: CupertinoActivityIndicator(animating: true,)),
          );
        }
        return StreamBuilder(
            stream: Firestore.instance
                .collection("chat")
                .orderBy("createdAt", descending: true)
                .snapshots(),
            builder: (ctx, chatSnapshot) {
              if (chatSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Container(color:Theme.of(context).backgroundColor,child: CupertinoActivityIndicator(animating: true,)));
              }
              final chatDocs = chatSnapshot.data.documents;
              return ListView.builder(
                  reverse: true,
                  itemCount: chatDocs.length,
                  itemBuilder: (ctx, index) => MessageBubble(
                        chatDocs[index]["text"],
                    chatDocs[index]["image"],
                    chatDocs[index]["file"],
                    chatDocs[index]["username"],
                    chatDocs[index]["userImage"],
                    chatDocs[index]["userId"] == futureSnapshot.data.uid,
                        key: ValueKey(chatDocs[index].documentID),
                      ));
            });
      },
    );
  }
}
