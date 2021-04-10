class PersonalCareModel {
  String name;
  String tagLine;
  String image;
  String description;


  PersonalCareModel(this.name, this.tagLine, this.image,
      this.description, );
}

List<PersonalCareModel> careRecommendations = careData
    .map((item) => PersonalCareModel(item['name'], item['tagLine'],
  item['image'], item['description'], ))
    .toList();

var careData = [

  {
    "name": "Sport courses",
    "tagLine": "",
    "image":
    "https://c.wallhere.com/photos/92/04/portrait_art_dark_athletic_tallinn_track_sony_fineart-892491.jpg!d",

    "description":
    "",
    //"price": 110
  },
  {
    "name": "Beautician",
    "tagLine": "",
    "image":
    "https://images.unsplash.com/photo-1519415387722-a1c3bbef716c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTd8fGJlYXV0eSUyMHNhbG9ufGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80",

    "description":
    "",
    // "price":
  },
  {
    "name": "Hair dresser",
    "tagLine": "",
    "image":
    "https://wallpaperaccess.com/full/3717112.jpg",
    "description":
    "",
    //"price":
  },

  {
    "name": "Relaxation",
    "tagLine": "",
    "image":
    "https://www.agence-ajcreation.fr/themes/universal/assets/img/block-img-1-1-2.png",

    "description":
    "",
    //"price": 180
  },

];