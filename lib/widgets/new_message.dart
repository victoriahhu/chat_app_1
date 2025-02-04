import 'package:chatapp/screens/all_screens.dart';
import 'package:chatapp/widgets/message_image_picker.dart';
import 'package:flushbar/flushbar_route.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flushbar/flushbar.dart';
import 'package:firebase_storage/firebase_storage.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
   String ppickedImage;
  final _controller= new TextEditingController();
  void _pickedImage(File image){
    ppickedImage=image.toString();
  }
  var _enteredMessage="";
  void _sendMessage () async {
    FocusScope.of(context).unfocus();
    final user= await FirebaseAuth.instance.currentUser();
    final userData= await Firestore.instance.collection("users").document(user.uid).get();
    Firestore.instance.collection("chat").add({
      "text": _enteredMessage,
      //"image": ppickedImage,
      "createdAt": Timestamp.now(),
      "userId": user.uid,
      "username": userData["username"],
      "userImage": userData["image_url"]
    });
    _controller.clear();
    _enteredMessage="";
    setState(() {});
  }

   File file;
   void showFilePicker(FileType fileType) async {
     final pickedFile = await FilePicker.getFile(type: fileType);
     setState(() {
       file=pickedFile;
     });
     final user= await FirebaseAuth.instance.currentUser();
     final userData= await Firestore.instance.collection("users").document(user.uid).get();
     final ref = FirebaseStorage.instance
         .ref()
         .child('file')
         .child(user.uid + '.doc');

     await ref.putFile(file).onComplete;

     final url = await ref.getDownloadURL();
     Firestore.instance.collection("chat").add({
       "file": url,
       "createdAt": Timestamp.now(),
       "userId": user.uid,
       "username": userData["username"],
       "userImage": userData["image_url"]
     });
     //Navigator.pop(context);

   }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Material(color: Colors.white,child: IconButton(icon: Icon(CupertinoIcons.add, color: Theme.of(context).accentColor, size: 35,), onPressed: (){showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => CupertinoActionSheet(
              title: const Text('      Send...', style: TextStyle(fontSize: 20,),),
              actions: [
                CupertinoActionSheetAction(
                  child: Row(children: [Icon(CupertinoIcons.location, color: Theme.of(context).accentColor,),SizedBox(width: 10,), const Text('Location', style: TextStyle(color: Colors.blue))], mainAxisAlignment: MainAxisAlignment.center,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoActionSheetAction(
                  child: Row(children: [Icon(Icons.attach_money, color: Theme.of(context).accentColor,), SizedBox(width: 10,),const Text('Money', style: TextStyle(color: Colors.blue))],mainAxisAlignment: MainAxisAlignment.center,),
                  onPressed: () {
                    _navigateToP2P(context);
                  },
                ),
                CupertinoActionSheetAction(
                  child: Row(children: [Icon(Icons.folder_open, color: Theme.of(context).accentColor,), SizedBox(width: 10,), const Text('File',style: TextStyle(color: Colors.blue) )], mainAxisAlignment: MainAxisAlignment.center,),
                  onPressed: ()=>
                    showFilePicker(FileType.custom,)

                ),
              ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text('Cancel', style: TextStyle(color: Colors.redAccent),),
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },)
            ),
          );})),
          Expanded(
              child: Container(
                height: 40,
                child: CupertinoTextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  maxLength: 500,
                  //placeholderStyle: TextStyle(color: Colors.white10, fontSize: 15),
                  placeholder: "   Your message...",
                  style: TextStyle(color: Colors.black, ),
                  controller: _controller,
            decoration: BoxDecoration(color: Colors.grey[100],borderRadius: BorderRadius.circular(15)),
            onChanged: (value) {setState(() {
                _enteredMessage=value;
            });},
          ),
              )),
          _enteredMessage.trim().isEmpty?IconButton(icon: Icon(Icons.mic_none, color: Colors.blueAccent[400]), onPressed: (){},):SizedBox(width: 4,),
           _enteredMessage.trim().isEmpty?MessageImagePicker(_pickedImage):SizedBox(width: 0,),
          _enteredMessage.trim()==""?SizedBox(width: 0,):CircleAvatar(
             radius: 18,
             backgroundColor: Colors.green,
             child: Center(
               child: IconButton(
                 padding: EdgeInsets.all(0.0),
                      icon: Icon(
                        CupertinoIcons.up_arrow,
                        color: Colors.white,
                        size: 22,
                      ),
                      onPressed:  _enteredMessage.trim()==""?(){}:_sendMessage,),
             ),
           ),
        ],
      ),
    );
  }
}

void _navigateToP2P(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => P2PPay()));
}

