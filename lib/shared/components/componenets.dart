import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/modules/colorMatch_module/colorsCsvFile.dart';
import 'package:graduation_project/modules/colorMatch_module/matched_colors.dart';

Widget Answer({
  //chatbot answer shape
  @required String message,
}) =>
    Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 55,
            width: 55,
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  "assets/images/robot1.png"),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Bubble(
                radius: Radius.circular(17.0),
                color: Color.fromRGBO(42,65,88, 0.9),
                elevation: 0.0,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 250),
                            child: Text(
                              message,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ))
                    ],
                  ),
                )),
          ),
        ],
      ),
    );

Widget send({
  @required String message,
  @required Function function,
}) =>
    Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Bubble(
                radius: Radius.circular(17.0),
                color: Color.fromRGBO(112, 128, 144, 1.0),
                elevation: 0.0,
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 250),
                            child: Container(
                              height: 28.0,
                              child: MaterialButton(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 2.0),
                                  onPressed: function,
                                  child: Text(
                                    message,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )),
                            ),
                          ))
                    ],
                  ),
                )),
          ),
          Container(
            height: 55,
            width: 55,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/u6.jpeg"),
            ),
          ),
        ],
      ),
    );

Widget about({
  //about shape
  String data,
  double result,
  double text_size,
}) =>
    Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 80.0,
          horizontal: 40.0,
        ),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Text(
                    '${data}',
                    style: TextStyle(
                      fontSize: text_size,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius:2,
                blurRadius:2,
                offset: Offset(4,5),

              ),
            ],
            borderRadius: BorderRadius.circular(40.0),

          ),
        ),
      ),
    );
// buttons for test

Widget AnswerButton({
  double width = double.infinity,
  Color background = Colors.grey,
  Function function,
  String text,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: () {
          function;
        },
        child: Text(
          text,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          30.0,
        ),
        color: background,
      ),
    );

Widget ShowResultButton({
  Function function,
}) =>
    Container(
      width: 150.0,
      height: 50.0,
      child: MaterialButton(
        onPressed: () {
          function;
        },
        child: Text(
          'Show Result',
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        color: Colors.grey,
      ),
    );

Widget buildReport(
    String image,
    String textAnswer,
    String textNormal,
    String textBlind,
    ) =>
    Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(color: Colors.grey[300],
                width: 10),
            image:
            DecorationImage(
              //scale: 0.1,
              fit: BoxFit.cover,
              image: AssetImage(
                image,
                //questions[index].image,
              ),
              //fit: BoxFit.cover,
            ),
          ),
        ),
        // const SizedBox(
        //   width: 10.0,
        // ),

        Expanded(
          child: Container(

            height: 110.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  child: Text(
                    textAnswer,
                    //'Your answer : ' + ans[index],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    textNormal,
                    //'Normal view : ' +
                    //    questions[index].answer.keys.firstWhere(
                    //        (k) =>
                    //            questions[index].answer[k].toString() == 'true',
                    //        orElse: () => null),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                    maxLines: 3,
                  ),
                ),
                Expanded(
                  child: Text(
                    textBlind,
                    //'Color blindness : ' + questions[index].colorBlind,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

Widget DividerReport() => Padding(
  padding: const EdgeInsets.all(10.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
//////////////////////////////////    //////////////////////////////////////
var colorName;
bool visibleMatchedButton = true;
Widget colorList(
    List model,
    context,
    ) =>

    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          width:double.infinity,
          ///////////////Hight el container bta3 el matching//////////////////////////////
          height: 105,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey[300]),
          child: Row(
            children: [
              ///////////////////////////////Circle avatar el color////////////////////////////////
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: CircleAvatar(
                  backgroundColor: Color(model[2]),
                  radius: 42.0,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${model[1]}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                      Text(
                        '${model[3]}',
                        maxLines: 4,
                        //overflow: TextOverflow.ellipsis,
                      ),
                    ]),
              ),


              Padding(
                padding: const EdgeInsets.only(right: 10.0, bottom: 15),
                child: Visibility(
                  visible: visibleMatchedButton,
                  child: Padding(
                    padding: const EdgeInsets.only(right:1.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:(context)=> matched_colors(),
                              ),
                            );

                            colorName = model[1];
                            for (int i = 0; i < data.length; i++) {
                              if (data[i][0] == colorName) {
                                matched.insert(0, data[i]);

                                visibleMatchedButton = false;
                              }

                            }
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 45,
                            color: Color.fromRGBO(42,65,88, 1.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),],
          ),
        ),
      ),
    );


Widget CardMenu({
  @required String title,
  @required String icon,
  Function onTap,
  Color fontColor = Colors.black,
  Color color ,
  //Color color ,
})=>
    GestureDetector(
      onTap: onTap,
      child: Container(

        width: 175,
        height:165,
        decoration: BoxDecoration(
          color: color= Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius:2,
              blurRadius:2,
              offset: Offset(4,5),

            ),
          ],
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,),
              child:
              Image.asset(icon,width: 65,height:65 ,),
            ),

            Text(title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
                //fontFamily: 'valera',
                color: fontColor,
              ),
            ),

          ],

        ),
      ),

    );
