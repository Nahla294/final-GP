import 'package:flutter/material.dart';
import 'package:graduation_project/shared/components/componenets.dart';
import 'colorsCsvFile.dart';



class matched_colors extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title: Text('$colorName'),
            leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back_sharp),
                    onPressed: () {
                      visibleMatchedButton=true;
                      matched.clear();
                      Navigator.pop(context);},
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );})),

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