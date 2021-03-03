import 'package:zships/auth/view/sign_in_view.dart';
import 'package:zships/auth/view/sign_up_view.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/helper_methods.dart';
import 'package:zships/localization/constants.dart';
import 'package:zships/component/animations/showUp.dart';
import 'package:zships/constants/decorations.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  static const String route = 'LoginView';

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final int delayAmount = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
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
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 20,
              left: 40,
              right: 40,
            ),
            child: ShowUp(
              delay: delayAmount + 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  InkWell(
                    onTap: () => navigateTo(context, SignInView.route),
                    child: Container(
                      height: kCardHeight,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: kDark4,
                      ),
                      child: Text(getText(context, 'signIn'), style: TextStyle(color: kDark1, fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () => navigateTo(context, SignUpView.route),
                    child: Container(
                      height: kCardHeight,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: kDark4, width: 3),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(getText(context, 'signUp'), style: TextStyle(color: kFontsColor, fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
