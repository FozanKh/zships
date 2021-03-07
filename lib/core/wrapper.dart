import 'package:flutter/material.dart';
import 'package:zships/auth/model/user.dart';
import 'package:zships/auth/view/login_view.dart';
import 'package:zships/core/view/tabbar_view.dart';
import 'package:zships/service/database.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  static const String route = 'Wrapper';

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  User user;
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    if (user != null && DatabaseService.instance?.uid == null || DatabaseService.instance?.uid == "" || DatabaseService.instance.uid != user?.uid)
      DatabaseService.instance.setValues(uid: user?.uid ?? "");
    if (user == null)
      return LoginView();
    else {
      return TabBarScreen();
    }
  }
}
