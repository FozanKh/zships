import 'package:zships/auth/services/auth.dart';
import 'package:zships/component/alertDialog.dart';
import 'package:zships/component/progress_indicator.dart';
import 'package:zships/component/rounded_text_field.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/helper_methods.dart';
import 'package:zships/localization/constants.dart';
import 'package:zships/component/animations/showUp.dart';
import 'package:zships/constants/decorations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  static const String route = 'SignInView';

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  static bool _forgotPassword = false;
  AuthService _auth = AuthService();
  String _userEmail = "";
  String _userPassword = "";
  final int delayAmount = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: kDark3, size: 30),
          onPressed: () {
            _forgotPassword ? _forgotPassword = false : Navigator.pop(context);
            setState(() {});
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: ShowUp(
                  delay: delayAmount,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: (_forgotPassword ? getText(context, 'resetPassword') : getText(context, 'signIn')) + '\n',
                                style: kLabelTextStyle,
                                children: [
                                  TextSpan(
                                      text: _forgotPassword ? getText(context, 'allUnderControl') : getText(context, 'welcomeBack'),
                                      style: kTitleTextStyle.copyWith(fontSize: 25))
                                ]),
                          ),
                        ),
                        SizedBox(height: 20),
                        RoundedTextField(
                          title: getText(context, 'apiKey'),
                          hint: getText(context, 'writeEmail'),
                          fillColor: Colors.grey.shade200,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            _userEmail = value;
                            setState(() {});
                          },
                        ),
                        // Visibility(
                        //   visible: !_forgotPassword,
                        //   child: ShowUp(
                        //     delay: delayAmount,
                        //     child: RoundedTextField(
                        //       title: getText(context, 'password'),
                        //       hint: getText(context, 'writePassword'),
                        //       fillColor: Colors.grey.shade200,
                        //       obscureText: true,
                        //       keyboardType: TextInputType.visiblePassword,
                        //       onChanged: (value) {
                        //         _userPassword = value;

                        //         setState(() {});
                        //       },
                        //     ),
                        //   ),
                        // ),
                        // Visibility(
                        //   visible: !_forgotPassword,
                        //   child: ShowUp(
                        //     delay: delayAmount,
                        //     child: Container(
                        //       alignment: customAlignment(context, flip: true),
                        //       padding: EdgeInsets.all(10.0),
                        //       child: InkWell(
                        //         splashColor: kTransparent,
                        //         highlightColor: kTransparent,
                        //         onTap: () {
                        //           _forgotPassword = true;
                        //           setState(() {});
                        //         },
                        //         child: Text(
                        //           getText(context, 'forgotPassword'),
                        //           style: kClickableTextStyle,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: true,
                // visible: _forgotPassword ? validateEmail(_userEmail) : validatePassword(_userPassword) && validateEmail(_userEmail),
                child: InkWell(
                  onTap: () async {
                    signIn();
                  },
                  child: ShowUp(
                    delay: delayAmount,
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      color: kFontsColor,
                      child: Text(
                        getText(context, 'Continue'),
                        style: kTFTextStyle.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Visibility(
          //   visible: !(_forgotPassword ? validateEmail(_userEmail) : validatePassword(_userPassword) && validateEmail(_userEmail)),
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: InkWell(
          //       onTap: () => replacePage(context, SignUpView.route),
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(vertical: 30),
          //         child: RichText(
          //           text: TextSpan(
          //             text: getText(context, "dontHaveAccount"),
          //             style: TextStyle(color: kFontsColor, fontWeight: FontWeight.w600),
          //             children: [
          //               TextSpan(
          //                 text: " " + getText(context, 'signup'),
          //                 style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.w700),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Future<void> signIn() async {
    final ProgressDialog pr = ProgressDialog(context);
    await pr.show();
    _userEmail.trim();
    dynamic _result =
        _forgotPassword ? await _auth.restPasswordByEmail(_userEmail) : await _auth.signInWithEmailAndPassword(_userEmail, _userPassword);
    await pr.hide();
    if (_result is String) {
      // If there is a issue with login
      AlertDialogBox.showAlert(context, locale: true, message: _result);
    } else {
      popPage(context);

      // if (/* await AppSharedPreferences().isFirstLaunch() */ true)
      //   Navigator.pushReplacement(
      //     context,
      //     PageRouteBuilder(
      //       transitionDuration: Duration(milliseconds: 700),
      //       transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) =>
      //           FadeTransition(opacity: animation, child: child),
      //       pageBuilder: (_, __, ___) => OnboardingScreen(),
      //     ),
      //   );
      // else
      // Navigator.pushReplacementNamed(context, 'Wrapper');
      // Navigator.pushReplacementNamed(context, Wrapper.route);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => MainView()));
    }
  }
}
