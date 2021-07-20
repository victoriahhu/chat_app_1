import 'package:chatapp/screens/italian_screen.dart';

class RestaurantModel {
  String name;
  String tagLine;
  String image;
  Object pageRoute;


  RestaurantModel(this.name, this.tagLine, this.image,
       this.pageRoute);
}

List<RestaurantModel> restaurantRecommendations = restaurantData
    .map((item) => RestaurantModel(item['name'], item['tagLine'],
  item['image'],  item["pageRoute"]))
    .toList();

var restaurantData = [
  {
    "name": "Italian",
    "tagLine": "",
    "image":
    "https://laboutiqueitalianfood.es/wp-content/uploads/2017/10/fondohomeboutique-1920x800.jpg",

    "pageRoute":
    ItalianScreen(),
    // "price":
  },
  {
    "name": "Asian",
    "tagLine": "",
    "image":
    "https://i.pinimg.com/originals/1e/6f/0a/1e6f0a48ad1168accfd7898e4e4cb9f2.jpg",
    "pageRoute":
    "",
    //"price":
  },
  {
    "name": "Fast Food",
    "tagLine": "",
    "image":
    "https://s2.best-wallpaper.net/wallpaper/5120x2880/1808/Hamburger-sandwich-fast-food_5120x2880.jpg",

    "pageRoute":
    "",
    //"price": 110
  },
  {
    "name": "Other",
    "tagLine": "",
    "image":
    "https://nutrishmish.com/site3/wp-content/uploads/2017/08/shutterstock_547199980-e1503449070628.jpg",

    "pageRoute":
    "",
    //"price": 180
  },
  {
    "name": "Snack",
    "tagLine": "",
    "image":
    "https://i.pinimg.com/originals/5c/c8/95/5cc895396f32cf4a280b4e43c4359882.jpg",

    "pageRoute":
    "",
    //"price": 200
  },
];
