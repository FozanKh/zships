import 'dart:ui';
import 'package:zships/component/animations/showUp.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/constants/helper_methods.dart';
import 'package:zships/constants/validate.dart';
import 'package:zships/core/view/no_connection_view.dart';
import 'package:zships/core/wrapper.dart';
import 'package:zships/globals.dart';
import 'package:zships/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:zships/service/sharedPreferences.dart';

class SplashScreen extends StatefulWidget {
  static const String route = 'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    AppSharedPreferences.instance.getLocale(context);
    setState(() {});
    if (!(await checkConnection())) await navigateTo(context, NoConnectionView.route);

    Timer(
      Duration(milliseconds: 1000),
      () => Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 800),
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) =>
              FadeTransition(opacity: animation, child: child),
          pageBuilder: (_, __, ___) => Wrapper(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        color: kBackground,
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 4),
        child: Align(
          alignment: Alignment.center,
          // child: ShowUp(delay: 100, child: Lottie.asset(kLottieLogoSplashAsset, repeat: true, reverse: true, width: 300, height: 300)),
          child: ShowUp(
            delay: 100,
            child: Hero(
              tag: 'logo',
              child: Container(
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.height / 2),
                child: Image.asset(
                  kZShipLogo,
                  height: 2 * MediaQuery.of(context).size.width / 3,
                  width: 2 * MediaQuery.of(context).size.width / 3,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
