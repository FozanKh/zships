import 'package:zships/auth/controller/auth_controller.dart';
import 'package:zships/component/rounded_text_field.dart';
import 'package:zships/constants/helper_methods.dart';
import 'package:zships/auth/view/sign_up_view.dart';
import 'package:zships/constants/colors.dart';
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
  AuthController controller;

  @override
  void initState() {
    controller = AuthController(context);
    super.initState();
  }

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
                  delay: 200,
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
                                style: kLabelTS,
                                children: [
                                  TextSpan(
                                      text: _forgotPassword ? getText(context, 'All Under Control') : getText(context, 'welcomeBack'),
                                      style: kTitleTS.copyWith(fontSize: 25))
                                ]),
                          ),
                        ),
                        SizedBox(height: 20),
                        RoundedTextField(
                          title: getText(context, 'email'),
                          hint: getText(context, 'writeEmail'),
                          fillColor: Colors.grey.shade200,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => setState(() => controller.emailChange(value)),
                        ),
                        SizedBox(height: 20),
                        Visibility(
                          visible: !_forgotPassword,
                          child: ShowUp(
                            delay: 200,
                            child: RoundedTextField(
                              title: getText(context, 'password'),
                              hint: getText(context, 'writePassword'),
                              fillColor: Colors.grey.shade200,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (value) => setState(() => controller.passwordChange(value)),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !_forgotPassword,
                          child: ShowUp(
                            delay: 200,
                            child: Container(
                              alignment: customAlignment(context, flip: true),
                              padding: EdgeInsets.all(10.0),
                              child: InkWell(
                                splashColor: kTransparent,
                                highlightColor: kTransparent,
                                onTap: () {
                                  _forgotPassword = true;
                                  setState(() {});
                                },
                                child: Text(
                                  getText(context, 'Forgot Password'),
                                  style: kClickableTS,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: _forgotPassword ? controller.validEmail : controller.validPassword && controller.validEmail,
                child: InkWell(
                  onTap: () => _forgotPassword ? controller.restPassword() : controller.signIn(),
                  child: ShowUp(
                    delay: 200,
                    child: Container(
                      height: 80 + MediaQuery.of(context).padding.bottom,
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
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
          Visibility(
            visible: !(_forgotPassword ? controller.validEmail : controller.validPassword && controller.validEmail),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () => replacePage(context, SignUpView.route),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: RichText(
                    text: TextSpan(
                      text: getText(context, "dontHaveAccount"),
                      style: TextStyle(color: kFontsColor, fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                          text: " " + getText(context, 'Sign Up'),
                          style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
