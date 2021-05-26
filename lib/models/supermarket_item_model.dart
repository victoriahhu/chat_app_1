import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'product_detail_popup.dart';

class SupermarketItem extends StatelessWidget {

  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final bool isFavorite;

  SupermarketItem(this.id, this.title, this.description, this.price,this.imageUrl, this.isFavorite);



  @override
  Widget build(BuildContext context) {
    showMaterialDialog() {
      showDialog(
          context: context,
          builder: (_) => ProductDetailPopup(id, title, description, price, imageUrl, isFavorite));
    }
    return GestureDetector(
      onTap: showMaterialDialog,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(child: Image.network(imageUrl, fit: BoxFit.cover,),

          footer: GridTileBar( trailing:IconButton(icon: Icon(CupertinoIcons.heart), onPressed: (){},), title: Text(title, textAlign: TextAlign.center,),
            backgroundColor: Colors.black,),
          //header: GridTileBar(title:Text(supermarket),),
        ),
      ),
    );
  }
}
