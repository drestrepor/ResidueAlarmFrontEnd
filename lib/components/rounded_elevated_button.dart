import 'package:flutter/material.dart';
import 'package:residue_alarm/constants.dart';

class RoundedElevatedButton extends StatelessWidget {
  final String? text;
  final void Function()? press;
  final Color color, textColor;
  const RoundedElevatedButton({
    Key? key,
    this.text,
    this.press,
    this.color = kPrimaryLightColor,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: size.height * 0.055,
      width: size.width * 0.6,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: color,
              onPrimary: textColor,
              side: BorderSide(width: 2, color: Colors.black),
            ),
            onPressed: press,
            child: Text(
              text!,
              style: TextStyle(color: textColor),
            )),
      ),
    );
  }
}
