import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zships/auth/services/auth.dart';
import 'package:zships/component/alertDialog.dart';
import 'package:zships/component/animations/showUp.dart';
import 'package:zships/component/progress_indicator.dart';
import 'package:zships/component/rounded_text_field.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/constants/helper_methods.dart';
import 'package:zships/localization/constants.dart';

// ignore: must_be_immutable
class OTPView extends StatefulWidget {
  static const String route = 'OTPView';
  String verificationId;
  int forceResendingToken;

  OTPView(this.verificationId, [this.forceResendingToken]);

  @override
  _OTPViewState createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  AuthService _auth = AuthService();

  String smsCode;
  var _credential;
  TextEditingController _codeController;
  @override
  void initState() {
    _codeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    submit() async {
      ProgressDialog pr = ProgressDialog(context);
      await pr.show();
      _credential = auth.PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: smsCode);
      var _result = await _auth.signInWithCredential(_credential);
      await pr.hide();
      if (_result is String) {
        AlertDialogBox.showAlert(context, locale: true, message: _result);
      } else {
        popPage(context, args: true);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: kDark3, size: 30),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: ShowUp(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Text(getText(context, 'One Time Password'), style: kSubTitle.copyWith(color: kFontsColor)),
              Text(getText(context, 'Verification Code'), style: kTitleTextStyle.copyWith(fontSize: 25, color: kFontsColor)),
              SizedBox(height: 10),
              Text(getText(context, 'Please enter the 6-digits code sent to your phone'),
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              SizedBox(height: 20),
              RoundedTextField(
                hint: getText(context, 'X X X X X X'),
                textController: _codeController,
                clearButton: false,
                center: true,
                autoFocus: true,
                maxLength: 6,
                fillColor: Colors.grey.shade200,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 6) {
                    smsCode = value;
                    _codeController.clear();
                    submit();
                  }
                },
              ),
              // RoundedButton(
              //   title: getText(context, 'Resend Code'),
              //   onTap: () {
              //     auth.FirebaseAuth.instance.verifyPhoneNumber(
              //       phoneNumber: null,
              //       verificationFailed: null,
              //       codeSent: null,
              //       codeAutoRetrievalTimeout: null,
              //     );
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
