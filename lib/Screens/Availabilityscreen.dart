import 'package:flutter/material.dart';
import 'package:securityservice/Components/AppBar.dart';
import 'package:securityservice/Screens/AvailabilityDetailScreen.dart';
import 'package:securityservice/Utilities/AppNavigation.dart';
import 'package:securityservice/Utilities/TextHelper.dart';

class AvailabilityScreen extends StatefulWidget {
  const AvailabilityScreen({Key? key}) : super(key: key);

  @override
  _AvailabilityScreenState createState() => _AvailabilityScreenState();
}

class _AvailabilityScreenState extends State<AvailabilityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn1('Availability'),
      body: Container(
        padding: EdgeInsets.all(28),
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: (){navigationPush(context, AvailabilityDetailScreen());},
                  child: getData('Hyderabad, Building B', 'JP Nagar', 4));
            }),
      ),
    );
  }
  Widget getData(address, city, openings){
    return Column(
      children: [
        Row(
          children: [
            Image.asset('assets/images/Group 11 (1).png', height: 60,width: 60,),
            getColumnData(address, city, openings),
          ],
        ),
         Container(
          padding: EdgeInsets.only(top: 6, bottom: 6),
          margin: EdgeInsets.only(top: 6, bottom: 6),
          height: 2,
          width: MediaQuery.of(context).size.width * 0.85,
          color: Colors.grey,)
      ],
    );
  }
  getColumnData(String address, city, openings){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(left: 5),
            child: AppRegularFont(msg: address, fontWeight: FontWeight.w600, fontSize: 16), alignment: Alignment.topLeft,),
        SizedBox(height: 6,),
        getRowData(city, openings),
      ],
    );
  }
  getRowData(String city, int openings){
    return Row(
     children: [
       Container(
         padding: EdgeInsets.only(left: 5),
           alignment: Alignment.centerLeft,
           child: AppRegularFont(msg: city, fontWeight: FontWeight.w400, fontSize: 14)),
       SizedBox(width: MediaQuery.of(context).size.width * 0.3,),
       Container(
         alignment: Alignment.centerRight,
           child: AppRegularFont(msg: 'No. of opening : '+ '${openings}', fontWeight: FontWeight.w400, fontSize: 14))
     ],
    );
  }
}
