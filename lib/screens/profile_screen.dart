import 'package:chatapp/screens/all_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/message_bubble.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Profile and Settings",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){_navigateToProfilePage(context);},
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                    height: MediaQuery.of(context).size.height*0.15,
                    decoration: BoxDecoration( boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                        borderRadius: BorderRadius.circular(12.6),
                        color: Colors.white
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.8, right: 20.8),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(Firestore.instance
                                      .collection("users").document("image_url").toString()),
                                ),
                                Column(
                                    children: [
                                      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                                      Text(
                                        ' Full Name',
                                        style: GoogleFonts.lato(
                                            fontSize: 15.2,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.5,child: Text("Job", style: GoogleFonts.lato(
                                          color: Colors.grey[800]), overflow: TextOverflow.ellipsis, maxLines: 3, textAlign: TextAlign.center,)),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.5,child: Text("View profile", style: GoogleFonts.lato(
                                          color: Colors.grey), textAlign: TextAlign.center,))]
                                ),]
                          ),))),
              ),
            ),
            SizedBox(height: 25,),
            ListTile(
              tileColor: Colors.white,
              title: Text("Account", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
              leading: Icon(CupertinoIcons.lock),
              trailing: Icon(CupertinoIcons.forward),
              //subtitle: Text(message),
              dense: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17.0),
              ),
              onTap: () {
                //...
              },
            ),
            SizedBox(height: 2,),
            ListTile(
              tileColor: Colors.white,
              title: Text("Payment options", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
              leading: Icon(Icons.credit_card_outlined,color: Colors.grey[400],),
              trailing: Icon(CupertinoIcons.forward),
              //subtitle: Text(message),
              dense: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17.0),
              ),
              onTap: () {
                //...
              },
            ),
            SizedBox(height: 2,),
            ListTile(
              tileColor: Colors.white,
              title: Text("Transactions history", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
              leading: Icon(Icons.monetization_on_outlined,color: Colors.grey[400],),
              trailing: Icon(CupertinoIcons.forward),
              //subtitle: Text(message),
              dense: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17.0),
              ),
              onTap: () {
                //...
              },
            ),SizedBox(height: 2,),
            ListTile(
              tileColor: Colors.white,
              title: Text("Important messages", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
              leading: Icon(Icons.star_border, color: Colors.orangeAccent,),
              trailing: Icon(CupertinoIcons.forward),
              //subtitle: Text(message),
              dense: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17.0),
              ),
              onTap: () {
                //...
              },
            ),
            SizedBox(height: 25,),
            ListTile(
              tileColor: Colors.white,
              title: Text("Help", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
              leading: Icon(CupertinoIcons.info,color: Colors.blue),
              //subtitle: Text(message),
              dense: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17.0),
              ),
              onTap: () {
                //...
              },
            ),SizedBox(height: 2,),
            ListTile(
              tileColor: Colors.white,
              title: Text("Recommend to a friend", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
              leading: Icon(CupertinoIcons.heart_fill,color: Colors.pink),
              //subtitle: Text(message),
              dense: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17.0),
              ),
              onTap: () {
                //...
              },
            ),
            SizedBox(height: 40,),
            ListTile(
                //selected: true,
                tileColor: Colors.white,
                title: Text("Sign out", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.blueAccent[400]),),
                leading: Icon(Icons.logout, color: Colors.blueAccent[400],),
                //subtitle: Text(message),
                dense: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.0),
                ),
                onTap: () {
                  _signOut();
                },
              ),
            SizedBox(height: 40,),
            ]
        ),
      ),
    );
  }
}
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

Future<void> _signOut() async {
  await _firebaseAuth.signOut();
}

void _navigateToProfilePage(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ProfilePage()));
}