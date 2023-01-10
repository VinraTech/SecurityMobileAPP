import 'package:flutter/material.dart';
import 'package:securityservice/Components/Utils.dart';


Widget inputPasswordTextField(var obsPassword,var obsConfirmPassword, var ctrl ,String msg, var fn1 ,var fn2) {
  return
    Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 5),
      child: ValueListenableBuilder(
          valueListenable: obsPassword,
          builder: (context, value, child) {
            return TextFormField(
                cursorColor:   Colors.black,
                controller: ctrl,
                obscureText: obsPassword.value,
                obscuringCharacter: '*',
                focusNode: fn1,
                decoration: InputDecoration(
                    hintText: msg,
                    hintStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                    // labelText: msg,
                    labelStyle: TextStyle(color: Colors.black),
                    // prefixIcon: Icon(img ,color: Colors.black),
                    suffixIcon: InkWell(
                        onTap: (){
                          obsPassword.value = !obsPassword.value;
                          if(obsPassword.value ^ obsConfirmPassword.value != false)
                          {
                            obsConfirmPassword.value = !obsConfirmPassword.value;
                          }
                        },
                        child: Icon(obsPassword.value ? Icons.visibility_off_outlined : Icons.visibility, color: Colors.grey,)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2,color: Colors.black),
                    ),
            focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.black),
                )),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(context, fn1,
                      fn2);
                });
          }),
    );
}


Widget inputConfirmPasswordTextField(var obsConfirmPassword, var ctrl ,String msg, var fn1 ,var fn2) {
  return
    Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 5),
      child: ValueListenableBuilder(
          valueListenable: obsConfirmPassword,
          builder: (context, value, child) {
            return TextFormField(
                cursorColor:   Colors.black,
                autofocus: false,
                controller: ctrl,
                obscureText: obsConfirmPassword.value,
                obscuringCharacter: '*',
                focusNode: fn1,
                decoration: InputDecoration(
                    hintText: msg,
                    hintStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                    // labelText: msg,
                    labelStyle: TextStyle(color: Colors.black),
                    // labelStyle: TextStyle(color: AppColors.buttonColor ),
                    // prefixIcon: Icon(img, color: Colors.black,),
                    suffixIcon:  InkWell(
                        onTap: (){
                          obsConfirmPassword.value = !obsConfirmPassword.value;
                        },
                        child: Icon(obsConfirmPassword.value ? Icons.visibility_off_outlined : Icons.visibility, color: Colors.grey)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2,color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black),
            )
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(context, fn1,
                      fn2);
                });
          }),
    );
}