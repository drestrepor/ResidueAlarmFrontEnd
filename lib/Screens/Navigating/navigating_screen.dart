import 'package:flutter/material.dart';
import 'package:residue_alarm/Screens/History/history_screen.dart';
import 'package:residue_alarm/Screens/ProfilePage/profile_page_screen.dart';
import 'package:residue_alarm/Screens/Uploading/uploading_screen.dart';
import 'package:residue_alarm/constants.dart';

class NavigatingScreen extends StatefulWidget {
  @override
  State<NavigatingScreen> createState() => _NavigatingScreenState();
}

class _NavigatingScreenState extends State<NavigatingScreen> {
  int index = 1;
  final screens = [
    HistoryScreen(),
    UploadingScreen(),
    ProfilePageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: kPrimaryLightColor,
              labelTextStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
          child: NavigationBar(
            height: 60,
            backgroundColor: Colors.grey[400],
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: index,
            animationDuration: Duration(seconds: 2),
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.history), label: "History"),
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.supervised_user_circle_rounded),
                  label: "User"),
            ],
          )),
    );
  }
}
