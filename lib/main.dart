import 'dart:io';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zships/auth/model/user.dart';
import 'package:zships/auth/services/auth.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/core/model/app_routes.dart';
import 'package:zships/core/view/splash_screen.dart';
import 'package:zships/globals.dart' as globals;
import 'package:zships/localization/app_localization.dart';
import 'package:zships/localization/constants.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static Locale currentLocale = window.locale;
  static String get lang => currentLocale.languageCode;
  static String get langAlt => currentLocale.languageCode == 'en' ? 'ar' : 'en';
  static void setLocale(BuildContext context) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(currentLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  @override
  void initState() {
    setLocaleMessages('ar', ArMessages());
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: kTransparent,
    ));
    super.initState();
  }

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    globals.globalContext = context;
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: _locale,
        supportedLocales: appSupportedLocales,
        localizationsDelegates: [
          AppLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        theme: ThemeData(
          scaffoldBackgroundColor: kBackground,
          fontFamily: 'DinNext',
        ),
        onGenerateRoute: Platform.isIOS ? Routes.cupertinoRoutes : Routes.materialRoutes,
        home: SplashScreen(),
      ),
    );
  }
}
