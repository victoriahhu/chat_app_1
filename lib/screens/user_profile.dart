import 'package:chatapp/screens/all_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
//import '../widgets/all_widgets.dart';

class UserProfile extends StatelessWidget {
  @required
  final String id;
  @required
  final String name;
  final String profession;
  @required
  final String city;
  @required
  final int numberRelations;
  final String pastProf;
  final String college;
  final String description;
  final String website;
  final int age;
  @required
  final String imageUrl;
  bool isFavorite = false;

  UserProfile(
      this.id,
      this.name,
      this.profession,
      this.city,
      this.numberRelations,
      this.pastProf,
      this.college,
      this.description,
      this.website,
      this.age,
      this.imageUrl,
      this.isFavorite);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SlidingUpPanel(
          borderRadius: BorderRadius.circular(10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          minHeight: MediaQuery.of(context).size.height * 0.12,
          maxHeight: MediaQuery.of(context).size.height,
          panelBuilder: (scrollController) =>
              buildSlidingPanel(scrollController: scrollController),
          body: SafeArea(
              child: Container(
                  child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                // Custom Navigation Drawer and Search Button
                GestureDetector(
                  onTap: () {
                    _navigateBack(context);
                  },
                  child: Container(
                    height: 57.6,
                    margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          CupertinoIcons.clear_thick,
                          size: 40,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ]))),
        ));
  }



  Widget buildSlidingPanel({
    @required ScrollController scrollController,
  }) =>
      DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: BuildTabBar(),
              body: TabBarView(children: [
                ListView(
                  padding: EdgeInsets.all(16),
                  controller: scrollController,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      name,
                      style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.share,
                              color: Colors.blueAccent,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.blueGrey[700],
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.star_border,
                              color: Colors.amberAccent,
                              size: 30,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Row(
                              children: [Icon(Icons.card_travel, color: Colors.grey,),Text(
                                "  $profession",
                                style: GoogleFonts.lato(),
                              ),]
                            ),
                          ),
                          pastProf!=null?Text(
                            "Former: $pastProf",
                            style: GoogleFonts.lato(),
                          ): SizedBox(height: 0, width: 0,),
                        ]),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          college!=null?Container(
                            child: Row(
                                children: [Icon(CupertinoIcons.book_fill, color: Colors.grey,),Text(
                                  college,
                                  style: GoogleFonts.lato(),
                                ),]
                            ),
                          ):SizedBox(width: 0.0,),
                          Text("$age years old")
                        ]),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Row(
                                children: [Icon(CupertinoIcons.location_solid, color: Colors.grey,),Text(
                                  " Based in $city",
                                  style: GoogleFonts.lato(),
                                ),]
                            ),
                          ),
                          Container(
                            child: Row(
                                children: [Icon(CupertinoIcons.person_3_fill, color: Colors.grey,),Text(
                                  "  $numberRelations contacts",
                                  style: GoogleFonts.lato(),
                                ),]
                            ),
                          ),
                        ]),
                    SizedBox(height: 20,),
                    website!=null? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.public, color: Colors.grey,),
                        InkWell(
                            child: new Text(
                              '  Learn more here',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                            ),
                            onTap: () => launch(website)),
                      ],
                    ):Container(),
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.info,
                              color: Colors.redAccent,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: (){},
                            icon: Icon(
                              Icons.block,
                              color: Colors.red[700],
                              size: 30,
                            )),
                      ],
                    ),
                    SizedBox(height: 40,),
                  ],
                ),
                ListView(
                  padding: EdgeInsets.all(16),
                  controller: scrollController,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Description: $description',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ]))
      );

  Widget BuildTabBar() => AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ),
          ],
        ),
        bottom: TabBar(
          tabs: [
            Tab(
              child: Text("General"),
            ),
            Tab(
              child: Text("Background"),
            )
          ],
        ),
      );

}

void _navigateBack(BuildContext context) {
  Navigator.pop(context);
}
