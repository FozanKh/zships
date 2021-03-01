import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/localization/constants.dart';

class Titled extends StatelessWidget {
  final String title;
  final Icon titleIcon;
  final Color titleColor;
  final TextStyle titleTextStyle;
  final Widget child;
  final bool largeTitle;

  const Titled({Key key, this.title, this.titleColor, this.titleTextStyle, this.child, this.largeTitle = false, this.titleIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (title != null)
          Container(
            alignment: customAlignment(context),
            padding: EdgeInsets.symmetric(horizontal: largeTitle ? 20 : 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: titleTextStyle ??
                      TextStyle(
                        fontWeight: largeTitle ? FontWeight.w700 : null,
                        color: titleColor ?? largeTitle ? kFontsColor : Colors.grey,
                        fontSize: largeTitle ? 24 : 12,
                      ),
                ),
                if (titleIcon != null) titleIcon
              ],
            ),
          ),
        if (title != null) SizedBox(height: 5),
        child
      ],
    );
  }
}
