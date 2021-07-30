import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';
import 'all_widgets.dart';
import 'package:gallery_saver/gallery_saver.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.enteredImage, this.file, this.userName,
      this.userImage, this.isMe,
      {this.key});

  final Key key;
  final String userName;
  final String userImage;
  final String enteredImage;
  final String file;
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
                    Icon(
                      CupertinoIcons.conversation_bubble,
                      color: Colors.blue,
                    ),
                    Text(
                      "   Answer",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                )),
            enteredImage==null?CupertinoContextMenuAction(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.star_border,
                      color: Colors.amberAccent,
                    ),
                    Text(
                      "   Important message",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                )): CupertinoContextMenuAction(
                onPressed: () {
                  GallerySaver.saveImage(enteredImage);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.download_outlined,
                      color: Colors.black,
                    ),
                    Text(
                      "   Download image",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                )),
            CupertinoContextMenuAction(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.trash,
                      color: Colors.red,
                    ),
                    Text(
                      "   Delete message for me",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ))
          ],
          child: file != null
              ? GestureDetector(onTap: ()=>{launch (file)},child: Container(
                  height: 80,
                  width: 250,
                  decoration:
                      BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [Container(height: 75, width: 50, child: Image.network("https://freepikpsd.com/media/2019/11/file-2-Transparent-Images.png"),), Container(width: 200,child: Text(file, overflow: TextOverflow.ellipsis,))],),
                ))
              : Container(
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
                  margin:
                      EdgeInsets.only(left: 10, right: 2, top: 4, bottom: 4),
                  child: FittedBox(
                    //fit:BoxFit.contain,
                    child: Column(
                        crossAxisAlignment: isMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          enteredImage == null
                              ? Text(
                                  userName,
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                )
                              : SizedBox(
                                  width: 0,
                                  height: 0,
                                ),
                          enteredImage != null
                              ? FittedBox(
                                  fit: BoxFit.fill,
                                  child: GestureDetector(
                                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => FullScreenImage(enteredImage))),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl: enteredImage,
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ))
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
