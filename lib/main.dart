import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/layout/HomePage.dart';
import 'package:graduation_project/layout/splashscreen.dart';
import 'package:graduation_project/modules/about_module/About.dart';
import 'package:graduation_project/modules/chatbot_module/ChatBot.dart';
import 'package:graduation_project/modules/colorMatch_module/colorsCsvFile.dart';
import 'package:graduation_project/modules/detection_module/views/LiveCamera.dart';

import 'modules/test_module/test_screen.dart';

List<CameraDescription> cameras;


Future<Null> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //throw UnimplementedError();
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        // This is the theme of your application.
        //primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}
