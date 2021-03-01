import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppAlerts {
  static Future<void> showErrorDialog(bool isIOS, BuildContext context, String errorMessage, String heder) async {
    return (isIOS)
        ? showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text(heder),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[Text(errorMessage)],
                  ),
                ),
                actions: <Widget>[
                  CupertinoButton(
                    child: Text('Okay'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              );
            })
        : showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text(heder),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[Text(errorMessage)],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Okay'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              );
            });
  }
}
