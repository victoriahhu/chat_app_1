class ProfessionalsModel {
  String name;
  String tagLine;
  String image;
  String description;


  ProfessionalsModel(this.name, this.tagLine, this.image,
      this.description, );
}

List<ProfessionalsModel> proRecommendations = proData
    .map((item) => ProfessionalsModel(item['name'], item['tagLine'],
    item['image'], item['description'], ))
    .toList();

var proData = [
  {
    "name": "Personnel",
    "tagLine": "Find the personnel you need",
    "image":
    "https://www.alsaeci.com/wp-content/uploads/2019/11/locaux-professionnels-faire-appel-a-une-femme-de-menage-externe.jpg",

    "description":
    "",
    // "price":
  },
  {
    "name": "Business",
    "tagLine": "Find the best business partners",
    "image":
    "https://www.bbva.com/wp-content/uploads/2018/02/business-angel-inversor-negocios-startup-meeting-networking-BBVA-1-e1517842951593.jpg",
    "description":
    "",
    //"price":
  },
  {
    "name": "Engineering",
    "tagLine": "",
    "image":
    "https://d3jh33bzyw1wep.cloudfront.net/s3/W1siZiIsIjIwMTkvMTEvMjEvMTIvMDYvMjcvMzIvc2h1dHRlcnN0b2NrXzE0OTg3NDI1MTkuanBnIl0sWyJwIiwidGh1bWIiLCI4MDB4NDUwIyJdXQ",

    "description":
    "",
    //"price": 110
  },
  {
    "name": "Healthcare",
    "tagLine": "",
    "image":
    "https://www.elsevier.com/__data/assets/image/0004/998491/medical-lab-image_iStock-502950545.jpg",

    "description":
    "",
    //"price": 180
  },
  {
    "name": "Education",
    "tagLine": "",
    "image":
    "https://assets.ey.com/content/dam/ey-sites/ey-com/en_gl/topics/ey-at-the-milken-institute-global-conference/ey-teacher-assisting-students-working-tablets.jpg",

    "description":
    "",
    //"price": 200
  },
];
