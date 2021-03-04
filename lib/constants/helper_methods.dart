import 'package:flutter/material.dart';

navigateTo(context, String route, {Map<String, dynamic> args}) async {
  return (await Navigator.pushNamed(context, route, arguments: args));
}

  // return (await Navigator.push(context, MaterialPageRoute(builder: (context) => widget)));
openPage(context, Widget widget, {Map<String, dynamic> args}) async {
  return (await Navigator.push(context, MaterialPageRoute(builder: (context) => widget)));
}

popPage(context, {args}) async {
  return Navigator.pop(context, args);
}

replacePage(context, String route, {Map<String, dynamic> args}) async {
  return (await Navigator.pushReplacementNamed(context, route, arguments: args));
  // return (await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget)));
}

bool gettingLocation = false;
// getUserLocation() async {
//   if (!gettingLocation) {
//     gettingLocation = true;
//     Future.delayed(Duration(seconds: 10));
//     userLocation = await Location.instance.getLocation();
//     gettingLocation = false;
//   }
// }
