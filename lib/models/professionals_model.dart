import 'package:chatapp/screens/all_screens.dart';

class ProfessionalsModel {
  String name;
  String tagLine;
  String image;
  String description;
  Object pageRoute;


  ProfessionalsModel(this.name, this.tagLine, this.image,
      this.description, this.pageRoute);
}

List<ProfessionalsModel> proRecommendations = proData
    .map((item) => ProfessionalsModel(item['name'], item['tagLine'],
    item['image'], item['description'], item["pageRoute"]))
    .toList();

var proData = [
  {
    "name": "Personnel",
    "tagLine": "Find the personnel you need",
    "image":
    "https://www.alsaeci.com/wp-content/uploads/2019/11/locaux-professionnels-faire-appel-a-une-femme-de-menage-externe.jpg",

    "description":
    "",
    "pageRoute": PersonnelOverview(),
  },
  {
    "name": "Business",
    "tagLine": "Find the best business partners",
    "image":
    "https://www.bbva.com/wp-content/uploads/2018/02/business-angel-inversor-negocios-startup-meeting-networking-BBVA-1-e1517842951593.jpg",
    "description":
    "",
    "pageRoute":"",
  },
  {
    "name": "Engineering",
    "tagLine": "",
    "image":
    "https://d3jh33bzyw1wep.cloudfront.net/s3/W1siZiIsIjIwMTkvMTEvMjEvMTIvMDYvMjcvMzIvc2h1dHRlcnN0b2NrXzE0OTg3NDI1MTkuanBnIl0sWyJwIiwidGh1bWIiLCI4MDB4NDUwIyJdXQ",

    "description":
    "",
    "pageRoute":"",
  },
  {
    "name": "Healthcare",
    "tagLine": "",
    "image":
    "https://www.elsevier.com/__data/assets/image/0004/998491/medical-lab-image_iStock-502950545.jpg",

    "description":
    "",
    "pageRoute":"",
  },
  {
    "name": "Education",
    "tagLine": "",
    "image":
    "https://assets.ey.com/content/dam/ey-sites/ey-com/en_gl/topics/ey-at-the-milken-institute-global-conference/ey-teacher-assisting-students-working-tablets.jpg",

    "description":
    "",
    "pageRoute":"",
  },
];
