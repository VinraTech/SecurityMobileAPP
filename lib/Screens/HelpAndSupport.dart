import 'package:flutter/material.dart';
import 'package:securityservice/Components/AppBar.dart';
import 'package:securityservice/Utilities/TextHelper.dart';

class HelpAndSuppot extends StatefulWidget {
  const HelpAndSuppot({Key? key}) : super(key: key);

  @override
  _HelpAndSuppotState createState() => _HelpAndSuppotState();
}

class _HelpAndSuppotState extends State<HelpAndSuppot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn1('Help & Support'),
      body: Container(
        padding: EdgeInsets.only(left: 28,top: 50),
        child: Column(
          children: [
            getHelpSup('assets/images/Vector (4).png', 'info@harkavsecurity.com'),
            SizedBox(height: 20,),
            getHelpSup('assets/images/Vector (5).png', '+91-9090909090')
          ],
        ),
      ),
    );
  }
  Widget getHelpSup(var icn, String txt){
    return Row(
      children: [
        Image.asset(icn, height: 16, width: 20,),
        SizedBox(width: 15,),
        AppRegularFont(msg: txt, fontWeight: FontWeight.w500, fontSize: 16)
      ],
    );
  }
}
