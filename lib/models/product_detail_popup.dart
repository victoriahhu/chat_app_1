import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'all_models.dart';
import '../widgets/all_widgets.dart';
import '../screens/all_screens.dart';



class ProductDetailPopup extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite = false;

  ProductDetailPopup(this.id, this.title, this.description, this.price,
      this.imageUrl, this.isFavorite);

  //var number=Stepper2State.vvalue;

  @override
  Widget build(BuildContext context) {

    final dialog=AlertDialog(
      scrollable: true,
      backgroundColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: new Text(title, textAlign: TextAlign.center,style: GoogleFonts.lato(
          fontWeight: FontWeight.w700,
          color: Colors.blueAccent,
          fontSize: 16.8),),
      content: Column(children: [
        new Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height*0.3,
          width: MediaQuery.of(context).size.height*3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.share, color: Colors.blueAccent, size: 30,)),Text("${price.toString()}\$", style: TextStyle(color: Colors.indigoAccent),),IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.heart, color: Colors.pink,size: 30,))],),
        Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Text(
              description,
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [StepperTouch(),],),
      ]),
      actions: <Widget>[
        CupertinoButton(alignment: Alignment.center,
          pressedOpacity: 0.6,
          color: Colors.blue,
          child: Row( mainAxisAlignment: MainAxisAlignment.center,children: [new Text("Add", style: TextStyle(color: Colors.white)), Icon(CupertinoIcons.cart, color: Colors.white,)]),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );


    return dialog;
  }
}



