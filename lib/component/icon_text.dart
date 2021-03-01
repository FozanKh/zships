import 'package:flutter/material.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextStyle style;
  final Color iconColor;
  final double fontSize;

  const IconText({Key key, this.icon, this.text, this.style, this.iconColor, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Icon(icon, color: iconColor ?? kDark4, size: fontSize == null ? 16 : fontSize + 4),
        SizedBox(width: 5),
        Text(
          text,
          maxLines: 1,
          style: style ?? TextStyle(fontSize: fontSize ?? 12, color: kDark1),
        )
      ],
    );
  }
}
