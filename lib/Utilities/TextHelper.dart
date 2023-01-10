import 'package:flutter/material.dart';
import 'TextStyling.dart';






Text AppRegularFont(
    {@required String? msg,
    double? fontSize,
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow? overflowBar,
      FontWeight? fontWeight,
    Color? color}) {
  return Text(msg!,
      overflow: overflowBar,
      maxLines: maxLines,
      textAlign: textAlign,
      style: CustomTextStyle.textFormFieldLatoRegular
          .copyWith(color: color, fontSize: fontSize));
}

Text AppBoldFont(
    {@required String? msg,
        double? fontSize,
        int? maxLines,
        TextAlign? textAlign,
        TextOverflow? overflowBar,
        Color? color}) {
    return Text(msg!,
        overflow: overflowBar,
        maxLines: maxLines,
        textAlign: textAlign,
        style: CustomTextStyle.textFormFieldLatoBold
            .copyWith(color: color, fontSize: fontSize));
}