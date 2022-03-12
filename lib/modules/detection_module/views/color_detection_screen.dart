import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/layout/HomePage.dart';
import 'package:graduation_project/modules/detection_module/helper/color_converter.dart';
import 'package:graduation_project/modules/detection_module/views/graphic_input.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_pixels/image_pixels.dart';
import 'dart:io';
import '../widgets/dropper.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
var color_name;
var color_meaning;
List<List<dynamic>> data=[];
List<List<dynamic>> data1=[];
List<List<dynamic>> data2=[];
List<List<dynamic>> data3=[];
class ColorDetectionScreen extends StatefulWidget {
  File image;
  ColorDetectionScreen({Key key, @required this.image}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ColorDetectionScreenState();

  }
}

class _ColorDetectionScreenState extends State<ColorDetectionScreen> {

  final picker = ImagePicker();
  Positioned dropper = Positioned(
    child: Container(width: 0.0, height: 0.0),
  );
  Color currentSelection;
  String colorHex;
  bool colorSelected = false;

  void _screenTouched(dynamic details, ImgDetails img, RenderBox box) {
    double widgetScale = box.size.width / img.width;
    final Offset localOffset = box.globalToLocal(details.globalPosition);
    var x = (localOffset.dx / widgetScale).round();
    var y = (localOffset.dy / widgetScale).round();
    bool flippedX = box.size.width - localOffset.dx < Dropper.totalWidth;
    bool flippedY = localOffset.dy < Dropper.totalHeight;
    if (box.size.height - localOffset.dy > 0 && localOffset.dy > 0) {
      currentSelection = img.pixelColorAt(x, y);
      colorHex = colourToHex(currentSelection.toString());
      colorSelected = true;
      setState(() {
        _createDropper(localOffset.dx, box.size.height - localOffset.dy,
            img.pixelColorAt(x, y), flippedX, flippedY);
      });
    }
    if (colorSelected) {
      //("Image value: $widget.image");
      if (currentSelection != null && widget.image != null) {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                color: const Color(0xFF737373),
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: currentSelection,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.black),
                              ),
                            ),
/*                                    Text(
                                      "#$colorHex",
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),*/
                          ],
                        ),
/*                        Text("R: " +
                            colourToRGB(colorHex).substring(0, 3) +
                            ",  G: " +
                            colourToRGB(colorHex).substring(3, 6) +
                            ",  B: " +
                            colourToRGB(colorHex).substring(6, 9),
                            style:
                            TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,

                            )


                        ),*/
                        Text('Color: ${color_name}',
                            style:
                            TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,

                            )),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text('Color meaning: ${color_meaning}',
                              style:
                              TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,

                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
        var hex= colorHex;
        LoadAsset(hex);
      }
    } else {}
  }

  void _createDropper(
      left, bottom, Color colour, bool flippedX, bool flippedY) {
    dropper = Positioned(
      left: left,
      bottom: bottom,
      child: Dropper(colour, flippedX, flippedY, 'color'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle( statusBarBrightness: Brightness.light,),
          //automaticallyImplyLeading: false,
          title: Text('Color selection',style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,

          ),),
          backgroundColor:Color.fromRGBO(42,65,88, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight:Radius.circular(10),bottomLeft:Radius.circular(10) ),
          ),
          leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);},
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );}),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                color: Colors.white,
                iconSize: 35,
                icon: const Icon(Icons.home_rounded),
                onPressed: () {
                  setState(() {
                    visible=false;
                  });
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
      body: Center(
        child: Stack(
          children: <Widget>[
            ImagePixels(
                imageProvider: FileImage(widget.image),
                builder: (BuildContext context, ImgDetails img) {
                  return GestureDetector(
                    child: Image.file(widget.image),
                    onPanUpdate: (DragUpdateDetails details) {
                      _screenTouched(details, img,
                          context.findRenderObject() as RenderBox);
                    },
                    onTapDown: (TapDownDetails details) {
                      _screenTouched(details, img,
                          context.findRenderObject() as RenderBox);
                    },
                  );
                }),
            dropper
          ],
        ),
      ),
    );
  }
}
LoadAsset(var hex) async {
  final mydata1 = await rootBundle.loadString("assets/detect1.csv");
  final mydata2=await rootBundle.loadString("assets/detect2.csv");
  final mydata3=await rootBundle.loadString("assets/detect3.csv");
  final mydata = await rootBundle.loadString("assets/colors.csv");

  data1 = CsvToListConverter(eol: "\n", fieldDelimiter: ",", shouldParseNumbers: true).convert(mydata1).toList();
  data2 = CsvToListConverter(eol: "\n", fieldDelimiter: ",", shouldParseNumbers: true).convert(mydata2).toList();
  data3 = CsvToListConverter(eol: "\n", fieldDelimiter: ",", shouldParseNumbers: true).convert(mydata3).toList();
  data = CsvToListConverter(eol: "\n", fieldDelimiter: ",", shouldParseNumbers: true).convert(mydata).toList();
  for (int i = 0; i < data1.length; i++) {
    if (data1[i][0]==hex) {
      //print(data1[i][1]);
      color_name=data1[i][1];

    }
    data1[i][0]==hex
    ?
    color_name=data1[i][1]
        :
    color_name='color name not found';

  }
/*  for (int i = 0; i < data2.length; i++) {
    if (data2[i][0]==hex) {
      //print(data2[i][1]);
      color_name=data2[i][1];

    }
  }
  for (int i = 0; i < data3.length; i++) {
    if (data3[i][0]==hex) {
      //print(data3[i][1]);
      color_name=data3[i][1];

    }

  }*/
  for (int i = 0; i < data.length; i++) {
    data[i][1]==color_name
    ?
      color_meaning=data[i][3]
    :
        color_meaning='No color meaning available';


  }

}



