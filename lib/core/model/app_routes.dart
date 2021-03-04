import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zships/auth/view/fill_user_info.dart';
import 'package:zships/auth/view/login_view.dart';
import 'package:zships/auth/view/otp_view.dart';
import 'package:zships/auth/view/phon_auth_view.dart';
import 'package:zships/auth/view/sign_in_view.dart';
import 'package:zships/auth/view/sign_up_view.dart';
import 'package:zships/core/view/no_connection_view.dart';
import 'package:zships/core/view/splash_screen.dart';
import 'package:zships/core/view/tabbar_view.dart';
import 'package:zships/core/wrapper.dart';
import 'package:zships/shipments/view/shipment_view.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    Map<String, dynamic> args = settings.arguments;
    switch (settings.name) {
      case Wrapper.route:
        return MaterialPageRoute(builder: (_) => Wrapper(), settings: settings);
      case SplashScreen.route:
        return MaterialPageRoute(builder: (_) => SplashScreen(), settings: settings);
      case LoginView.route:
        return MaterialPageRoute(builder: (_) => LoginView(), settings: settings);
      case SignInView.route:
        return MaterialPageRoute(builder: (_) => SignInView(), settings: settings);
      case SignUpView.route:
        return MaterialPageRoute(builder: (_) => SignUpView(isAnonymous: settings.arguments), settings: settings);
      case UpdateUserInfo.route:
        return MaterialPageRoute(builder: (_) => UpdateUserInfo(onSignUp: args['onSignUp'] ?? false), settings: settings);
      case OTPView.route:
        return MaterialPageRoute(builder: (_) => OTPView(args['verificationId'], args['forceResendingToken']), settings: settings);
      case PhoneAuthView.route:
        return MaterialPageRoute(builder: (_) => PhoneAuthView(), settings: settings);
      case NoConnectionView.route:
        return MaterialPageRoute(builder: (_) => NoConnectionView(), settings: settings);
      case ShipmentView.route:
        return MaterialPageRoute(builder: (_) => ShipmentView(shipment: args['shipment']), settings: settings);
      // case RateCalculatorView.route:
      //   return MaterialPageRoute(builder: (_) => RateCalculatorView(), settings: settings);
      // case OrderView.route:
      //   return MaterialPageRoute(builder: (_) => OrderView(order: args['order']), settings: settings);
      // case RestaurantView.route:
      //   return MaterialPageRoute(builder: (_) => RestaurantView(restaurant: args['restaurant']), settings: settings);
      // case SettingView.route:
      //   return MaterialPageRoute(builder: (_) => SettingView(), settings: settings);
      case TabBarScreen.route:
        return MaterialPageRoute(builder: (_) => TabBarScreen(), settings: settings);
      default:
        return null;
    }
  }

  static CupertinoPageRoute cupertinoRoutes(RouteSettings settings) {
    Map<String, dynamic> args = settings.arguments ?? {};
    switch (settings.name) {
      case Wrapper.route:
        return CupertinoPageRoute(builder: (_) => Wrapper(), settings: settings);
      case SplashScreen.route:
        return CupertinoPageRoute(builder: (_) => SplashScreen(), settings: settings);
      case LoginView.route:
        return CupertinoPageRoute(builder: (_) => LoginView(), settings: settings);
      case SignInView.route:
        return CupertinoPageRoute(builder: (_) => SignInView(), settings: settings);
      case SignUpView.route:
        return CupertinoPageRoute(builder: (_) => SignUpView(isAnonymous: settings.arguments), settings: settings);
      case UpdateUserInfo.route:
        return CupertinoPageRoute(builder: (_) => UpdateUserInfo(onSignUp: args['onSignUp'] ?? false), settings: settings);
      case OTPView.route:
        return CupertinoPageRoute(builder: (_) => OTPView(args['verificationId'], args['forceResendingToken']), settings: settings);
      case PhoneAuthView.route:
        return CupertinoPageRoute(builder: (_) => PhoneAuthView(), settings: settings);
      case NoConnectionView.route:
        return CupertinoPageRoute(builder: (_) => NoConnectionView(), settings: settings);
      case ShipmentView.route:
        return CupertinoPageRoute(builder: (_) => ShipmentView(shipment: args['shipment']), settings: settings);
      // case RateCalculatorView.route:
      //   return CupertinoPageRoute(builder: (_) => RateCalculatorView(), settings: settings);
      // case OrderView.route:
      //   return CupertinoPageRoute(builder: (_) => OrderView(order: args['order']), settings: settings);
      // case RestaurantView.route:
      //   return CupertinoPageRoute(builder: (_) => RestaurantView(restaurant: args['restaurant']), settings: settings);
      // case SettingView.route:
      //   return CupertinoPageRoute(builder: (_) => SettingView(), settings: settings);
      case TabBarScreen.route:
        return CupertinoPageRoute(builder: (_) => TabBarScreen(), settings: settings);
      default:
        return null;
    }
  }
}
