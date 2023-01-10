import 'package:flutter/material.dart';
import 'package:securityservice/Components/AppBar.dart';
import 'package:securityservice/Components/UperTimer.dart';
import 'package:securityservice/Utilities/TextHelper.dart';

class TimeSheetScreen extends StatefulWidget {
  const TimeSheetScreen({Key? key}) : super(key: key);

  @override
  _TimeSheetScreenState createState() => _TimeSheetScreenState();
}

class _TimeSheetScreenState extends State<TimeSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn1('Timesheet'),
      body: Column(
        children: [
           Container(
             height: 200,
               child: CountUpTimerPage()),
          SizedBox(height: 30,),
          Container(
            height: 500,
            child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // padding: EdgeInsets.only(left: 28, right: 28),

                    child: Row(
                      children: [
                        getNotification('Corn processing factory','11:00', '12/05/2020'),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
  Widget getNotification( msg1, time, String msg2){

    return Container(
      color: Colors.black12,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 13, top: 12, bottom: 12 ,right: 13),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getNotify(msg1, time),
          SizedBox(height: 6,),
          getNotify(msg2, 'HOURS'),

        ],
      ),
    );
  }
  getNotify(String msg1, String time,){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppRegularFont(msg: msg1 , fontSize: 13, fontWeight: FontWeight.w500),

        Container(
            child: AppRegularFont(msg: time , fontSize: 10, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
