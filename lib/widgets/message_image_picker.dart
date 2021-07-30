import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MessageImagePicker extends StatefulWidget {
  MessageImagePicker(this.iimagePickFn);
  final void Function(File pickedImage) iimagePickFn;
  @override
  _MessageImagePickerState createState() => _MessageImagePickerState();
}


class _MessageImagePickerState extends State<MessageImagePicker> {
  File ppickedImage;
  void _pickImage()async {
    final pickedImageFile= await ImagePicker.pickImage(source: ImageSource.camera, );
    setState(() {
      ppickedImage=pickedImageFile;
    });
    //widget.iimagePickFn(ppickedImage);
    final user= await FirebaseAuth.instance.currentUser();
    final userData= await Firestore.instance.collection("users").document(user.uid).get();
    final ref = FirebaseStorage.instance
        .ref()
        .child('image')
        .child(user.uid + '.jpg');

    await ref.putFile(ppickedImage).onComplete;

    final url = await ref.getDownloadURL();
    Firestore.instance.collection("chat").add({
      "image": url,
      "createdAt": Timestamp.now(),
      "userId": user.uid,
      "username": userData["username"],
      "userImage": userData["image_url"]
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ IconButton(icon: Icon(
        CupertinoIcons.camera_fill,
        color: Colors.blueAccent[400],
        size: 35,
      ), onPressed: _pickImage,
      ),
        //ppickedImage!=null?Column(
            //children: [ Container(decoration: BoxDecoration(
              //image: DecorationImage(
                //image: FileImage(ppickedImage),
                //fit: BoxFit.cover,
              //),
            //)),CircleAvatar(
              //radius: 18,
              //backgroundColor: Colors.blue[800],
              //backgroundImage: NetworkImage("https://aeck.wap.sh/images/hinh-nen/hinh-nen-dien-thoai/hinh-nen-sac-mau-2d-3d/011_AECK.WAP.SH-hinh-nen-sac-mau-2D-3D-011.jpg"),
              //child: Center(
                //child: IconButton(
                    //icon: Icon(
                      //Icons.arrow_upward,
                      //color: Colors.white,
                      //size: 22,
                    //),
                   // onPressed:  _sendMessage),
              //),
           // ),
            //]): SizedBox(),
    ]
    );
  }
}
