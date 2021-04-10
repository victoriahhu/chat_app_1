class EntertainmentModel {
  String name;
  String tagLine;
  String image;
  String description;


  EntertainmentModel(this.name, this.tagLine, this.image,
      this.description, );
}

List<EntertainmentModel> entertainmentRecommendations = entertainmentData
    .map((item) => EntertainmentModel(item['name'], item['tagLine'],
  item['image'], item['description'], ))
    .toList();

var entertainmentData = [
  {
    "name": "Cinema & Shows",
    "tagLine": "",
    "image":
    "https://www.missioncaleb.ch/wp-content/uploads/2017/06/VO-cinema-in-Barcelona.jpg",

    "description":
    "",
    // "price":
  },
  {
    "name": "Festivals & concerts",
    "tagLine": "",
    "image":
    "https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZmVzdGl2YWx8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
    "description":
    "",
    //"price":
  },
  {
    "name": "Parks",
    "tagLine": "",
    "image":
    "https://images3.alphacoders.com/918/91839.jpg",

    "description":
    "",
    //"price": 110
  },
  {
    "name": "Cultural curiosity",
    "tagLine": "",
    "image":
    "https://images.unsplash.com/photo-1554907984-15263bfd63bd?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8bXVzZXVtfGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80",

    "description":
    "",
    //"price": 180
  },

];