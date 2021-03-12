import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:zships/auth/model/user.dart';
import 'package:zships/auth/services/auth_errors_handler.dart';
import 'package:zships/service/database.dart';
import 'package:zships/service/shared_preferences.dart';

class AuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  // create user obj based on firebase user
  User _userFromFirebaseUser(auth.User user) {
    if (user != null && user.uid != null) {
      AppSharedPreferences.instance.setUid(user.uid);
      return User(
        uid: user.uid,
        email: user.email,
        name: user.displayName,
        isAnonymous: user.isAnonymous,
        phone: user.phoneNumber,
        isEmailVerified: user.emailVerified,
      );
    } else {
      return null;
    }
  }

  Future<String> getIdToken() async {
    return await _auth.currentUser.getIdToken();
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in anonymously
  Future preLunchHome() async {
    // TODO: Before Launch Actions
  }

  /// [Sign in] with [Email] and [Password]

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await preLunchHome();
    } catch (e) {
      return authErrorsHandler(e.code);
    }
  }

  Future restPasswordByEmail(String email) async {
    try {
      var errors;
      await _auth.sendPasswordResetEmail(email: email).catchError((onError) {
        errors = onError.code;
        print(errors);
      });
      if (errors == null) {
        return ("emailSent");
      } else {
        return authErrorsHandler(errors);
      }
    } catch (e) {
      return authErrorsHandler(e.code);
    }
  }

  Future<List<String>> verifyEmail() async {
    try {
      var errors;
      auth.User user = _auth.currentUser;
      user.sendEmailVerification().catchError((onError) {
        errors = onError.code;
        print(errors);
      });
      if (errors == null) {
        return ["emailVerificationMessage", "emailVerificationMessageTitle"];
      } else {
        return [authErrorsHandler(errors), 'error'];
      }
    } catch (e) {
      return [authErrorsHandler(e.code), 'error'];
    }
  }

  /// [Register] with [Email] and [Password]

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((result) async {
        await DatabaseService.instance.createUser(email: email, newUid: result.user.uid);
      });
      return (user);
    } catch (e) {
      return authErrorsHandler(e.code);
    }
  }

  /// [Login] with [Phone Number]

  Future<String> authWithPhoneNumber(String phoneNumber, Function onCodeSent) async {
    var error;
    log('Verifying Phone Number');
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: 60),
      verificationCompleted: signInWithCredential,
      verificationFailed: (e) => error = authErrorsHandler(e.code),
      codeSent: onCodeSent,
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return error;
  }

  /// [Sign in] with [Credentials]
  Future signInWithCredential(auth.AuthCredential authCredential) async {
    try {
      await _auth.signInWithCredential(authCredential);
      var user = auth.FirebaseAuth.instance.currentUser;
      await DatabaseService.instance.createUser(newUid: user.uid, phone: user.phoneNumber, name: user.displayName, email: user.email);

      await preLunchHome();
    } catch (e) {
      return authErrorsHandler(e.code);
    }
  }

  // update user email
  Future updatePassword(String newPassword, String oldPassword, String email) async {
    try {
      var errors;
      await _auth.signInWithEmailAndPassword(email: email, password: oldPassword).catchError((onError) => {errors = onError.code});
      auth.User user = _auth.currentUser;
      await user.updatePassword(newPassword).catchError((onError) {
        errors = onError.code;
        print(errors);
      });
      if (errors == null) {
        return ("passwordUpdated");
      } else {
        return authErrorsHandler(errors);
      }
    } catch (e) {
      return authErrorsHandler(e.code);
    }
  }

  Future signOut() async {
    try {
      AppSharedPreferences.instance.clearUserData();
      return await _auth.signOut();
    } catch (e) {
      return e.message;
    }
  }
}
