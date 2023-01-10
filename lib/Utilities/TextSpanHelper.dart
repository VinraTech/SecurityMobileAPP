import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'TextStyling.dart';






TextSpan AppRegularTextSpan(
    {@required String? text1,
    double? fontSize,
    Color? color,
    VoidCallback? onPressed}) {
  return TextSpan(
      recognizer: new TapGestureRecognizer()..onTap = onPressed,
      text: text1,
      style: CustomTextStyle.textFormFieldLatoRegular
          .copyWith(color: color, fontSize: fontSize));
}

TextSpan AppBoldTextSpan(
    {@required String? text1,
      double? fontSize,
      Color? color,
      VoidCallback? onPressed}) {
  return TextSpan(
      recognizer: new TapGestureRecognizer()..onTap = onPressed,
      text: text1,
      style: CustomTextStyle.textFormFieldLatoRegular
          .copyWith(color: color, fontSize: fontSize));
}