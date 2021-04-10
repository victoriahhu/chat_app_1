import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/all_models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SelectedRestaurantScreen extends StatelessWidget {
  final _pageController = PageController();

  final RestaurantModel restaurantModel;

  SelectedRestaurantScreen({Key key, @required this.restaurantModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}