import 'package:flutter/material.dart';
import 'package:securityservice/Components/AppBar.dart';
import 'package:securityservice/Utilities/TextHelper.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn1('Notification'),
      body:  ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.only(left: 28, right: 28),

              child: Row(
                children: [
                  Container(
                    height: 55,
                    width: 2, color: Colors.red,
                  ),
                  getNotification('Shift Change Notification','5 min ago', 'Aliquet risus feugiat in ante'),
                ],
              ),
            );
          }),
    );
  }
  Widget getNotification( msg1, time, String msg2){

    return Container(
      color: Colors.black12,
      padding: EdgeInsets.only(left: 13, top: 12, bottom: 12 ,right: 13),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getNotify(msg1, time),
          SizedBox(height: 6,),
          AppRegularFont(msg: msg2 , fontSize: 12, fontWeight: FontWeight.w400)

        ],
      ),
    );
  }
  getNotify(String msg1, String time){
    return Row(
      children: [
       AppRegularFont(msg: msg1 , fontSize: 13, fontWeight: FontWeight.w500),
       SizedBox(width: MediaQuery.of(context).size.width * 0.32,),
       AppRegularFont(msg: time , fontSize: 10, fontWeight: FontWeight.w600),
     ],
    );
  }
}
