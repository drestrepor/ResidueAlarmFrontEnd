import 'package:flutter/material.dart';
import 'package:residue_alarm/Screens/Welcome/components/background.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //This size provide us total height and width of our screen
    return Background(
      child: Column(
        children: <Widget>[
          Text(
            "WELCOME TO RESIDUE ALARM",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset("assetName")
        ],
      ),
    );
  }
}
