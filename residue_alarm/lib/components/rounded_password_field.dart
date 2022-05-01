import 'package:flutter/material.dart';
import 'package:residue_alarm/components/text_field_container.dart';
import 'package:residue_alarm/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  const RoundedPasswordField({
    Key? key,
    this.onChanged,
    this.hintText,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
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
