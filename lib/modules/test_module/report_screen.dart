import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/layout/HomePage.dart';
import 'package:graduation_project/models/test_data_list.dart';
import 'package:graduation_project/modules/test_module/result_screen.dart';
import 'package:graduation_project/shared/components/componenets.dart';

// ignore: must_be_immutable
class ReportScreen extends StatefulWidget {
  final int score;
  // ignore: deprecated_member_use
  List ans = List(38);
  ReportScreen(this.score, this.ans, {Key key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle( statusBarBrightness: Brightness.light,),
          backgroundColor:Color.fromRGBO(42,65,88, 1.0),
          title: Text('Test Report',style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,

          ),),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight:Radius.circular(10),bottomLeft:Radius.circular(10) ),
          ),

          leading: IconButton(
            icon: Icon( Icons.arrow_back_ios),
            color: Colors.white,
            iconSize: 30,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(widget.score, widget.ans),
                ),
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                color: Colors.white,
                iconSize: 35,
                icon: const Icon(Icons.home_rounded),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: ConditionalBuilder(
        condition: true,
        builder: (context) => ListView.separated(
          itemCount: questions.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: buildReport(
                questions[index].image,
                'Your answer : ' + widget.ans[index],
                'Normal view : ' +
                    questions[index].answer.keys.firstWhere(
                        (k) => questions[index].answer[k].toString() == 'true',
                        orElse: () => null),
                'Color blindness : ' + questions[index].colorBlind,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[300]),
            ),
          ),
          separatorBuilder: (context, index) => DividerReport(),
        ),
        fallback: (context) => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
