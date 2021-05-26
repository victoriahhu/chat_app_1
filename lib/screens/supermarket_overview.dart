import 'package:chatapp/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/all_models.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/all_screens.dart';
import '../models/product_detail_popup.dart';
import 'package:google_fonts/google_fonts.dart';

class SupermarketOverview extends StatelessWidget {



  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Olive oil 50cl',
      description: 'A red shirt - it is pretty red!',
      price: 4.90,
      imageUrl:
          'http://www.olisdejornets.com/139-thickbox_01oslo/bouteille-de-50-cl-huile-d-olive-vierge.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Panzani pasta 500g',
      description: 'A nice pair of trousers.',
      price: 2.99,
      imageUrl: 'https://media.houra.fr/ART-IMG-XL/13/86/3038350208613-6.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Royal White Basmati Rice 200g',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 3.99,
      imageUrl:
          'https://cdn.richcontext.com/media/5252391061-d705f8743b01baf686b557a85522d941.png',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/81XQbs%2B9TVL._AC_SL1500_.jpg',
    ),
  ];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[100],
        body: SafeArea(
      child: Container(
        child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(), children: [
          Container(
            height: 57.6,
            margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 57.6,
                  width: 57.6,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.6),
                    color: Color(0x080a0928),
                  ),
                  child: GestureDetector(
                    child: SvgPicture.asset(
                      'assets/svg/icon_left_arrow.svg',
                      color: Colors.grey,
                    ),
                    onTap: () {
                      _navigateToFoodScreen(context);
                    },
                  ),
                ),
            Container(
              height: 57.6,
              width: 57.6,
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.6),
                color: Color(0x080a0928),
              ),
              child: SvgPicture.asset('assets/svg/icon_search.svg'),
            )],
            ),
          ),
          SizedBox(height: 20,),
          DropDownSuper(),
          SizedBox(height: 20,),
             Expanded(
               child: SizedBox(height:MediaQuery.of(context).size.height*1.5, child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3 / 4,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (ctx, i) => SupermarketItem(loadedProducts[i].id, loadedProducts[i].title, loadedProducts[i].description,loadedProducts[i].price,loadedProducts[i].imageUrl,loadedProducts[i].isFavorite),
                padding: const EdgeInsets.all(10.0),
                itemCount: loadedProducts.length,
            ),)
             ),

        ]),
      ),
    ));
  }
}

void _navigateToFoodScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => FoodScreen()));
}

