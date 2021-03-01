import 'package:flutter/material.dart';
import 'package:zships/auth/model/user.dart';
import 'package:zships/auth/view/login_view.dart';
import 'package:zships/constants/helper_methods.dart';
import 'package:zships/core/view/tabbar_view.dart';
import 'package:zships/service/database.dart';
import 'package:provider/provider.dart';
import 'package:zships/globals.dart' as globals;

class Wrapper extends StatefulWidget {
  static const String route = 'Wrapper';

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  User user;
  @override
  void initState() {
    load(count: 1);
    super.initState();
  }

  load({int count = 1}) async {
    if (count < 4) {
      print("try");
      user = Provider.of<User>(context, listen: false);
      if (user == null || user.uid == null) {
        await Future.delayed(Duration(seconds: 1));
        load(count: ++count);
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context, listen: false);
    // if (user != null) print(user?.email?.toString() + user?.name?.toString());
    if (user != null && DatabaseService.instance?.uid == null || DatabaseService.instance?.uid == "" || DatabaseService.instance.uid != user?.uid)
      DatabaseService.instance.setValues(uid: user?.uid ?? "");
    globals.globalContext = context;

    if (user == null)
      return LoginView();
    else {
      return TabBarScreen();
    }
  }
}
