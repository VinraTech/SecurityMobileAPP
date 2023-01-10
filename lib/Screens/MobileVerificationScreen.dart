import 'dart:async';

import 'package:flutter/material.dart';
import 'package:securityservice/Components/Round_Button.dart';
import 'package:securityservice/Utilities/AppHeightAndWidth.dart';
import 'package:securityservice/Utilities/TextHelper.dart';

class MobileVerificationScreen extends StatefulWidget {
  const MobileVerificationScreen({Key? key}) : super(key: key);

  @override
  State<MobileVerificationScreen> createState() => _MobileVerificationScreenState();
}

class _MobileVerificationScreenState extends State<MobileVerificationScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();


  Timer? timer;
  bool enableResend = false,
      isPinError = false,
      isOTPInput = false;



  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    SizeConfig().init(context);
    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 35, right: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(
                height: height * 0.15,
              ),
              Container(child: AppBoldFont(msg: 'Phone Verification', fontSize: 36,)),
              AppRegularFont(msg: 'Enter your OTP code that you received on your email/mobile no.', fontSize: 16),
              SizedBox(
                height: height * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OtpInput(context, _fieldOne, true),
                  SizedBox(width: 10),
                  OtpInput(context, _fieldTwo, false),
                  SizedBox(width: 10),
                  OtpInput(context, _fieldThree, false),
                  SizedBox(width: 10),
                  OtpInput(context, _fieldFour, false),
                  SizedBox(width: 10),
                  OtpInput(context, _fieldFive, false),
                ],
              ),
              SizedBox(height: 50),
              Center(child: Container(child: AppBoldFont(msg: 'Didn’t received any code?', fontSize: 14,))),
              SizedBox(height: 10),
              Center(child: Container(child: AppBoldFont(msg: 'Resend a new code', fontSize: 14,color: Color(0xFFFF9900)))),
              SizedBox(height: SizeConfig.screenHeight! * .085,),
              RoundButton(
                  title: 'SUBMIT',
                  onPress: () {}),
            ],
          ),
        )
    );
  }


  Widget OtpInput(BuildContext context, controller, autoFocus) {
    return SizedBox(
      height: 50,
      width: 42,
      child: TextFormField(
         autofocus: autoFocus,
        textAlign: TextAlign.center,
        cursorHeight: 32,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Colors.black,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 32.0),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black),
            )
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }


}