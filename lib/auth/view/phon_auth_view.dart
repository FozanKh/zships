import 'dart:developer';
import 'dart:ui';
import 'package:zships/auth/view/fill_user_info.dart';
import 'package:zships/constants/helper_methods.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:zships/auth/services/auth.dart';
import 'package:zships/auth/view/otp_view.dart';
import 'package:zships/component/animations/showUp.dart';
import 'package:zships/component/rounded_text_field.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/validate.dart';
import 'package:zships/localization/constants.dart';
import 'package:zships/constants/decorations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneAuthView extends StatefulWidget {
  static const String route = 'PhoneAuthView';

  final bool isAnonymous;

  PhoneAuthView({this.isAnonymous = false});
  @override
  _PhoneAuthViewState createState() => _PhoneAuthViewState();
}

class _PhoneAuthViewState extends State<PhoneAuthView> {
  AuthService _auth = AuthService();
  String _userPhone = "";
  bool loading = false;
  bool validPhone = false;
  String smsCode;

  @override
  void initState() {
    // _pr = ProgressDialog(context);
    super.initState();
  }

  final int delayAmount = 200;
  _PhoneAuthViewState();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
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
            body: Column(
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
                                text: getText(context, 'signUp'),
                                style: kTitleTextStyle.copyWith(fontSize: 25, color: kFontsColor),
                                // style: kLabelTextStyle,
                                // children: [TextSpan(text: getText(context, 'welcomeToTheFamily'), style: kTitleTextStyle.copyWith(fontSize: 25))],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          RoundedTextField(
                            title: getText(context, 'Phone number'),
                            hint: getText(context, '05xxxxxxxx'),
                            fillColor: Colors.grey.shade200,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            onChanged: (value) {
                              _userPhone = value;
                              validPhone = validatePhoneNumber(_userPhone);
                              setState(() {});
                            },
                          ),
                          Visibility(
                            visible: !validPhone && _userPhone.length > 1,
                            child: ShowUp(
                              delay: delayAmount,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  getText(context, 'Please Provides a valid phone number'),
                                  style: TextStyle(color: Colors.redAccent, fontSize: 12),
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
                  visible: validatePhoneNumber(_userPhone),
                  child: InkWell(
                    onTap: () async {
                      loading = true;
                      setState(() {});
                      login();
                    },
                    child: ShowUp(
                      delay: delayAmount,
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
          ),
          Visibility(
            visible: loading ?? false,
            child: Container(
              color: Colors.black26,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Center(child: kProgressIndicator),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> login() async {
    _userPhone.trim();
    _userPhone = '+966' + _userPhone.substring(1);
    await _auth.authWithPhoneNumber(_userPhone, onCodeSent).catchError((e) => print(e));
  }

  onCodeSent(String verificationId, [int forceResendingToken]) async {
    Future.delayed(Duration(milliseconds: 200));
    if (!(await navigateTo(context, OTPView.route, args: {'verificationId': verificationId, 'forceResendingToken': forceResendingToken}) ?? false)) {
      loading = false;
      setState(() {});
      return;
    }
    // ProgressDialog pr = ProgressDialog(context);
    // await pr.show();
    log('result gotten');
    // if (_result is String) {
    // If there is a issue with sign up
    // AlertDialogBox.showAlert(context, locale: true, message: _result.replaceAll('-', ' ').titleCase);
    // } else {
    // var user = Provider.of<User>(context, listen: false);
    if (auth.FirebaseAuth.instance.currentUser != null) {
      if (auth.FirebaseAuth.instance.currentUser.displayName == null) {
        // await pr.hide();
        await navigateTo(context, UpdateUserInfo.route, args: {'onSignUp': true});
        // await pr.show();
      }
    }
    // await pr.hide();

    popPage(context);
  }
  // popPage(context);
  // }
}
