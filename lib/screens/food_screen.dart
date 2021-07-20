import 'dart:ui';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/all_screens.dart';
import '../models/food_model.dart';
import '../models/restaurant_model.dart';
import '../widgets/all_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding_platform_interface/geocoding_platform_interface.dart';

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
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
                  ],
                ),
              ),

              // Text Widget for Title
              Padding(
                padding: EdgeInsets.only(top: 48, left: 28.8),
                child: Text(
                  'Order food & daily products',
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
                            child: Text('Products'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text('Frequently bought'),
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
                    foodRecommendations.length,
                        (int index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => foodRecommendations[index].pageRoute));
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
                                foodRecommendations[index].image),
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
                                        foodRecommendations[index].name,
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
                  count: foodRecommendations.length,
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
                            child: Text('Restaurants'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text('Frequently visited'),
                          ),
                        ),
                      ]),
                ),
              ),
              Container(
                height: 218.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    restaurantRecommendations.length,
                        (int index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => restaurantRecommendations[index].pageRoute));
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
                                restaurantRecommendations[index].image),
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
                                        restaurantRecommendations[index].name,
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
                  count: restaurantRecommendations.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: Color(0xFF8a8a8a),
                      dotColor: Color(0xFFababab),
                      dotHeight: 4.8,
                      dotWidth: 6,
                      spacing: 4.8),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.12,),
              Center(child: TextButton(onPressed: (){},child: Text("See all >>", style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold ),)),),
              //...
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
