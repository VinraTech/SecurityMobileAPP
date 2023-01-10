import 'package:flutter/material.dart';
import 'package:securityservice/Components/AppBar.dart';
import 'package:securityservice/Components/InputTextField.dart';
import 'package:securityservice/Utilities/TextHelper.dart';
import 'package:securityservice/Utilities/TextSpanHelper.dart';
import 'package:securityservice/Utilities/bloc_validation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn('Profile'),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/Group 5 (2).png',),
              Positioned(
                top: 70,
                  left: MediaQuery.of(context).size.width * 0.4,
                  child: Center(child: Image.asset('assets/images/Ellipse 1 (1).png', height: 100,width: 100,))),
              Positioned(
                top: 180,
                  left: MediaQuery.of(context).size.width * 0.36,
                  child: Center(child: AppRegularFont(msg: 'Savannah Nguyen', color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20))),
            ],
          ),
          Container(
            height: 500,
            padding: EdgeInsets.all(28),
              child: SingleChildScrollView(
                child: Column(
            children: [
                  profileDetail('Name', 'Savannah Nguyen'),
                profileDetail('Phone Number', '+91-995-556-0537'),
                profileDetail('Security License', '34 LD 5225'),
                profileDetail('Gender', 'Male'),
                profileDetail('Username', 'Cameron'),
                profileDetail('Email Address', 'tranthuy.nute@gmail.com'),
                profileDetail('Address', '67B Gregorio Grove ,Jaskolskiville'),
                profileDetail('Unit Number', 'BA9212320'),
                profileDetail('Employee ID', 'A0B1C042'),
                profileDetail('Date of Birth', 'May 16, 2005'),
                profileDetail('Social Security Number', '32147896'),
                profileDetail('Emergency Contact Details', '+91-755-574-6393'),
                profileDetail('Licenses Number', 'BA9212320'),
                profileDetail('Availability', 'Full Time'),
                profileDetail('Manager Assigned', 'Selahattin Kuzucu'),

            ],
          ),
              )),
        ],
      ),
    );
  }

  Widget profileDetail(String txt, String txt1){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppRegularFont(msg: txt, fontSize: 14, fontWeight: FontWeight.w500,textAlign: TextAlign.start, color: Colors.grey),
        SizedBox(height: 6,),
        AppRegularFont(msg: txt1, fontSize: 16, fontWeight: FontWeight.w500,textAlign: TextAlign.start),
        SizedBox(height: 6,),
        Container(height: 2, color: Colors.black,),
        SizedBox(height: 6,),
      ],
    );
  }
}
