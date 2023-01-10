import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:securityservice/Utilities/TextHelper.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
  required this.child,
  this.color,
  this.disableColor,
  this.elevation,
  this.side = BorderSide.none,
  this.onTap,
  super.key,
});

final Widget child;
final Color? color;
final Color? disableColor;
final double? elevation;
final BorderSide side;
final VoidCallback? onTap;

@override
Widget build(BuildContext context) {
  return Container(
    height: 45,
    width: 153,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: color,
        shape: const StadiumBorder().copyWith(side: side),
        disabledBackgroundColor: disableColor ?? Colors.grey,
        elevation: elevation,
      ),
      onPressed: onTap,
      child: child,
    ),
  );
}
}

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