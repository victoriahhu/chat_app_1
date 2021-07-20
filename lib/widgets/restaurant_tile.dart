import 'package:flutter/material.dart';
import 'package:chatapp/models/all_models.dart';
import 'package:chatapp/screens/all_screens.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantTile extends StatelessWidget {
  @required
  final String id;
  @required
  final String name;
  @required final String address;
  final String logoUrl;
  @required
  final String imageUrl;
  @required final String restauPicUrl;
  @required final List<Product> menu;
  bool isFavorite=false;

  RestaurantTile(this.id, this.name, this.address, this.logoUrl, this.imageUrl, this.restauPicUrl,this.menu,this.isFavorite);

  @override
  Widget build(BuildContext context) {
    void _navigateToMenu(BuildContext context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SelectedMenu(id, name, address, imageUrl, restauPicUrl, menu, isFavorite)));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: GestureDetector(
          onTap: (){_navigateToMenu(context);},
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
                borderRadius: BorderRadius.circular(25)),
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Expanded(
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                      child: Image.network(
                        logoUrl,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Expanded(
                      child:ClipRRect(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                    child: Stack(
                      children: [Image.network(
                        imageUrl,
                        fit: BoxFit.fill,
                        height: 500,
                        width: 500,
                      ), Center(child: Text(name,style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25),),)]
                    ),)
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
