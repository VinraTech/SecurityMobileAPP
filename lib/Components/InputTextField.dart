import 'package:flutter/material.dart';
import 'package:securityservice/Components/Utils.dart';

Widget inputTextField(var val, var ctrl,var keyType, String msg,  var sinkValue, var fn1, var fn2) {
  return
    Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 5),
      child: StreamBuilder(
          stream: val,
          builder: (context, snapshot) {
            return TextFormField(
                cursorColor:   Colors.black,
                controller: ctrl,
                keyboardType: keyType,
                decoration: InputDecoration(
                  hintText: msg,
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                  // labelText: msg,
                  labelStyle: TextStyle(color: Colors.black),
                  // labelStyle: TextStyle(color: AppColors.buttonColor ),
                  // prefixIcon: Icon(img, color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 2,color: Colors.black),
                  ),
                 focusedBorder: UnderlineInputBorder(
                 borderSide: const BorderSide(width: 2, color: Colors.black),
                  ),
                  errorText: snapshot.hasError
                      ? snapshot.error.toString()
                      : null,
                ),
                onChanged: (m) {
                   sinkValue.add(m);
                },
                focusNode: fn1,
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, fn1, fn2);
                  // sinkValue.add(value);
                });
          }),
    );
}
