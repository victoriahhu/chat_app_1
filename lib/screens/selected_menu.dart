import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/screens/all_screens.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chatapp/models/all_models.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedMenu extends StatelessWidget {
  @required
  final String id;
  @required
  final String name;
  @required
  final String address;
  @required
  final String imageUrl;
  @required
  final String restauPicUrl;
  @required
  final List<Product> menu;
  bool isFavorite = false;

  SelectedMenu(this.id, this.name, this.address, this.imageUrl,
      this.restauPicUrl, this.menu, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
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
                            _navigateToFoodScreen(context);
                          },
                        ),
                      ),
                      Container(
                        height: 57.6,
                        width: 57.6,
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          color: Color(0x10000000),
                        ),
                        child:
                            SvgPicture.asset('assets/svg/icon_heart_fill.svg'),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 13, left: 28.8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/icon_location.svg',
                          color: Colors.blueAccent,
                          height: 18,
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text(
                            address,
                            softWrap: true,
                            maxLines: 2,
                            style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[600]),
                          ),
                        ),
                      ]),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        restauPicUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: SizedBox(
                  height: MediaQuery.of(context).size.height * 1.5,
                  child: ListView.builder(
                      itemCount: menu.length,
                      itemBuilder: (ctx, i) => ListTile(
                        tileColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17.0),
                            ),
                            title: Text(
                              menu[i].title,
                              textAlign: TextAlign.center,
                            ),
                            leading: Container(
                              child: Text(menu[i].price.toString()),
                            ),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => ProductDetailPopup(menu[i].id, menu[i].title, menu[i].description, menu[i].price, menu[i].imageUrl, menu[i].isFavorite));
                            },
                            trailing: Icon(CupertinoIcons.add_circled),
                          )),
                ))
              ]),
        ),
      ),
    );
  }
}

void _navigateToFoodScreen(BuildContext context) {
  Navigator.of(context).pop();
}
