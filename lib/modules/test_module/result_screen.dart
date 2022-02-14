import 'package:flutter/material.dart';
import 'package:graduation_project/layout/HomePage.dart';
import 'package:graduation_project/modules/test_module/report_screen.dart';

// ignore: must_be_immutable
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        shadowColor: Colors.transparent,

        ////////////////////////////HOME BUTTON/////////////////////////////
        actions: [
          IconButton(
            color: Colors.blueGrey,
            iconSize: 40,
            icon: const Icon(Icons.home),
            onPressed: (){
              // ignore: prefer_typing_uninitialized_variables
              var widget;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(widget.runtimeType),
                ),
              );
            },
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'The Result..',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 80.0,
                child: Text(
                  ' '"$finalScore" "%",
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
              const Text(
                "You have a type of color blindness",
                style: TextStyle(
                  fontSize: 25.0,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              Container(
                width: 300,
                height: 60,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.blueGrey, width: 2),),
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReportScreen(widget.ans),
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
