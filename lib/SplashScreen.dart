import 'dart:async';
import 'package:flutter/material.dart';
import 'package:securityservice/Screens/LoginScreen.dart';
import 'package:securityservice/Utilities/AppHeightAndWidth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? appVersion, buildNumber;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      navigation();
    });
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/splash.jpg"),
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }

  void navigation() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var isEmail = sharedPreferences.getString('email');
    if (isEmail != null) {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (BuildContext context) => BottomNavigation(),
      //   ),
      // );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        ),
      );
    }
  }
}
