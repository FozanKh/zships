import 'package:zships/auth/controller/auth_controller.dart';
import 'package:zships/auth/view/sign_in_view.dart';
import 'package:zships/component/animations/showUp.dart';
import 'package:zships/component/rounded_text_field.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/helper_methods.dart';
import 'package:zships/localization/constants.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/constants/validate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  static const String route = 'SignUpView';

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
            Navigator.pop(context);
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
                                text: getText(context, 'signUp') + '\n',
                                style: kLabelTS,
                                children: [TextSpan(text: getText(context, 'Welcome To The Family'), style: kTitleTS.copyWith(fontSize: 25))]),
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
                        if (!controller.validEmail && showErrorMessage(controller.email, ValidationErrorType.email))
                          ShowUp(
                            delay: 200,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                getText(context, errorMessage(ValidationErrorType.email)),
                                style: TextStyle(color: Colors.redAccent, fontSize: 12),
                              ),
                            ),
                          ),
                        SizedBox(height: 10),
                        RoundedTextField(
                          title: getText(context, 'password'),
                          hint: getText(context, 'writePassword'),
                          fillColor: Colors.grey.shade200,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) => setState(() => controller.passwordChange(value)),
                        ),
                        if (!controller.validPassword && showErrorMessage(controller.password, ValidationErrorType.password))
                          ShowUp(
                            delay: 200,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                getText(context, errorMessage(ValidationErrorType.password)),
                                style: TextStyle(color: Colors.redAccent, fontSize: 12),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: controller.validPassword && controller.validEmail,
                child: InkWell(
                  onTap: controller.signUp,
                  child: ShowUp(
                    delay: 200,
                    child: Container(
                      height: 80 + MediaQuery.of(context).padding.bottom,
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      color: kFontsColor,
                      child: Text(getText(context, 'Continue'), style: kTFTextStyle.copyWith(color: Colors.white)),
                    ),
                  ),
                ),
              )
            ],
          ),
          Visibility(
            visible: !(controller.validEmail && controller.validPassword),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () => replacePage(context, SignInView.route),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: RichText(
                    text: TextSpan(
                      text: getText(context, "haveAccount"),
                      style: TextStyle(color: kFontsColor, fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                          text: " " + getText(context, 'signin'),
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
