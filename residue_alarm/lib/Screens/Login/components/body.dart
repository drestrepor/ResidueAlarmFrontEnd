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
import 'package:residue_alarm/config.dart';
import 'package:residue_alarm/constants.dart';
import 'package:residue_alarm/models/login_request_model.dart';
import 'package:residue_alarm/services/api_service.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isAPIcallProcess = false;
  String? useremailValue;
  String? passwordValue;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: globalFormKey,
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
                onSaved: (value) {
                  useremailValue = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please fill this field";
                  }

                  return null;
                },
              ),
              RoundedPasswordField(
                hintText: 'Your password',
                onChanged: (value) {},
                onSaved: (value) {
                  passwordValue = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please fill this field";
                  }

                  return null;
                },
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  if (validateAndSave()) {
                    setState(() {
                      isAPIcallProcess = true;
                    });

                    LoginRequestModel model = LoginRequestModel(
                      email: useremailValue!,
                      password: passwordValue!,
                    );

                    APIService.login(model).then((response) {
                      setState(() {
                        isAPIcallProcess = false;
                      });

                      if (response) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/upload', (route) => false);
                      } else {
                        FormHelper.showSimpleAlertDialog(context,
                            Config.appName, "Invalid Email/Password", "OK", () {
                          Navigator.pop(context);
                        });
                      }
                    });
                  }
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UploadingScreen();
                      },
                    ),
                  ); */
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
