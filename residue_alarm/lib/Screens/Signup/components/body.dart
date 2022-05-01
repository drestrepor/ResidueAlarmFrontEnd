import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:residue_alarm/Screens/Login/login_screen.dart';
import 'package:residue_alarm/Screens/Signup/components/background.dart';
import 'package:residue_alarm/components/already_have_a_account_check.dart';
import 'package:residue_alarm/components/rounded_button.dart';
import 'package:residue_alarm/components/rounded_input_field.dart';
import 'package:residue_alarm/components/rounded_password_field.dart';
import 'package:residue_alarm/models/register_request_model.dart';
import 'package:residue_alarm/services/api_service.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../../config.dart';

class Body extends StatefulWidget {
  final Widget child;

  const Body({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isAPIcallProcess = false;
  String? useremailValue;
  String? passwordValue;
  String? username;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
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
                if (validateAndSave()) {
                  setState(() {
                    isAPIcallProcess = true;
                  });

                  RegisterRequestModel model = RegisterRequestModel(
                    name: username!,
                    email: useremailValue!,
                    password: passwordValue!,
                  );

                  APIService.register(model).then((response) {
                    setState(() {
                      isAPIcallProcess = false;
                    });
                    if (response.data != null) {
                      FormHelper.showSimpleAlertDialog(context, Config.appName,
                          "Registration Succesfull. Please login.", "OK", () {
                        Navigator.pop(context);
                      });
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (route) => false);
                    } else {
                      FormHelper.showSimpleAlertDialog(
                          context, Config.appName, response.message, "OK", () {
                        Navigator.pop(context);
                      });
                    }
                  });
                }
                /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                ); */
              },
            )
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
