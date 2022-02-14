import 'package:flutter/material.dart';


void main()
{
  Type runtimeType;
  runApp(HomePage(runtimeType));
}
class HomePage extends StatelessWidget
{
  HomePage(Type runtimeType);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
              'HOME',
            style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
          ),
          ),

        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,

    ),
    );
  }
}