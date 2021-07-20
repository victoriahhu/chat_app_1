import 'package:chatapp/models/all_models.dart';
import 'package:chatapp/models/restaurant.dart';
import 'package:chatapp/widgets/restaurant_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'all_screens.dart';


class ItalianScreen extends StatelessWidget {
  final List<Restaurant> loadedRestaurants = [
    Restaurant(
      id: 'r1',
      name: 'La Tagliatella',
      address: 'Avinguda del Comte de Sallent, 21, 07003 Palma, Illes Balears',
      type: "Italian",
      logoUrl: "https://pbs.twimg.com/profile_images/1347193801698390019/xVpHMbDB_400x400.jpg",
      imageUrl:
      'https://media-cdn.tripadvisor.com/media/photo-s/1a/a6/03/e7/pizza-di-foie.jpg',
      restauPicUrl: "https://www.nevada.shopping/sites/nevada.shopping/files/styles/large/public/field/image/la-tagliatella.jpg?itok=y_KhStem",
      menu: [Product( id: 'p5',
        title: 'Vegeterian Lasagna',
        description: '',
        price: 13.90,
        imageUrl:
        'https://animalgourmet.com/wp-content/uploads/2017/09/vegetarian-lasagna-horiz-a-2000.jpg',
      ),Product(id: 'p6',
        title: 'Pasta Carbonara',
        description: '',
        price: 11.90,
        imageUrl:
        'https://www.cubalite.com/wp-content/uploads/images_uploads_ftp/Espaguetis%20a%20la%20carbonara.jpg',
      )],
    ),
    Restaurant(
      id: 'r2',
      name: 'Prosecco Santa Catalina',
      address: 'Carrer de Sant Magí, 48, 07013 Palma, Illes Balears',
      type: "Italian",
      logoUrl: "https://www.proseccosantacatalina.com/storage/app/uploads/public/5e8/ef2/e3a/5e8ef2e3a28ed571481946.png",
      imageUrl: 'https://img.grouponcdn.com/deal/2vyT9mYgQEYAivM6VmTF7e3cRE37/2v-1280x768/v1/t600x362.jpg',
        restauPicUrl: "https://www.proseccosantacatalina.com/storage/app/uploads/public/5f2/821/a8c/thumb_251_0_0_0_0_crop.jpg",
        menu: [Product( id: 'p7',
          title: 'Pesto&Ricotta Lasagna',
          description: '',
          price: 15.90,
          imageUrl:
          'http://simply-delicious-food.com/wp-content/uploads/2019/09/Vegetarian-lasagna-4.jpg',
        ),Product(id: 'p8',
          title: 'Pasta Carbonara',
          description: 'jjjjk',
          price: 11.90,
          imageUrl:
          'https://www.cubalite.com/wp-content/uploads/images_uploads_ftp/Espaguetis%20a%20la%20carbonara.jpg',
        )]
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
                  )
                  ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
                child: SizedBox(height:MediaQuery.of(context).size.height*1.5, child: ListView.builder(itemCount: loadedRestaurants.length,padding: EdgeInsets.symmetric(vertical: 10),itemBuilder: (ctx,i)=> RestaurantTile(loadedRestaurants[i].id, loadedRestaurants[i].name, loadedRestaurants[i].address,loadedRestaurants[i].logoUrl, loadedRestaurants[i].imageUrl, loadedRestaurants[i].restauPicUrl, loadedRestaurants[i].menu,loadedRestaurants[i].isFavorite)),)
            ),

          ]),
        ),
      ), floatingActionButton: FloatingActionButton.extended(
      onPressed: (){},
      elevation: 15,
      icon: Icon(CupertinoIcons.cart),
      label: Text('Check out'),
    ),);
  }
}

void _navigateToFoodScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => FoodScreen()));
}