import 'dart:ui';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/all_screens.dart';
import '../models/professionals_model.dart';
import '../widgets/all_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding_platform_interface/geocoding_platform_interface.dart';

class ProfessionalsScreen extends StatefulWidget {
  @override
  _ProfessionalsScreenState createState() => _ProfessionalsScreenState();
}

class _ProfessionalsScreenState extends State<ProfessionalsScreen> {
  // Page Controller
  final _pageController = PageController(viewportFraction: 0.877);
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
                  'Explore\nthe labor market',
                  style: GoogleFonts.playfairDisplay(
                      fontSize: 35, fontWeight: FontWeight.w700),
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
              Container(
                height: 30,
                margin: EdgeInsets.only(left: 14.4, top: 28.8),
                  child: DefaultTabController(
                    length: 2,
                    child: TabBar(
                        labelPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                        indicatorPadding:
                        EdgeInsets.only(left: 14.4, right: 14.4),
                        isScrollable: true,
                        labelColor: Color(0xFF000000),
                        unselectedLabelColor: Color(0xFF8a8a8a),
                        labelStyle: GoogleFonts.lato(
                            fontSize: 14, fontWeight: FontWeight.w700),
                        unselectedLabelStyle: GoogleFonts.lato(
                            fontSize: 14, fontWeight: FontWeight.w700),
                        indicator: RoundedRectangleTabIndicator(
                            color: Color(0xFF000000), weight: 2.4, width: 14.4),
                        tabs: [
                          Tab(
                            child: Container(
                              child: Text('Categories'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text('Recently reached'),
                            ),
                          ),
                        ]),
                  ),
              ),

              // ListView widget with PageView
              // Recommendations Section
              Container(
                height: 218.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    proRecommendations.length,
                        (int index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SelectedProfessionalsScreen(
                                proModel: proRecommendations[index])));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 28.8),
                        width: 333.6,
                        height: 218.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                proRecommendations[index].image),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 19.2,
                              left: 19.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.8),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaY: 19.2, sigmaX: 19.2),
                                  child: Container(
                                    height: 36,
                                    padding: EdgeInsets.only(
                                        left: 16.72, right: 14.4),
                                    alignment: Alignment.centerLeft,
                                    child:
                                        Text(
                                          proRecommendations[index].name,
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 16.8),
                                        )

                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 28.8, top: 28.8),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: proRecommendations.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: Color(0xFF8a8a8a),
                      dotColor: Color(0xFFababab),
                      dotHeight: 4.8,
                      dotWidth: 6,
                      spacing: 4.8),
                ),
              ),// Dots Indicator
              //Using SmoothPageIndicator Library


              // Text Widget for Popular Categories
              Center(child: TextButton(onPressed: (){},child: Text("See all >>", style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold ),)),),
              //SizedBox(height: MediaQuery.of(context).size.height*0.12,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    height: MediaQuery.of(context).size.height*0.15,
                    decoration: BoxDecoration( boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent[400].withOpacity(0.3),
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
                                Container(width: 85, height: 85,child: Image.network("https://cdn1.vectorstock.com/i/thumb-large/24/95/browse-job-logo-icon-design-vector-22742495.jpg", fit: BoxFit.cover,)),
                                Column(
                                    children: [
                                      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                                      Text(
                                        'Find a job !',
                                        style: GoogleFonts.lato(
                                            fontSize: 15.2,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.5,child: Text("Have a look at job offers or side hustles near you", style: GoogleFonts.lato(
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
      .push(MaterialPageRoute(builder: (context) => ConsumptionScreen()));
}
