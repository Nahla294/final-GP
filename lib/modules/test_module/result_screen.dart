import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/layout/HomePage.dart';
import 'package:graduation_project/modules/test_module/report_screen.dart';

// ignore: must_be_immutable
//
class ResultScreen extends StatefulWidget {
  final int score;
  // ignore: deprecated_member_use
  List ans = List(38);
  ResultScreen(this.score, this.ans, {Key key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int finalScore = 0;
  @override
  Widget build(BuildContext context) {
    finalScore = ((widget.score / 38) * 100).toInt();
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle( statusBarBrightness: Brightness.light,),
          automaticallyImplyLeading: false,
          title: Text('Test Result',style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,

          ),),
          backgroundColor: Color.fromRGBO(42,65,88, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight:Radius.circular(10),bottomLeft:Radius.circular(10) ),
          ),


          ////////////////////////////HOME BUTTON/////////////////////////////
          actions: [
            IconButton(
              color: Colors.white,
              iconSize: 35,
              icon: const Icon(Icons.home_rounded),
              onPressed: () {
                // ignore: prefer_typing_uninitialized_variables
                var widget;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'The result.....',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              CircleAvatar(
                backgroundColor: Color.fromRGBO(42,65,88, 1.0),
                radius: 80.0,
                child: Text(
                  ' ' "$finalScore" "%",
                  style: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              finalScore == 100
                  ? const Text(
                      "You don't have any type of color blindness",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    )
                  : const Text(
                      "You have a type of color blindness",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
              const SizedBox(
                height: 80.0,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                width: 300,
                height: 60,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Color.fromRGBO(42,65,88, 1.0),
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ReportScreen(widget.score, widget.ans),
                      ),
                    );
                  },
                  child: const Text(
                    'Recap your answer',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
