import 'package:flutter/material.dart';
import 'package:securityservice/Components/AppBar.dart';
import 'package:securityservice/Components/CircularProgressIndicator.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: getAppBarWithBackBtn1('Status'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(
          height: 300,
            width: MediaQuery.of(context).size.width,
            child: SampleCircularPage()),
          Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: SampleCircularPage()),
        ],
      ),
    );
  }
}


