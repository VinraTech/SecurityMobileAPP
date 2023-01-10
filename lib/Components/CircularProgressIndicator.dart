import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SampleCircularPage extends StatefulWidget {
  @override
  _SampleCircularPageState createState() => _SampleCircularPageState();
}

class _SampleCircularPageState extends State<SampleCircularPage> {
  String state = 'Animation start';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: ListView(
          children: <Widget>[

            CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 13.0,
              animation: true,
              animationDuration: 3000,
              percent: 0.6,
              animateFromLastPercent: true,
              header: Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
              ),
              center: Text(
                "60.0%",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.amberAccent),
              ),
              footer: Text(
                "Completed",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.white),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.amberAccent,
              widgetIndicator: RotatedBox(
                quarterTurns: 1,
              ),
            ),

          ],
        ),
      ),
    );
  }
}