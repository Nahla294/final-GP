// ignore_for_file: sdk_version_ui_as_code

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/layout/HomePage.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tflite/tflite.dart';

import '../../../main.dart';

import 'graphic_input.dart';


// import 'layout/HomePage.dart';
// import 'main.dart';
List<List<dynamic>> data=[];
bool isWorking = false;
int selectedColor=0;
String colorName = "";
String colorMeaning="";
CameraImage imgCamera ;
CameraController cameraController;



class liveHomepage extends StatefulWidget {
  @override

  State<liveHomepage> createState() => _liveHomepageState();
}

class _liveHomepageState extends State<liveHomepage> {


  loadModel() async{
    final mydata = await rootBundle.loadString("assets/colors.csv");

    data = CsvToListConverter(eol: "\n", fieldDelimiter: ",", shouldParseNumbers: true).convert(mydata).toList();

    await Tflite.loadModel(
     model:"assets/livecolors.tflite",
   labels:"assets/livecolors.txt"
    );

  }
  void closeCameraAndStream() async {
    if (cameraController.value.isStreamingImages) {
      await cameraController.stopImageStream();
    }
    await cameraController.dispose();

    setState(() {
      cameraController= null;
      //_scanResults = null;
    });
  }

   Function liveCamera() {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);

    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      };
      setState(() {
        // ignore: sdk_version_set_literal
        cameraController.startImageStream((imageFromStream) => {
          if (!isWorking)
          {
                  isWorking = true,
                  imgCamera = imageFromStream,
            detectColor()
                }

            });
      });
    });

  }

  detectColor()async {

    if(imgCamera!=null){
      var recognitions=await Tflite.runModelOnFrame(bytesList:imgCamera.planes.map((plane) {
        return plane.bytes;
      }).toList(),
    imageHeight: imgCamera.height,
    imageWidth: imgCamera.width,
    imageMean: 127.5,
    rotation: 90,
   numResults:1,
    threshold: 0.1,
    asynch:true,
      );
      colorName="";
      recognitions.forEach((response) {
      // colorName+=response["label"]+" "+(response["confidence"]as double).toStringAsFixed(2)+"\n\n";
        colorName+=response["label"];
      });
      setState(() {
        colorName;
      });

     setState(() {
       isWorking=false;
     });
      for (int i = 0; i < data.length; i++) {

        if (data[i][1]==colorName) {
          setState(() {
            colorMeaning=data[i][3];
            selectedColor=data[i][2];


          });

        }

      }
    }



  }

  @override
  void initState() {
    super.initState();
    loadModel();
    liveCamera();

  }
@override
  void dispose() async{
    await Tflite.close();
    cameraController?.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:SafeArea(
        child:Scaffold(

            appBar: AppBar(
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle( statusBarBrightness: Brightness.light,),
              backgroundColor: Color.fromRGBO(42,65,88, 1.0),
              title: Text('Live Camera',style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomRight:Radius.circular(10),bottomLeft:Radius.circular(10) ),
              ),
              leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      iconSize: 30,
                      onPressed: () {

    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
    return ImageInputScreen(title:"Live Camera",);
                        },));},
                      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                    );}),
              actions: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: IconButton(
                    onPressed: () {
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

          body:

          Column(

            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
             Expanded(
                child: Stack(
                  children:[Center(
                    child: Container(

                      height: MediaQuery.of(context).size.height * 0.9,
                      width: MediaQuery.of(context).size.width,
                      child: !cameraController.value.isInitialized
                          ? Container()
                          : AspectRatio(
                        aspectRatio: cameraController.value.aspectRatio,
                        child: CameraPreview(cameraController),
                      ),
                    ),

                     // ),
                     ),
                     Container(

                       alignment: Alignment.bottomCenter,
                     //margin:EdgeInsets.only(bottom:5.0),
                      child: SingleChildScrollView(

                        child:

                        Center(


                            child: Container(

                              constraints: BoxConstraints(
                                maxHeight:double.infinity
                              ),
                              width:double.infinity,
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),

                              child: Padding(

                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                  Center(
                                    child: Row(
                                mainAxisAlignment: MainAxisAlignment.center ,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                        Container(
                                            width: 35,
                                            height: 35,
                                            decoration: BoxDecoration(
                                             color:Color(selectedColor),
                                              borderRadius: BorderRadius.circular(12),
                                              border: Border.all(color: Colors.black),
                                            ),
                                          ),
                                       SizedBox(width:15,),
                                        Text(colorName
                                          ,style: TextStyle(fontSize:20.0,color:Colors.black87 ,fontWeight:FontWeight.bold),
                                          textAlign: TextAlign.center,),
                                      ],
                                    ),
                                  ),

                                    SizedBox(height:5,),

                                    Text(colorMeaning ,style: TextStyle(fontSize:17.5,color:Colors.black87 ),
                                      textAlign: TextAlign.center,)
                                  ],
                                ),



                              ),


                            ),



                        ),
                      ),
                     )

             ] ),
              ),


            ],

          )

        )
      )
    );

  }

}
