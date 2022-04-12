import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/layout/HomePage.dart';
import 'package:graduation_project/modules/detection_module/views/color_detection_screen.dart';
import 'package:graduation_project/modules/detection_module/widgets/build_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import '../../../main.dart';
import 'LiveCamera.dart';
final liveHomepage livecamera =new liveHomepage();

class ImageInputScreen extends StatefulWidget {
  final String title;
  const ImageInputScreen({@required this.title});

  @override
  State<ImageInputScreen> createState() => _ImageInputScreenState();
}
bool visible=false;

class _ImageInputScreenState extends State<ImageInputScreen> {
  bool imageSelected = false;
  File image;
  String errorMsg = "";

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      }
      final imageTemporary = File(image.path);

      setState(() {
        this.image = imageTemporary;
        imageSelected = true;
      });
    } on PlatformException catch (e) {
      errorMsg = e.toString();
      //  showErrorDialog(context, errorMsg);
    }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle( statusBarBrightness: Brightness.light,),
          automaticallyImplyLeading: false,
          title: Text(widget.title,style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,

          ),),
          backgroundColor:Color.fromRGBO(42,65,88, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight:Radius.circular(10),bottomLeft:Radius.circular(10) ),
          ),
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
      floatingActionButton: Visibility(
        visible: visible,
        child: FloatingActionButton.extended(
            backgroundColor: Color.fromRGBO(42,65,88, 1.0),
            heroTag: 'uniqueTag',
            label: Row(
              children: const [
                Text('Next  '),
                Icon(Icons.verified_outlined),
              ],
            ),
            onPressed: () {
              imageSelected
                  ? Navigator.push(context, MaterialPageRoute(builder: (context) {
                if (widget.title == 'Detect Color') {
                  return ColorDetectionScreen(image: image);
                }
              }))
                  : () {};
            }),
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 14),
                BuildButton(
                  title: 'Gallery',
                  icon: Icons.image_outlined,
                  onClicked: ()  {
                    pickImage(ImageSource.gallery);
                    visible=true;
                  }
                ),
                const SizedBox(height: 14),
                BuildButton(
                  title: 'Camera',
                  icon: Icons.camera_alt_outlined,
                  onClicked: () {
                    pickImage(ImageSource.camera);
                    visible=true;

                  }
                ),
                const SizedBox(height: 14),

                BuildButton(
                    title: '   Live   ',
                    icon: Icons.camera,
                    onClicked: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>liveHomepage(),
                      ),
                      );
                    },
                ),

                const SizedBox(height: 14),
                image != null ?
                Stack(
                  children: [
                    Image.file(
                      image,
                      width: double.infinity,
                      height: size.height * 0.5,
                    ),
                  ],
                )
                    :
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(),
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
