// ignore_for_file: sdk_version_ui_as_code

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/layout/HomePage.dart';
import 'package:graduation_project/modules/colorMatch_module/colorsCsvFile.dart';
import 'package:graduation_project/modules/colorMatch_module/matched_colors.dart';
import 'package:graduation_project/shared/components/componenets.dart';
import 'package:tflite/tflite.dart';
import '../../../main.dart';
import 'graphic_input.dart';

// import 'layout/HomePage.dart';
// import 'main.dart';
List<List<dynamic>> data = [];
bool isWorking = false;
int selectedColor = 0;
String color_name = "";
String colorMeaning = "";
CameraImage imgCamera;
CameraController cameraController;
//var color_name;

class liveHomepage extends StatefulWidget {
  @override
  State<liveHomepage> createState() => _liveHomepageState();
}

class _liveHomepageState extends State<liveHomepage> {
  loadModel() async {
    final mydata = await rootBundle.loadString("assets/colors.csv");

    data = CsvToListConverter(
            eol: "\n", fieldDelimiter: ",", shouldParseNumbers: true)
        .convert(mydata)
        .toList();

    await Tflite.loadModel(
        model: "assets/livecolors.tflite", labels: "assets/livecolors.txt");
  }

  Function liveCamera() {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);

    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      ;
      try {
        setState(() {
          // ignore: sdk_version_set_literal
          cameraController.startImageStream((imageFromStream) => {
                if (!isWorking)
                  {isWorking = true, imgCamera = imageFromStream, detectColor()}
              });
        });
      } catch (e) {
        print('another error');
      }
    });
  }

  detectColor() async {
    if (imgCamera != null) {
      try {
        var recognitions = await Tflite.runModelOnFrame(
          bytesList: imgCamera.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: imgCamera.height,
          imageWidth: imgCamera.width,
          imageMean: 127.5,
          rotation: 90,
          numResults: 1,
          threshold: 0.1,
          asynch: true,
        );
        color_name = "";
        recognitions.forEach((response) {
          // colorName+=response["label"]+" "+(response["confidence"]as double).toStringAsFixed(2)+"\n\n";
          color_name += response["label"];
        });
        setState(() {
          color_name;
        });

        setState(() {
          isWorking = false;
        });
        for (int i = 0; i < data.length; i++) {
          if (data[i][1] == color_name) {
            setState(() {
              colorMeaning = data[i][3];
              selectedColor = data[i][2];
            });
          }
        }
      } catch (e) {
        print('error i guess');
      }
    }
  }

  @override
  void initState() {
    isWorking = false;
    loadModel();
    liveCamera();
    super.initState();
  }

@override
  void dispose(){
    cameraController?.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.light,
                  ),
                  backgroundColor: Color.fromRGBO(42, 65, 88, 1.0),
                  title: Text(
                    'Live Camera',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  leading: Builder(builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      iconSize: 30,
                      onPressed: () {
                        cameraController?.dispose();
                        super.dispose();
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ImageInputScreen(
                              title: "Detect Color",
                            );
                          },
                        ));
                      },
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    );
                  }),
                  actions: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: IconButton(
                        onPressed: () {
                          cameraController?.dispose();
                          super.dispose();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.home_rounded),
                        color: Colors.white,
                        iconSize: 35,
                      ),
                    ),
                  ],
                ),
                body: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Stack(children: [
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.9,
                            width: MediaQuery.of(context).size.width,
                            child: !cameraController.value.isInitialized
                                ? Container()
                                : AspectRatio(
                                    aspectRatio:
                                        cameraController.value.aspectRatio,
                                    child: CameraPreview(cameraController),
                                  ),
                          ),

                          // ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          //margin:EdgeInsets.only(bottom:5.0),
                          child: SingleChildScrollView(
                            child: Center(
                              child: Container(
                                constraints:
                                    BoxConstraints(maxHeight: double.infinity),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Color(selectedColor),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                color_name,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        colorMeaning,
                                        style: TextStyle(
                                          fontSize: 17.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            color: Colors.black,
                                            iconSize: 35,
                                            icon: const Icon(Icons.color_lens_rounded),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:(context)=> matched_colors(),
                                                ),
                                              );
                                              colorName = color_name;
                                              for (int i = 0; i < data.length; i++) {
                                                if (data[i][0] == colorName) {
                                                  matched.insert(0, data[i]);
                                                  visibleMatchedButton = false;

                                                }

                                              }
                                            },
                                          ),
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                ))));
  }
}
