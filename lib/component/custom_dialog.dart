import 'package:flutter/material.dart';

class CustomDialog {
  static displayDialog(context, dialog) {
    showDialog<String>(context: context, builder: (context) => dialog);
  }
}
