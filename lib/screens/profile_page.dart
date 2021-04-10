import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../screens/all_screens.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/all_widgets.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SlidingUpPanel(
          borderRadius: BorderRadius.circular(10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),],
          minHeight: MediaQuery.of(context).size.height*0.12,
      maxHeight: MediaQuery.of(context).size.height,
      panelBuilder: (scrollController) =>
          buildSlidingPanel(scrollController: scrollController),
      body: SafeArea(
          child: Container(
              child:
                  ListView(physics: BouncingScrollPhysics(), children: <Widget>[
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
                    _navigateToProfileScreen(context);
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
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://www.searchpng.com/wp-content/uploads/2019/02/Profile-ICon.png"),
                  fit: BoxFit.cover)),
        )
      ]))),
    ));
  }
  Widget buildSlidingPanel({
    @required ScrollController scrollController,
  }) =>
      DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: BuildTabBar(),
              body: TabBarView(children: [
                TabWidget(
                  scrollController: scrollController,
                ),
                TabWidget(
                  scrollController: scrollController,
                )
              ])));

  Widget BuildTabBar()=> AppBar(backgroundColor: Colors.white,automaticallyImplyLeading: false, title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        width: 30,
        height: 5,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(12.0))
        ),
      ),
    ],
  ),
  bottom: TabBar(tabs: [Tab(child: Text("General"),), Tab(child: Text("Background"),)],),);
}

void _navigateToProfileScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ProfileScreen()));
}

