import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/modules/colorMatch_module/basic_colors.dart';

List<List<dynamic>> data=[];
List<List<dynamic>> matched=[];
List<List<dynamic>> basic_data=[];
class colorsCsvFile extends StatefulWidget {

  @override
  _colorsCsvFileState createState() => _colorsCsvFileState();
}

class _colorsCsvFileState extends State<colorsCsvFile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadAsset();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold( appBar:AppBar(
      title: Text('Colors'),
    ) ,
      body:basic_colors() ,
      floatingActionButton:FloatingActionButton(

        child:Icon(Icons.arrow_upward_rounded),mini: true,
        onPressed: (){
          controller.animateTo(0.0,curve: Curves.easeInOut,duration:Duration(seconds: 1));
        },
      ),
    ) ;

  }
  LoadAsset() async {
    final mydata = await rootBundle.loadString("assets/colors.csv");

    data = CsvToListConverter(eol: "\n", fieldDelimiter: ",", shouldParseNumbers: true).convert(mydata).toList();
    for (int i = 0; i < data.length; i++) {
      if (data[i][0] == 'basic') {
        basic_data.insert(0, data[i]);




      }
    }

  }
}






