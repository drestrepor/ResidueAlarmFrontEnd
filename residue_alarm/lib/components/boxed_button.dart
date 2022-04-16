import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:residue_alarm/constants.dart';

class BoxedButton extends StatelessWidget {
  final String iconSrc;
  final void Function()? press;
  const BoxedButton({
    Key? key,
    required this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          border: Border.all(
            width: 3,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: SvgPicture.asset(
          iconSrc,
          height: 60,
          width: 60,
        ),
      ),
    );
  }
}
