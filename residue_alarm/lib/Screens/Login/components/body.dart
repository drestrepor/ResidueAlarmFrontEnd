import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:residue_alarm/Screens/Login/components/background.dart';
import 'package:residue_alarm/Screens/Signup/signup_screen.dart';
import 'package:residue_alarm/Screens/Uploading/uploading_screen.dart';
import 'package:residue_alarm/components/already_have_a_account_check.dart';
import 'package:residue_alarm/components/rounded_button.dart';
import 'package:residue_alarm/components/rounded_input_field.dart';
import 'package:residue_alarm/components/rounded_password_field.dart';
import 'package:residue_alarm/components/text_field_container.dart';
import 'package:residue_alarm/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/logoResidueAlarm.svg",
              height: size.height * 0.19,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: "email@example.com",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              hintText: 'Your password',
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return UploadingScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
