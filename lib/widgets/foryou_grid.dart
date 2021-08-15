import 'package:chatapp/models/all_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
import '../widgets/all_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animations/loading_animations.dart';


class ForYouGrid extends StatelessWidget {
  List<ForyouItem> adList = [
    ForyouItem(
      id: "f1",
          cover: "https://thumbs.gfycat.com/MealyOrangeAgouti-size_restricted.gif",
      company: "Coca-Cola",
      productName: "50 cl fresh Coke bottle",
      image: "https://www.freepnglogos.com/uploads/coca-cola-png/coca-cola-23.png",
      price: 2.40

    ),
  ForyouItem(
  id: "f2",
  cover: "https://i.makeagif.com/media/1-19-2016/PshpR8.gif",
  company: "Dunkin' Donuts",
  productName: "Fruity Coolatta",
  image: "https://live.staticflickr.com/4113/5059015174_2946412e86_b.jpg",
  price: 3.15

  ),
    ForyouItem(
        id: "f3",
        cover: "https://i.pinimg.com/originals/e8/b9/e8/e8b9e8f16279a8151bc9486b901688a8.gif",
        company: "McDonald's",
        productName: "New Lychee Sundae",
        image: "https://2.bp.blogspot.com/-TKadOuCsNqQ/V0GTikW70XI/AAAAAAAAABI/efsP9Qnkc4EAA_UWWtmpKBmzHD_LyfKyQCLcB/s1600/mcd4.jpg",
        price: 2.70

    ),
    ForyouItem(
        id: "f4",
        cover: "https://cdn.dribbble.com/users/483644/screenshots/6274227/ezgif-1-a8faa1c44da0.gif",
        company: "Visit Jordan",
        productName: "6 days in Jordan pack",
        image: "https://cdn.dribbble.com/users/483644/screenshots/6263729/ezgif-1-56aab785b2ad.gif",
        price: 750

    ),
    ForyouItem(
        id: "f5",
        cover: "https://celebrationfoundation.org/wp-content/uploads/2019/06/Shawn-Mendes-Alessia-Cara-2019-CELEBRATION-1.jpg",
        company: "MTG & AEG",
        productName: "Shawn Mendes & Alessia Cara touring ticket",
        image: "https://cdn.wegow.com/media/artist-media/shawn-mendes/shawn-mendes-1577975956.-1x1780.jpg",
        price: 58

    )
  ];

  @override
  Widget build(BuildContext context) {
    return

        //margin: EdgeInsets.all(12),
        Container(
          height: 1000,
          child: SingleChildScrollView(

            child: StaggeredGridView.countBuilder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                itemCount: adList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => ItemDetailPopup(adList[index].id, adList[index].cover, adList[index].company, adList[index].productName, adList[index].image, adList[index].price));
                          },
                        child:ClipRRect(
                      borderRadius: BorderRadius.all(
                          Radius.circular(15)),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: adList[index].cover,fit: BoxFit.cover,),
                    )),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                            Radius.circular(15))
                    ),
                  );
                },
                staggeredTileBuilder: (index) {
                  return StaggeredTile.count(1, index.isEven ? 0.9: 0.7);
                }),
          ),
        );
  }
}


class ItemDetailPopup extends StatelessWidget {
  @required final String id;
  @required final String cover;
  @required final String company;
  @required final String productName;
  @required final String image;
  @required final double price;

  ItemDetailPopup(this.id,this.cover,this.company,this.productName,this.image,this.price,);

  //var number=Stepper2State.vvalue;

  @override
  Widget build(BuildContext context) {

    final dialog=AlertDialog(
      scrollable: true,
      backgroundColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: new Text(company, textAlign: TextAlign.center,style: GoogleFonts.lato(
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontSize: 16.8),),
      content: Column(children: [
        new Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height*0.3,
          width: MediaQuery.of(context).size.height*3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.share, color: Colors.blueAccent, size: 30,)),Text("${price.toString()}\$", style: TextStyle(color: Colors.indigoAccent),),IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.heart, color: Colors.pink,size: 30,))],),
        Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Text(
              productName,
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [StepperTouch(),],),
      ]),
      actions: <Widget>[
        CupertinoButton(alignment: Alignment.center,
          pressedOpacity: 0.6,
          color: Colors.indigoAccent,
          child: Row( mainAxisAlignment: MainAxisAlignment.center,children: [new Text("Purchase now", style: TextStyle(color: Colors.white)), Icon(CupertinoIcons.cart, color: Colors.white,)]),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );


    return dialog;
  }
}