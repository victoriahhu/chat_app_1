import 'package:flutter/material.dart';
import '../screens/all_screens.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationsTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: () {
          _navigateToNextScreen(context);
        },
        child: Container(
          //padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height*0.2,
            decoration: BoxDecoration( boxShadow: [
              BoxShadow(
                color: Colors.grey[400].withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
                borderRadius: BorderRadius.circular(23),
                color: Colors.blue[100],
            ),
            child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.8, right: 20.8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(Firestore.instance
                              .collection("users").document("image_url").toString()),
                        ),
                        Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                              Text(
                                'Conversation 1',
                                style: GoogleFonts.lato(
                                    fontSize: 15.2,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.5,child: Text("Message", style: GoogleFonts.lato(
                                  color: Colors.grey[800]), overflow: TextOverflow.ellipsis, maxLines: 3, textAlign: TextAlign.center,))]
                        ),]
                  ),))),
      ),
    );
  }
}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreen()));
}
