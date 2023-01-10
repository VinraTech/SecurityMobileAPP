import 'package:flutter/material.dart';
import 'package:securityservice/Components/AppBar.dart';
import 'package:securityservice/Utilities/TextHelper.dart';

class ShiftsDetailScreen extends StatefulWidget {
  const ShiftsDetailScreen({Key? key}) : super(key: key);

  @override
  _ShiftsDetailScreenState createState() => _ShiftsDetailScreenState();
}

class _ShiftsDetailScreenState extends State<ShiftsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn1('Hyderabad, Building B'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/Rectangle 26 (1).png'),
          SizedBox(height: 23,),
          Container( padding: EdgeInsets.only(left: 28),child: AppRegularFont(msg: 'Hyderabad, Building B', fontSize: 20, fontWeight: FontWeight.w600,)),
          SizedBox(height: 14,),
          Container(padding: EdgeInsets.only(left: 28),child: AppRegularFont(msg: 'Location : JP Nagar', fontSize: 14, fontWeight: FontWeight.w700)),
          SizedBox(height: 14,),
          Container(padding: EdgeInsets.only(left: 28),child: AppRegularFont(msg: 'Manager Name : Antony Bessan', fontSize: 14, fontWeight: FontWeight.w700)),
          SizedBox(height: 23,),
          Container(padding: EdgeInsets.only(left: 28),child: AppRegularFont(msg: 'MNo of opening : 4', fontSize: 14, fontWeight: FontWeight.w700)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.4182,),
          InkWell(
            onTap: (){},
            child: Container(
              height: 50,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: AppRegularFont(msg: 'APPLY NOW', fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white, textAlign: TextAlign.center),
            ),
          )
        ],
      ),
    );
  }
}
