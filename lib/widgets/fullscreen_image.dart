import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import '../widgets/message_image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  FullScreenImage(this.imageUrl);




  @override
  Widget build(BuildContext context) {
    Future<void> _downloadImage() async {
      await GallerySaver.saveImage(imageUrl);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: Text('Downloaded in gallery!', style: TextStyle(color: Colors.white),),
      ));
    }


    //final ref= FirebaseStorage.instance.ref().child("image").child(imageUrl);
    //final url= ref.getDownloadURL().toString();

    return new Container(
      color: Colors.transparent,
      child: new Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [IconButton(onPressed: () {
            //var file = url;
            GallerySaver.saveImage(imageUrl)
                .then((value) => print('>>>> save value= $value'))
                .catchError((err) {
              print('error :( $err');
            });
          }, icon: Icon(Icons.download_outlined))],
        ),
        body: Container(width:double.infinity, height: double.infinity, child:
        ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                    height: 400.0,
                  ),
                ),


        ),

      ),

    );
  }
}

