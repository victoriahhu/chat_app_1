class HotelModel {
  String name;
  String tagLine;
  String image;
  List<String> images;
  String description;
  int price;

  HotelModel(this.name, this.tagLine, this.image, this.images,
      this.description, this.price);
}

List<HotelModel> hotelRecommendations = hotelsData
    .map((item) => HotelModel(item['name'], item['tagLine'],
    item['image'], item['images'], item['description'], item['price']))
    .toList();

var hotelsData = [
  {
    "name": "The Peninsula, New York",
    "tagLine": "The Peninsula The Hidden Palace",
    "image":
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/45/0d/56/lobby.jpg?w=900&h=-1&s=1",
    "images": [
      "https://media-cdn.tripadvisor.com/media/photo-s/00/13/5e/28/peninsula-entrance.jpg",
      "https://media.cntraveler.com/photos/5a68e4a8a53f360b121b164a/16:9/w_2560%2Cc_limit/Salong-de-Ning-at-the-Peninsula_Courtesy-The-Peninsula-New-York_2018_Salon-de-Ning-East-Terrace-2016.jpg",
      "http://www.elitetraveler.com/wp-content/uploads/2013/05/The-Peninsula-Suite-The-Peninsula-New-York.jpg",
      "http://www.elitetraveler.com/wp-content/uploads/2013/05/New-Look-The-Peninsula-Hong-Kong.jpg",
      "https://d2poxrheyfxwbo.cloudfront.net/resize/780x500/filters:quality(65):max_age(2604800)/s3/hotel/0b1471ca-cabf-411d-9502-138851ca3cd7"
    ],
    "description":
    "",
    "price": 130
  },
  {
    "name": "The Dominick, New York",
    "tagLine": "The Dominick, The Beautiful Heaven",
    "image":
    "https://x.cdrst.com/foto/hotel-sf/6428f/granderesp/foto-hotel-abb8ea7.jpg",
    "images": [
      "https://d3hfxk7rwdcpol.cloudfront.net/CSN/6d66f8a0-ad86-4861-9e8c-f14d873e1a63/images/da966e6baa9c48a2bfa74fd428ae8408_LARGE.jpg",
      "https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_1300,q_auto,w_2000/itemimages/13/34/1334408_v4.jpeg",
      "https://cf.bstatic.com/images/hotel/max1024x768/103/103887295.jpg",
      "https://ds4.cityrealty.com/img/5ac92fce2b412d23afe6e9d6c0cdbda3c96c1527+w+h+0+60/the-dominick-246-spring-street-02.jpg",
      "https://ds4.cityrealty.com/img/3a916a70aba6034d935e324f2c19a8c55bdaaf41+w+h+0+60/the-dominick-246-spring-street-07.jpg",
    ],
    "description":
    "",
    "price": 120
  },
  {
    "name": "Renaissance, New York",
    "tagLine": "Renaissance, a modern jewel",
    "image":
    "https://cache.marriott.com/marriottassets/marriott/NYCRT/nycrt-exterior-0064-hor-feat.jpg",
    "images": [
      "https://i.pinimg.com/originals/3e/2d/3a/3e2d3ab419f0bd487ef615e9ab65a826.jpg",
      "https://qtxasset.com/hotelmanagement/1581355389/Renaissance%20New%20York%20Chelsea%20Hotel.jpg?c8z.H5AK27X4fl30nkhR3dpKaU96Wjcr",
      "https://pix10.agoda.net/hotelImages/2465242/0/5b4632f52aa1711b65aa3f47f0718f67.jpg?s=1024x768",
      "https://cf.bstatic.com/images/hotel/max1280x900/258/258200877.jpg",
      "https://weblogtheworld.com/wp-content/uploads/Renaissance-NY-Midtown-Guestroom-Bathroom-2.jpg"
    ],
    "description":
    "",
    "price": 110
  },
  {
    "name": "Trump Hotel And Tower, New York",
    "tagLine": "The Trump Tower, a model of luxury",
    "image":
  "https://thumbnails.trvl-media.com/3kCa86PEpTniRuNtpnpGiAMMNgw=/773x530/smart/filters:quality(60)/images.trvl-media.com/hotels/1000000/50000/40400/40338/ef8b29b2_z.jpg",
    "images": [
      "https://www.trumphotels.com/uploads/18509/0/cloudinary/trump-hotels-cloudinary/image/upload/x_0,y_48,w_1539,h_890,c_crop/c_fill,w_1440,ar_180:109,g_auto/v1541714598/wwd422hpy4wpimwlu3xp.jpg",
      "https://foto.hrsstatic.com/fotos/3/2/1280/1280/100/FFFFFF/http%3A%2F%2Ffoto-origin.hrsstatic.com%2Ffoto%2F0%2F6%2F0%2F4%2F060405%2F060405_h_13055697.jpg/bCAMA5pJsDaMLJ%2F1h2cB6w%3D%3D/1024%2C682/6/Trump_Hotel_New_York-New_York-Hall-3-60405.jpg",
      "https://i.ytimg.com/vi/A6JLcXCf0Wk/maxresdefault.jpg",
      "https://foto.hrsstatic.com/fotos/3/2/1280/1280/100/FFFFFF/http%3A%2F%2Ffoto-origin.hrsstatic.com%2Ffoto%2F0%2F6%2F0%2F4%2F060405%2F060405_u_26658101.jpg/NOi7k2KXHJ0vocULcT7JjQ%3D%3D/791%2C1024/6/Trump_Hotel_New_York-New_York-Info-60405.jpg",
      "https://www.trumphotels.com/uploads/18816/0/cloudinary/trump-hotels-cloudinary/image/upload/x_3,y_0,w_830,h_511,c_crop/c_fill,w_1300,ar_13:6/v1553023382/fbk6au29ona9356qdg2r.jpg"
    ],
    "description":
    "",
    "price": 180
  },
  {
    "name": "The Plaza, New York",
    "tagLine": "The Plaza, one of the most elegant hotels in the world",
    "image":
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/e1/a6/8c/the-plaza.jpg?w=900&h=-1&s=1",
    "images": [
      "https://www.ahstatic.com/photos/a568_rosld_00_p_1024x768.jpg",
      "https://media.cool-cities.com/plaza_athenee_nyc_019gaja_x_mob.jpg?h=530",
      "https://s1.eestatic.com/2018/05/07/corazon/celebrities/celebrities_305482203_76700458_1706x960.jpg",
      "https://i.pinimg.com/originals/14/e4/ff/14e4ffea23161ede7d372ae98361509c.jpg",
      "https://thumbnails.trvl-media.com/uKrQoz90ULw4cCBJtootojNUTqE=/773x530/smart/filters:quality(60)/images.trvl-media.com/hotels/1000000/20000/17900/17822/61781787_z.jpg"
    ],
    "description":
    "",
    "price": 200
  },
];
