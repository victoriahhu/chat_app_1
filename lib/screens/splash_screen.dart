import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Center(child: CupertinoActivityIndicator(animating: true,),),);
  }
}
