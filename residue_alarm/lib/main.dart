import 'package:flutter/material.dart';
import 'package:residue_alarm/Screens/Login/login_screen.dart';
import 'package:residue_alarm/Screens/Signup/signup_screen.dart';
import 'package:residue_alarm/Screens/Uploading/uploading_screen.dart';
import 'package:residue_alarm/Screens/Welcome/welcome_screen.dart';
import 'package:residue_alarm/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Residue Alarm',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/upload': (context) => UploadingScreen()
      },
      home: WelcomeScreen(),
    );
  }
}
