import 'package:flutter/material.dart';
import 'package:graduation_project/shared/components/componenets.dart';
import 'colorsCsvFile.dart';

var controller=ScrollController();
class basic_colors extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return ListView.separated(

        controller:controller,
        itemBuilder: (context, int index) => colorList(basic_data[index],context),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount:basic_data.length);
  }
}