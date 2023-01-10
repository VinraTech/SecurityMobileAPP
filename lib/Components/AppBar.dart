import 'package:flutter/material.dart';
import 'package:securityservice/Utilities/TextHelper.dart';

AppBar getAppBarWithBackBtn(String title){
  return AppBar(
    leading: Builder(
      builder: (context) => IconButton(
        icon: Image.asset('assets/images/Vector (3).png',
            color: Colors.white,
            width: 25, height: 25),
        onPressed: () {
          Navigator.pop(context,true);
        },
      ),
    ),
    actions: <Widget>[
      InkWell(
        onTap: (){},
        child: Center(child: Text('Edit', style: TextStyle(color: Colors.white),)),
      ),
      SizedBox(width: 15,),
    ], //<Widget>[]
    centerTitle: true,
    title: AppRegularFont(msg: title, color: Colors.white, fontSize: 17),
    backgroundColor: Colors.black,
  );
}
AppBar getAppBarWithBackBtn1(String title){
  return AppBar(
    leading: Builder(
      builder: (context) => IconButton(
        icon: Image.asset('assets/images/Vector (3).png',
            color: Colors.white,
            width: 25, height: 25),
        onPressed: () {
          Navigator.pop(context,true);
        },
      ),
    ),
    centerTitle: true,
    title: AppRegularFont(msg: title, color: Colors.white, fontSize: 17),
    backgroundColor: Colors.black,
  );
}