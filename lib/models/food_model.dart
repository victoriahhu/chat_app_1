import '../screens/all_screens.dart';

class FoodModel {
  String name;
  String tagLine;
  String image;
  Object pageRoute;


  FoodModel(this.name, this.tagLine, this.image,
      this.pageRoute, );
}

List<FoodModel> foodRecommendations = foodData
    .map((item) => FoodModel(item['name'], item['tagLine'],
  item['image'], item['pageRoute'], ))
    .toList();

var foodData = [
  {
    "name": "Local groceries",
    "tagLine": "",
    "image":
    "https://images.unsplash.com/photo-1543083477-4f785aeafaa9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80",

    "pageRoute":
    "",
    // "price":
  },
  {
    "name": "Supermarket",
    "tagLine": "",
    "image":
    "https://images.unsplash.com/photo-1581264669997-3f222f331aaa?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8c3VwZXJtYXJrZXR8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
    "pageRoute":
    SupermarketOverview(),
    //"price":
  },
  {
    "name": "Bakery",
    "tagLine": "",
    "image":
    "https://images.unsplash.com/photo-1477763858572-cda7deaa9bc5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzV8fGJha2VyeXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",

    "pageRoute":
    "",
    //"price": 110
  },
  {
    "name": "Butcher/Fish Shop",
    "tagLine": "",
    "image":
    "https://cropper.watch.aetnd.com/public-content-aetn.video.aetnd.com/video-thumbnails/AETN-History_VMS/438/659/BRAND_THC_BUTC_223014_NLM_365415_2398_60_20190517_02_HD.jpg",

    "pageRoute":
    "",
    //"price": 180
  },

];