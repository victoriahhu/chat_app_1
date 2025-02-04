import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/all_models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SelectedHotelScreen extends StatelessWidget {
  final _pageController = PageController();

  final HotelModel hotelModel;

  SelectedHotelScreen({Key key, @required this.hotelModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            // PageView for Image
            PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                hotelModel.images.length,
                    (int index) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          hotelModel.images[index]),
                    ),
                  ),
                ),
              ),
            ),

            // Custom Button
            SafeArea(
              child: Container(
                height: 57.6,
                margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 57.6,
                        width: 57.6,
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          color: Color(0x10000000),
                        ),
                        child:
                        SvgPicture.asset('assets/svg/icon_left_arrow.svg'),
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
                      child: SvgPicture.asset('assets/svg/icon_heart_fill.svg'),
                    )
                  ],
                ),
              ),
            ),

            // Content
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 346.8,
                margin: EdgeInsets.only(left: 28.8, bottom: 48, right: 28.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: hotelModel.images.length,
                      effect: ExpandingDotsEffect(
                          activeDotColor: Color(0xFFFFFFFF),
                          dotColor: Color(0xFFababab),
                          dotHeight: 4.8,
                          dotWidth: 6,
                          spacing: 4.8),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 19.2),
                      child: Text(
                        hotelModel.tagLine,
                        maxLines: 2,
                        style: GoogleFonts.playfairDisplay(
                            fontSize: 42.6,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 19.2),
                      child: Text(
                        hotelModel.description,
                        maxLines: 3,
                        style: GoogleFonts.lato(
                            fontSize: 19.2,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Start from',
                              style: GoogleFonts.lato(
                                  fontSize: 16.8,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              '\$ ${hotelModel.price.toString()} / person',
                              style: GoogleFonts.lato(
                                  fontSize: 21.6,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            height: 62.4,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.6),
                                color: Colors.white),
                            child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 28.8, right: 28.8),
                                  child: Text(
                                    'Book Now >>',
                                    style: GoogleFonts.lato(
                                        fontSize: 19.2,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),)))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
