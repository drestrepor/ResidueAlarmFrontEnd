import 'package:flutter/material.dart';
import 'package:residue_alarm/Screens/Welcome/components/body.dart';
import 'package:residue_alarm/constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Body(),
    );
  }
}
