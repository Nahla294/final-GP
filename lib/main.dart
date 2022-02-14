import 'package:flutter/material.dart';
import 'package:graduation_project/modules/about_module/About.dart';
import 'package:graduation_project/modules/chatbot_module/ChatBot.dart';
import 'package:graduation_project/modules/colorMatch_module/colorsCsvFile.dart';

import 'modules/colorMatch_module/matched_colors.dart';
import 'modules/test_module/test_screen.dart';

void main() {
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
      home:colorsCsvFile(),
    );
  }
}
