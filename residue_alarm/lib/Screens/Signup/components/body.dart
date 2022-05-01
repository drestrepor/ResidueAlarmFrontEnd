import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:residue_alarm/Screens/Login/login_screen.dart';
import 'package:residue_alarm/Screens/Signup/components/background.dart';
import 'package:residue_alarm/components/already_have_a_account_check.dart';
import 'package:residue_alarm/components/rounded_button.dart';
import 'package:residue_alarm/components/rounded_input_field.dart';
import 'package:residue_alarm/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/logoResidueAlarm.svg",
              height: size.width * 0.29,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              hintText: 'Password',
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              hintText: 'Confirm your password',
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
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
