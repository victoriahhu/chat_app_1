import 'dart:ui';
import 'dart:async';
import '../screens/all_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding_platform_interface/geocoding_platform_interface.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  // Page Controller
  Position _currentPosition;
  String _currentAddress;
  void initState() {
    Timer(
        Duration(seconds: 1),// you can do your stuff here when splash screen run

            () => _getCurrentLocation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              // Custom Navigation Drawer and Search Button
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
                          _navigateToConsumptionScreen(context);
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
                    )
                  ],
                ),
              ),

              // Text Widget for Title
              Padding(
                padding: EdgeInsets.only(top: 48, left: 28.8),
                child: Text(
                  'Events and Annoncements in your area ',
                  style: GoogleFonts.playfairDisplay(
                      fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 13, left: 28.8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/svg/icon_location.svg', color: Colors.blueAccent, height: 18,),
                      SizedBox(width: 11,),
                      Text(
                        ' in ${_currentAddress==null?"... loading location":_currentAddress}',
                        style: GoogleFonts.lato(
                            fontSize: 14, fontWeight: FontWeight.w700, color: Colors.grey[600]),
                      ),]
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    height: MediaQuery.of(context).size.height*0.075,
                    decoration: BoxDecoration( boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey[400].withOpacity(0.3),
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
                                Expanded(child: Icon(CupertinoIcons.volume_down)),
                                Text("Want to make an announcement?")]
                          ),))),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    height: MediaQuery.of(context).size.height*0.15,
                    decoration: BoxDecoration( boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent[400].withOpacity(0.3),
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
                                Container(width: 85, height: 85,child: Image.network("https://hirefortalent.ca/images/core/covid-19_tool/icon-tool-112x.png", fit: BoxFit.cover,)),
                                Column(
                                    children: [
                                      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                                      Text(
                                        'New covid-19 restrictions',
                                        style: GoogleFonts.lato(
                                            fontSize: 15.2,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.5,child: Text("Reunions of 5 people maximum and indoor gyms closed until further notice", style: GoogleFonts.lato(
                                          color: Colors.grey[800]), overflow: TextOverflow.ellipsis, maxLines: 3, textAlign: TextAlign.center,))]
                                ),]
                          ),))),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0,left: 20.0,right: 20.0, top: 10),
                child: Container(
                    height: MediaQuery.of(context).size.height*0.15,
                    decoration: BoxDecoration( boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
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
                                Container(width: 44, height: 44,child: Image.network("https://media.istockphoto.com/vectors/megaphone-circle-icon-with-long-shadow-flat-design-style-vector-id870898802?k=6&m=870898802&s=170667a&w=0&h=l6Tk8rAra911Q3M_mp2hpsTbChD6JCgZZbOSLYnu5Hg=", fit: BoxFit.cover,)),
                                Column(
                                    children: [
                                      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                                      Text(
                                        'Post a new job offer !',
                                        style: GoogleFonts.lato(
                                            fontSize: 15.2,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.5,child: Text("Let people contact you to accept the mission", style: GoogleFonts.lato(
                                          color: Colors.grey[800]), overflow: TextOverflow.ellipsis, maxLines: 3, textAlign: TextAlign.center,))]
                                ),]
                          ),))),
              ),

            ],
          ),
        ),
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude,
          _currentPosition.longitude
      );

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.administrativeArea} ";
      });
    } catch (e) {
      print(e);
    }
  }



}

void _navigateToConsumptionScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ForYouPage()));
}
