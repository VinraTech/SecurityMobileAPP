import 'package:flutter/material.dart';
import 'package:securityservice/Screens/Availabilityscreen.dart';
import 'package:securityservice/Screens/HelpAndSupport.dart';
import 'package:securityservice/Screens/NotificationScreen.dart';
import 'package:securityservice/Screens/OpenShiftsScreen.dart';
import 'package:securityservice/Screens/ProfileScreen.dart';
import 'package:securityservice/Screens/SiteScreen.dart';
import 'package:securityservice/Screens/StatusScreen.dart';
import 'package:securityservice/Screens/TimeSheetScreen.dart';
import 'package:securityservice/Utilities/AppNavigation.dart';
import 'package:securityservice/Utilities/TextHelper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 40, left: 26),
              height: 90,
              child: AppRegularFont(msg: 'Security Guard Management', fontSize: 14,fontWeight: FontWeight.w600, color: Colors.black,),
            ),
                 Stack(
                   children: [
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Colors.amber
                       ),
                       
                       height: MediaQuery.of(context).size.height * 0.897,
                     width: MediaQuery.of(context).size.width,
                     ),
                     Container(
                       padding: EdgeInsets.only(top: 35, left: 26, bottom: 20),
                       child: Row(
                         children: [
                           Image.asset('assets/images/Ellipse 1 (1).png', height: 60,width: 60,),
                           SizedBox(width: 15,),
                           textTittle(),
                         ],
                       ),
                     ),
                     Positioned(
                       top: 130,
                         child: Container(
                           padding: EdgeInsets.only(top: 36, bottom: 20,),
                           height: MediaQuery.of(context).size.height,
                             width: MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: Colors.white,
                           ),
                           child: Container(
                             color: Colors.white,
                             height: 500,
                             child: Column(
                               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 homeComponents('assets/images/profile (1).png', ProfileScreen(),'assets/images/availability (1).png',AvailabilityScreen(), 'assets/images/shifts (1).png', (){}),
                                 SizedBox(height: 10,),
                                 homeComponents('assets/images/site (1).png',SiteScreen(), 'assets/images/open shifts (1).png',OpenShiftsScreen(), 'assets/images/status (1).png',StatusScreen()),
                                 SizedBox(height: 10,),
                                 homeComponents('assets/images/Group 18 (1).png', TimeSheetScreen(), 'assets/images/notifications (1).png', NotificationScreen(),'assets/images/help & support (1).png',HelpAndSuppot()),
                               ],
                             ),
                           ))
                         )
                   ],
                 ),
          ],
        ),
      ),
    );
  }
  Widget textTittle(){
    return Column(
      children: [
        AppRegularFont(msg: "Savannah Nguyen", fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black,),
        SizedBox(height: 5,),
        AppRegularFont(msg: "felicia.reid@example.com", fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black,),
        SizedBox(height: 5,),
        AppRegularFont(msg: "+91-855-589-1860", fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black,),
      ],
    );
  }

  Widget homeComponents(var img1,var fun1, var img2 ,var fun2, var img3, var fun3){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
       InkWell(
         onTap: (){
           navigationPush(context, fun1);
         },
           child: Image.asset(img1,height: 110, width: 110,)),
        InkWell(
          onTap: (){
            navigationPush(context, fun2);
          },
            child: Image.asset(img2, height: 110, width: 110,)),
        InkWell(
            onTap: (){
              navigationPush(context, fun3);
            },
            child: Image.asset(img3, height: 110, width: 110,)),
      ],
    );
  }
}
