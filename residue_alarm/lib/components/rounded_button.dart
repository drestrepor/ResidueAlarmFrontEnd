import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:residue_alarm/constants.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final void Function()? press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(),
        child: OutlinedButton(
            style: outlineButtonStyle,
            onPressed: press,
            child: Text(
              text!,
              style: TextStyle(color: textColor),
            )),
      ),
    );
  }
}

final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
  primary: Colors.black,
);
