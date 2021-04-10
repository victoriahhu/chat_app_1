import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({
    Key key,
    @required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) => ListView(
    padding: EdgeInsets.all(16),
    controller: scrollController,
    children: [
      SizedBox(height: 20,),
      Text(
        'Full Name',style: GoogleFonts.lato(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Container(
        height: 100,
        width: MediaQuery.of(context).size.width*0.8,
        child: Image.network(''),
      ),
      SizedBox(height: 40,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Profession: ", style: GoogleFonts.lato(),),
          Text(
            "Status: ", style: GoogleFonts.lato(),),
        Text("Age: ", style: GoogleFonts.lato(),),]
      ),
      SizedBox(height: 40,),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Workplace: ", style: GoogleFonts.lato(),),
            Text(
            "Contacts: ", style: GoogleFonts.lato(),),
            ]
      ),
      SizedBox(height: 40,),
      Text(
        'Description',style: GoogleFonts.lato(fontWeight: FontWeight.bold, color: Colors.grey),
        textAlign: TextAlign.center,
      ),
    ],
  );
}