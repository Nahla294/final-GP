import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/layout/HomePage.dart';
import 'package:graduation_project/models/test_data_list.dart';
import 'package:graduation_project/modules/test_module/result_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<TestScreen> {
  // ignore: prefer_final_fields
  PageController _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Color.fromRGBO(42,65,88, 1.0);
  Color isWrong = Color.fromRGBO(112, 128, 144, 1.0);
  int score = 0;
  // ignore: deprecated_member_use
  List ans = List(38);
  int count = 0;
  // ignore: non_constant_identifier_names
  bool Arrowshow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle( statusBarBrightness: Brightness.light,),
          automaticallyImplyLeading: false,
          title: Text('ColorBlindness Test',style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,

          ),),
          backgroundColor:Color.fromRGBO(42,65,88, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight:Radius.circular(10),bottomLeft:Radius.circular(10) ),
          ),

          ////////////////////////////HOME BUTTON/////////////////////////////
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
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text(
                      questions[index].question,
                      style: const TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Image(
                    width: 233.0,
                    height: 233.0,
                    image: AssetImage(
                      questions[index].image,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: Arrowshow,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                          ),
                          iconSize: 50.0,
                          color: Colors.black,
                          onPressed: isPressed
                              ? index + 1 == questions.length
                                  ? () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ResultScreen(score, ans),
                                        ),
                                      );
                                    }
                                  : () {
                                      if (index + 1 == questions.length - 1) {
                                        Arrowshow = false;
                                      }
                                      _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.linear);
                                    }
                              : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: !Arrowshow,
                    child: const SizedBox(
                      height: 60,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < questions[index].answer.length; i++)
                        // ignore: sized_box_for_whitespace
                        Container(
                          width: 350.0,
                          margin: const EdgeInsets.only(bottom: 18.0),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            color: isPressed
                                ? questions[index]
                                        .answer
                                        .entries
                                        .toList()[i]
                                        .value
                                    ? isTrue
                                    : isWrong
                                : Color.fromRGBO(112, 128, 144, 1.0),
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            onPressed: isPressed
                                ? () {}
                                : () {
                                    setState(() {
                                      isPressed = true;
                                    });
                                    if (questions[index]
                                        .answer
                                        .entries
                                        .toList()[i]
                                        .value) {
                                      score++;

                                      ans[count] = questions[index]
                                          .answer
                                          .entries
                                          .toList()[i]
                                          .key;
                                      count++;
                                      //ignore: avoid_print
                                      print(ans);
                                      //ignore: avoid_print
                                      print(score);
                                    } else {
                                      //ignore: avoid_print

                                      ans[count] = questions[index]
                                          .answer
                                          .entries
                                          .toList()[i]
                                          .key;
                                      count++;
                                      // ignore: avoid_print
                                      print(ans);
                                    }
                                  },
                            child: Text(
                              questions[index].answer.keys.toList()[i],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Visibility(
                    visible: !Arrowshow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            width: 180,
                            height: 45,
                            child: MaterialButton(
                              elevation: 0.0,
                              color: Colors.white70,
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
                                        ResultScreen(score, ans),
                                  ),
                                );
                              },
                              child: const Text(
                                'Show result',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
