import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graduation_project/layout/HomePage.dart';

class SplashScreen extends StatefulWidget{
  @override

  State<SplashScreen> createState() => _SplashScreen();

}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                HomePage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Container(


        width:double.infinity,
        height:double.infinity,
        decoration: BoxDecoration(

         //   color: Colors.red,
            image: DecorationImage(
                image: AssetImage('assets/home_images/fgp.gif'),
              //fit:BoxFit.cover,
            )
        ),




      ),
    );
  }
}