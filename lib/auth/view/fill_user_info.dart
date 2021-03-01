import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:zships/auth/model/user.dart';
import 'package:zships/component/animations/showUp.dart';
import 'package:zships/component/progress_indicator.dart';
import 'package:zships/component/rounded_textfield.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/helper_methods.dart';
import 'package:zships/localization/constants.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/constants/validate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zships/service/database.dart';
import 'package:provider/provider.dart';

class UpdateUserInfo extends StatefulWidget {
  static const String route = 'UpdateUserInfo';
  final bool onSignUp;

  const UpdateUserInfo({Key key, this.onSignUp = false}) : super(key: key);
  @override
  _FillUserInfoView createState() => _FillUserInfoView();
}

class _FillUserInfoView extends State<UpdateUserInfo> {
  User user;
  String _userEmail = "";
  String _username = "";

  bool validEmail = false;
  bool validusername = false;

  final int delayAmount = 200;

  _FillUserInfoView();
  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        iconTheme: IconThemeData(color: kFontsColor),
        elevation: 0,
        automaticallyImplyLeading: !widget.onSignUp,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(getText(context, 'Let us know you better'),
                            style: kTitleTextStyle.copyWith(fontSize: 25, color: kFontsColor), textAlign: TextAlign.center),
                        SizedBox(height: 20),
                        RoundedTextField(
                          title: getText(context, 'Username'),
                          hint: user?.name ?? getText(context, 'Write you username'),
                          hintStyle: kHintTS.copyWith(color: user?.name != null ? kFontsColor.withOpacity(0.5) : null),
                          fillColor: Colors.grey.shade200,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            _username = value;
                            validusername = validateUsername(_username);
                            setState(() {});
                          },
                        ),
                        Visibility(
                          visible: !validusername && _username.length > 1,
                          child: ShowUp(
                            delay: delayAmount,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                getText(context, errorMessage(null)),
                                style: TextStyle(color: Colors.redAccent, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        RoundedTextField(
                          title: getText(context, 'email'),
                          hint: user?.email ?? getText(context, 'writeEmail'),
                          hintStyle: kHintTS.copyWith(color: user?.email != null ? kFontsColor.withOpacity(0.5) : null),
                          fillColor: Colors.grey.shade200,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            _userEmail = value;
                            validEmail = validateEmail(_userEmail);
                            setState(() {});
                          },
                        ),
                        if (!validEmail && showErrorMessage(_userEmail, ValidationErrorType.email))
                          ShowUp(
                            delay: delayAmount,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                getText(context, errorMessage(ValidationErrorType.email)),
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
                visible: (validateUsername(_username) && validateEmail(_userEmail)) || (validateUsername(_username) && _userEmail.isEmpty),
                child: InkWell(
                  onTap: () async {
                    updateUserInfo();
                  },
                  child: ShowUp(
                    delay: delayAmount,
                    child: Container(
                      height: MediaQuery.of(context).padding.bottom + 80,
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
        ],
      ),
    );
  }

  Future<void> updateUserInfo() async {
    final ProgressDialog pr = ProgressDialog(context);
    await pr.show();
    _userEmail.trim();
    _username.trim();
    var _auth = auth.FirebaseAuth.instance;
    if (safeIsNotEmpty(_userEmail) && validateEmail(_userEmail)) await _auth.currentUser.updateEmail(_userEmail);
    if (safeIsNotEmpty(_username) && validateUsername(_username)) await _auth.currentUser.updateProfile(displayName: _username);
    setState(() {});
    DatabaseService.instance.createUser(
        newUid: _auth.currentUser.uid, phone: _auth.currentUser.phoneNumber, name: _auth.currentUser.displayName, email: _auth.currentUser.email);
    await pr.hide();
    popPage(context);
  }
}
