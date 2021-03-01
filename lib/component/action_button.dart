import 'package:flutter/material.dart';
import 'package:zships/component/bounce.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final EdgeInsetsGeometry margin;

  const ActionButton({this.title, this.onTap, this.margin});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: kBorderRadiusSmall,
          color: kFontsColor,
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 12, color: kBackground, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
