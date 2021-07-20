import 'package:chatapp/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/all_models.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/all_screens.dart';
import '../models/product_detail_popup.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonnelOverview extends StatelessWidget {



  final List<User> loadedUsers = [
    User(
      id: 'u1',
      name: 'Samantha Johnes',
      profession: "Cook",
      city: "Vancouver",
      numberRelations: 23,
      pastProf: "Waitress",
      college: "University of Pennsylvania",
      description: 'Samantha Johnes, (born November 8, 1966, Johnstone, Scotland), Scottish chef and restaurateur known for his highly acclaimed restaurants and cookbooks but perhaps best known in the early 21st century for the profanity and fiery temper that he freely displayed on television cooking programs.',
      website: "https://www.escuelamasterchef.com/",
      age: 26,
      imageUrl:
      'https://i.f1g.fr/media/eidos/267x400_crop/2017/04/19/XVM7c2dc250-2116-11e7-be98-e880d1c34148-267x400.jpg',
    ),
    User(
      id: 'u2',
      name: 'Cathy Smith',
      profession: "Cleaner",
      city: "Vancouver",
      numberRelations: 23,
      pastProf: "Cashier",
      college: null,
      description: 'jjjhkhkh',
      website: "",
      age: 26,
      imageUrl:
      'https://i.f1g.fr/media/eidos/267x400_crop/2017/04/19/XVM7c2dc250-2116-11e7-be98-e880d1c34148-267x400.jpg',
    ),
    User(
      id: 'u3',
      name: 'Ashley Turner',
      profession: "Driver",
      city: "Vancouver",
      numberRelations: 23,
      pastProf: "",
      college: null,
      description: 'jjjhkhkh',
      website: "",
      age: 22,
      imageUrl:
      'https://i.f1g.fr/media/eidos/267x400_crop/2017/04/19/XVM7c2dc250-2116-11e7-be98-e880d1c34148-267x400.jpg',
    ),
    User(
      id: 'u4',
      name: 'Will Kutcher',
      profession: "Gardener",
      city: "Vancouver",
      numberRelations: 32,
      pastProf: null,
      college: null,
      description: 'jjjhkhkh',
      website: null,
      age: 26,
      imageUrl:
      'https://i.pinimg.com/236x/a9/f3/1f/a9f31fe45e89d69bc3860d6e2a99b90b.jpg',
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
                        _navigateToPrevious(context);
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
                  )],
              ),
            ),
            Expanded(
                child: SizedBox(height:MediaQuery.of(context).size.height*1.5, child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3 / 4,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (ctx, i) => UserGridTile(loadedUsers[i].id, loadedUsers[i].name, loadedUsers[i].profession, loadedUsers[i].city, loadedUsers[i].numberRelations,loadedUsers[i].pastProf, loadedUsers[i].college, loadedUsers[i].description, loadedUsers[i].website, loadedUsers[i].age, loadedUsers[i].imageUrl,loadedUsers[i].isFavorite),
                  padding: const EdgeInsets.all(10.0),
                  itemCount: loadedUsers.length,
                ),)
            ),

          ]),
        ),
      ), );
  }
}

void _navigateToPrevious(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ProfessionalsScreen()));
}
