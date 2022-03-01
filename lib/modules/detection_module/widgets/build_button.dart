import 'package:flutter/material.dart';
//import 'package:lets_measure/constants.dart';

class BuildButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onClicked;

  // ignore: use_key_in_widget_constructors
  const BuildButton({
    @required this.title,
    @required this.icon,
    @required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 180.0,
      child: TextButton.icon(
        onPressed: onClicked,
        icon: Icon(icon, size: 28, color: Colors.white),
        style: ButtonStyle(
          shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )
          ),
          backgroundColor: MaterialStateProperty.all( Color.fromRGBO(42,65,88, 1.0)),
          shadowColor: MaterialStateProperty.all(Color.fromRGBO(42,65,88, 1.0)),
          elevation: MaterialStateProperty.all(3),
        ),
        label: Text(
          title,
          style: const TextStyle(color: Colors.white,
            fontSize: 16,),
        ),
      ),
    );
  }
}
