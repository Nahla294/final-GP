import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/modules/about_module/About.dart';
import 'package:graduation_project/modules/chatbot_module/ChatBot.dart';
import 'package:graduation_project/modules/colorMatch_module/colorsCsvFile.dart';
import 'package:graduation_project/modules/test_module/test_screen.dart';
import 'package:graduation_project/shared/components/componenets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Color.fromRGBO(42,65,88, 1.0),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle( statusBarBrightness: Brightness.light,),
          automaticallyImplyLeading: false,
          backgroundColor:Color.fromRGBO(42,65,88, 1.0),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,),
            child: Text('Color Harmony',style: TextStyle(
              fontSize: 25,
              fontWeight:FontWeight.bold,
              color:Colors.white,

            ),),
          ),
          centerTitle: true,
          elevation: 0,


        ),
      ),
      body: Container(
        height: 800,
        width: double.infinity,
        decoration: BoxDecoration(
            color:Colors.white ,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
        ),
        padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 35.0,
              ),
              child: Text('Main Menu ',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardMenu(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>TestScreen(),
                    ),
                    );
                  },
                  title: 'Test',
                  icon: 'assets/home_images/Eye Outline With Spiral Center free vector icons designed by Freepik.png',

                ),
                CardMenu(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>colorsCsvFile(),
                      ),
                      );
                    },
                    title: 'Color Match',
                    icon: 'assets/home_images/color2.png')

              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 25.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardMenu(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>About(),
                      ),
                      );
                    },
                    title: 'About us',
                    icon: 'assets/home_images/i 10.53.49 PM.png',
                  ),

                  CardMenu(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>ChatBot(),
                        ),
                        );
                      },
                      title: 'ChatBot',
                      icon: 'assets/home_images/chatbot.png',
                  ),

                ],
              ),
            ),

            GestureDetector(
              onTap: (){

              },
              child: Container(

                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius:2,
                      blurRadius:2,
                      offset: Offset(4,5),

                    ),
                  ],

                  borderRadius: BorderRadius.circular(30.0),

                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20.0,
                    ),
                   Image.asset('assets/home_images/a4.png',width: 55,height: 55,),
                    const SizedBox(
                      width: 40.0,
                    ),
                    Text('Color Detection',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        //fontFamily: 'valera',
                        ),
                    ),

                  ],

                ),
              ),
            ),
          ],
        ),
      ),

    );


  }
}