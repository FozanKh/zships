import 'package:flutter/material.dart';
import 'package:zships/auth/services/auth.dart';
import 'package:zships/auth/view/update_api_key.dart';
import 'package:zships/component/alertDialog.dart';
import 'package:zships/component/progress_indicator.dart';
import 'package:zships/constants/helper_methods.dart';
import 'package:zships/constants/validate.dart';
import 'package:zships/core/wrapper.dart';
import 'package:zships/service/api/api_service.dart';
import 'package:zships/service/cloud_functions.dart';

class AuthController {
  final BuildContext context;
  AuthService _auth;
  String email = '';
  String apiKey = '';
  String password = '';
  bool validEmail = false;
  bool validPassword = false;
  bool validApiKey = false;

  AuthController(this.context) {
    _auth = AuthService();
  }

  void emailChange(String value) {
    email = value;
    validEmail = validateEmail(email);
  }

  void passwordChange(String value) {
    password = value;
    validPassword = validatePassword(password);
  }

  void apiKeyChange(String value) {
    apiKey = value;
    validApiKey = validateApiKey(apiKey);
  }

  Future<void> signUp() async {
    final ProgressDialog pr = ProgressDialog(context);
    await pr.show();
    dynamic _result = await _auth.registerWithEmailAndPassword(email.trim().toLowerCase(), password);
    await pr.hide();
    if (_result is String) {
      // If there is a issue with sign up
      AlertDialogBox.showAlert(context, message: _result, locale: true);
    } else {
      await Navigator.pushNamed(context, UpdateApiKey.route, arguments: {'onSignUp': true});
      replacePage(context, Wrapper.route);
    }
  }

  Future<void> signIn() async {
    final ProgressDialog pr = ProgressDialog(context);
    await pr.show();
    dynamic _result = await _auth.signInWithEmailAndPassword(email.trim().toLowerCase(), password);
    await pr.hide();
    if (_result is String) {
      // If there is a issue with sign up
      AlertDialogBox.showAlert(context, message: _result, locale: true);
    } else {
      replacePage(context, Wrapper.route);
    }
  }

  Future<void> restPassword() async {
    final ProgressDialog pr = ProgressDialog(context);
    await pr.show();
    dynamic _result = await _auth.restPasswordByEmail(email.trim().toLowerCase());
    await pr.hide();
    if (_result is String) {
      // If there is a issue with sign up
      AlertDialogBox.showAlert(context, message: _result, locale: true);
    } else {
      replacePage(context, Wrapper.route);
    }
  }

  Future<void> updateUserInfo() async {
    final ProgressDialog pr = ProgressDialog(context);
    await pr.show();
    if (safeIsNotEmpty(apiKey)) CloudFunctions.instance.setApiKey(apiKey.trim());
    await ApiService.instance.getApiKey();
    // await DatabaseService.instance.updateUserKey(newUid: FirebaseAuth.instance.currentUser.uid, key: apiKey.trim());
    await pr.hide();
    popPage(context);
  }

  clear() {
    email = '';
    apiKey = '';
    password = '';
    validEmail = false;
    validPassword = false;
    validApiKey = false;
  }
}
