import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:residue_alarm/Screens/Uploading/components/background.dart';
import 'package:residue_alarm/components/boxed_button.dart';
import 'package:residue_alarm/components/rounded_button.dart';
import 'package:residue_alarm/components/rounded_elevated_button.dart';
import 'package:residue_alarm/constants.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/logoResidueAlarm.svg",
              height: size.height * 0.12,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: image != null
                  ? Image.file(
                      image!,
                      width: 350,
                      height: 350,
                      fit: BoxFit.cover,
                    )
                  : SvgPicture.asset(
                      "assets/icons/add_photo.svg",
                      height: size.height * 0.3,
                    ),
            ),
            SizedBox(
              height: size.height * 0.055,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BoxedButton(
                  iconSrc: "assets/icons/camera.svg",
                  press: () {
                    pickImage(ImageSource.camera);
                  },
                ),
                BoxedButton(
                  iconSrc: "assets/icons/refresh.svg",
                  press: () {
                    setState(() {});
                  },
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            RoundedElevatedButton(
              text: "SEND",
              press: () {},
              color: kPrimaryLightColor,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
