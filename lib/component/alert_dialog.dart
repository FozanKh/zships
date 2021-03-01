import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zships/component/rounded_button.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/localization/constants.dart';

void showAlert(context, {String title, String message, Function onTap}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Text(message, style: TextStyle(color: kDark2, fontSize: 12)),
          SizedBox(height: 25),
          RoundedButton(title: getText(context, 'ok'), titleSize: 13, onTap: onTap ?? () => Navigator.pop(context)),
        ],
      ),
    ),
  );
}
