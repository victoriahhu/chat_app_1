class RestaurantModel {
  String name;
  String tagLine;
  String image;
  String description;


  RestaurantModel(this.name, this.tagLine, this.image,
      this.description, );
}

List<RestaurantModel> restaurantRecommendations = restaurantData
    .map((item) => RestaurantModel(item['name'], item['tagLine'],
  item['image'], item['description'], ))
    .toList();

var restaurantData = [
  {
    "name": "Italian",
    "tagLine": "",
    "image":
    "https://laboutiqueitalianfood.es/wp-content/uploads/2017/10/fondohomeboutique-1920x800.jpg",

    "description":
    "",
    // "price":
  },
  {
    "name": "Asian",
    "tagLine": "",
    "image":
    "https://i.pinimg.com/originals/1e/6f/0a/1e6f0a48ad1168accfd7898e4e4cb9f2.jpg",
    "description":
    "",
    //"price":
  },
  {
    "name": "Fast Food",
    "tagLine": "",
    "image":
    "https://s2.best-wallpaper.net/wallpaper/5120x2880/1808/Hamburger-sandwich-fast-food_5120x2880.jpg",

    "description":
    "",
    //"price": 110
  },
  {
    "name": "Indian",
    "tagLine": "",
    "image":
    "https://www.lonestartravelguide.com/wp-content/uploads/2020/10/shutterstock_617546066-scaled.jpg",

    "description":
    "",
    //"price": 180
  },
  {
    "name": "Snack",
    "tagLine": "",
    "image":
    "https://i.pinimg.com/originals/5c/c8/95/5cc895396f32cf4a280b4e43c4359882.jpg",

    "description":
    "",
    //"price": 200
  },
];
