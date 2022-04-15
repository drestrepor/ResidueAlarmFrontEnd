import 'package:flutter/material.dart';
import 'package:residue_alarm/components/text_field_container.dart';
import 'package:residue_alarm/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const RoundedPasswordField({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryLightColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryLightColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
