import 'package:flutter/material.dart';
import 'package:securityservice/Utilities/TextHelper.dart';

class RoundButton extends StatelessWidget {

  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton({Key? key,
  required this.title,
  this.loading = false,
  required this.onPress}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
            child:loading ? CircularProgressIndicator(color: Colors.black,) : AppBoldFont(msg: title, color: Colors.white)),
      ),
    );
  }
}
