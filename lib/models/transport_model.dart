class Transport{
  const Transport({this.title,this.image});
  final String title;
  final String image;
}

const List<Transport>transports= const <Transport>[
  const Transport(title: "Taxi",image: "https://st3.depositphotos.com/16262510/33731/v/600/depositphotos_337315242-stock-illustration-taxi-icon-vector-sign-and.jpg"),
  const Transport(title: "Minibus", image: "https://img.icons8.com/emoji/452/bus-emoji.png"),
  const Transport(title: "Plane", image: "https://www.pngarts.com/files/4/Plane-PNG-Image.png"),
  const Transport(title: "Helicopter", image: "https://www.searchpng.com/wp-content/uploads/2019/01/Helicopter-PNG-Image.png"),
  const Transport(title: "Jet", image: "https://static.vecteezy.com/system/resources/previews/000/373/150/non_2x/business-jet-airplane-vector-illustration.jpg")
];
