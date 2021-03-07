import 'package:flutter/material.dart';
import 'package:zships/auth/model/user.dart';
import 'package:zships/auth/services/auth.dart';
import 'package:zships/component/alertDialog.dart';
import 'package:zships/component/progress_indicator.dart';
import 'package:zships/globals.dart';

class SettingController {
  User user;
  AuthService _auth;
  BuildContext context;

  SettingController({this.context, this.user}) {
    _auth = AuthService();
  }

  bool get userExists => user != null;

  Future logout() async {
    if (user != null
        ? await AlertDialogBox.showAssertionDialog(context, locale: true, title: 'logoutConfirmation')
        : await AlertDialogBox.showAssertionDialog(context, message: 'logoutConfirmation', locale: true)) {
      final ProgressDialog pr = ProgressDialog(context);
      await pr.show();
      allShipments.clear();
      await _auth.signOut();
      await pr.hide();
      // Navigator.pushNamed(context, 'Wrapper');
      // if (user != null && user.isAnonymous) await DatabaseService(uid: user.uid).deleteUser();
    }
  }
}
