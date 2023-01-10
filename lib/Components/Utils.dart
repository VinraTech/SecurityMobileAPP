import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils{

  static void fieldFocusChange(
      BuildContext context,
      FocusNode current,
      FocusNode nextFocus
      ){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
  static ToastMessage(String message){
    Fluttertoast.showToast(msg: message,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 15,
        toastLength: Toast.LENGTH_LONG,);
  }

  static void flushBarErrorMessage(String message , BuildContext context){
    showFlushbar(context: context,
    flushbar: Flushbar(
      forwardAnimationCurve: Curves.easeInCirc,
      message: message,
      // flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.black,
      borderRadius: BorderRadius.circular(20),
      messageColor: Colors.white,
      duration: Duration(seconds: 3),
      positionOffset: 10,
      icon: Icon(Icons.error, size: 25, color: Colors.white,),
    )..show(context),
    );
  }

  static snakBar(String message, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black12,
        content: Text(message),
      )
    );
  }
}