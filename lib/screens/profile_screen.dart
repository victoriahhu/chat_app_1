import 'package:chatapp/screens/all_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clipboard/clipboard.dart';
import 'dart:ui';
import 'dart:async';


class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //final user = FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
    //final userid = user.uid;


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
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              _navigateToProfilePage(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.15,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                          Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12.6),
                      color: Colors.white),
                  child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.8, right: 20.8),
                        child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1223671392?b=1&k=6&m=1223671392&s=612x612&w=0&h=5VMcL3a_1Ni5rRHX0LkaA25lD_0vkhFsb1iVm1HKVSQ="),
                              ),
                              Column(children: [
                                SizedBox(
                                  height:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height *
                                      0.03,
                                ),
                                Text(
                                  "userName",
                                  style: GoogleFonts.lato(
                                      fontSize: 15.2,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width *
                                        0.5,
                                    child: Text(
                                      "View profile",
                                      style: GoogleFonts.lato(
                                          color: Colors.grey),
                                      textAlign: TextAlign.center,
                                    ))
                              ]),
                            ]),
                      ))),
            ),
          ),

          SizedBox(
            height: 25,
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text(
              "Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
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
          SizedBox(
            height: 2,
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text(
              "Payment options",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            leading: Icon(
              Icons.credit_card_outlined,
              color: Colors.grey[400],
            ),
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
          SizedBox(
            height: 2,
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text(
              "Transactions history",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            leading: Icon(
              Icons.monetization_on_outlined,
              color: Colors.grey[400],
            ),
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
          SizedBox(
            height: 25,
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text(
              "Help",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            leading: Icon(CupertinoIcons.info, color: Colors.blue),
            //subtitle: Text(message),
            dense: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17.0),
            ),
            onTap: () {
              _navigateToInfoPage(context);
            },
          ),
          SizedBox(
            height: 2,
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text(
              "Recommend to a friend",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            leading: Icon(CupertinoIcons.heart_fill, color: Colors.pink),
            //subtitle: Text(message),
            dense: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17.0),
            ),
            onTap: () {
              _recommendDialog(context);
            },
          ),
          SizedBox(
            height: 40,
          ),
          ListTile(
            //selected: true,
            tileColor: Colors.white,
            title: Text(
              "Sign out",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.blueAccent[400]),
            ),
            leading: Icon(
              Icons.logout,
              color: Colors.blueAccent[400],
            ),
            //subtitle: Text(message),
            dense: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17.0),
            ),
            onTap: () {
              _signOutDialog(context);
            },
          ),
          SizedBox(
            height: 40,
          ),
        ]),
      ),
    );
  }

  //);}}

  final String link = "https://www.whatsapp.com/";

  void _recommendDialog(BuildContext context) {
    Future<void> _copyLink() async {
      FlutterClipboard.copy(link);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 6.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: Text(
          'Copied!',
          style: TextStyle(color: Colors.white),
        ),
      ));
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: new Text(
                "Recommend to a friend and earn 10€ as soon as they spend 10€ on our app!"),
            //content: new Text("You are awesome!"),
            actions: <Widget>[
              new Container(
                margin: EdgeInsets.all(15),
                decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(link),
              ),
              new ElevatedButton(
                onPressed: _copyLink,
                child: Text(
                  "Copy",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          );
        });
  }

  void _signOutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: new Text("Log out?"),
            //content: new Text("You are awesome!"),
            actions: <Widget>[
              new FlatButton(
                child: new Text(
                  "No",
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new TextButton(
                child: new Text(
                  "Yes",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  _signOut().then((value) => Navigator.of(context).pop());
                },
              ),
            ],
          );
        });
  }


  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> _signOut() async {
    await _firebaseAuth.signOut();
  }

  void _navigateToProfilePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ProfilePage()));
  }

  void _navigateToInfoPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HelpPage()));
  }
}