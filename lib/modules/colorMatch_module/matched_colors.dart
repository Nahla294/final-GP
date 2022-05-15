import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/layout/HomePage.dart';
import 'package:graduation_project/shared/components/componenets.dart';
import 'colorsCsvFile.dart';

class matched_colors extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:PreferredSize(
          preferredSize:Size.fromHeight(60) ,

          child: AppBar(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle( statusBarBrightness: Brightness.light,),
              backgroundColor: Color.fromRGBO(42,65,88, 1.0),
              title: Text('$colorName',style: TextStyle(
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
                        visibleMatchedButton=true;
                        matched.clear();
                        Navigator.pop(context);},
                      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                    );}),
          ),

        ),

        body:ListView.separated(


            itemBuilder: (context, int index,) => colorList(matched[index],context),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(start: 20.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            itemCount:matched.length));
  }
}