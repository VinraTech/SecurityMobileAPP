import 'package:flutter/widgets.dart';

String? validatePinNumber(String value) {
  String pattern = r'(^[0-9]*$)';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return "PIN  is Required";
  } else if (value.length != 4) {
    return "PIN must 4 digits";
  } else if (!regExp.hasMatch(value)) {
    return "PIN must be digits";
  }
  return '';
}
