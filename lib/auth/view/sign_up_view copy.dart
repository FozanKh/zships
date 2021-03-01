// import 'package:zships/auth/services/auth.dart';
// import 'package:zships/auth/view/sign_in_view.dart';
// import 'package:zships/component/alertDialog.dart';
// import 'package:zships/component/animations/showUp.dart';
// import 'package:zships/component/progress_indicator.dart';
// import 'package:zships/component/rounded_textfield.dart';
// import 'package:zships/constants/colors.dart';
// import 'package:zships/constants/helper_methods.dart';
// import 'package:zships/localization/constants.dart';
// import 'package:zships/constants/decorations.dart';
// import 'package:zships/constants/validate.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class SignUpView extends StatefulWidget {
//   static const String route = 'SignUpView';
//   static const String anonymousRoute = 'SignUpViewAnonymous';

//   final bool isAnonymous;

//   SignUpView({this.isAnonymous = false});
//   @override
//   _SignUpViewState createState() => _SignUpViewState(isAnonymous: this.isAnonymous ?? false);
// }

// class _SignUpViewState extends State<SignUpView> {
//   final bool isAnonymous;
//   AuthService _auth = AuthService();
//   String _userApiKey = "";
//   String _userPassword = "";
//   String _username = "";

//   bool validApiKey = false;
//   bool validPassword = false;
//   bool validusername = false;

//   final int delayAmount = 200;

//   _SignUpViewState({this.isAnonymous = false});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kTransparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(CupertinoIcons.back, color: kDark3, size: 30),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Stack(
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Expanded(
//                 child: ShowUp(
//                   delay: delayAmount,
//                   child: SingleChildScrollView(
//                     padding: EdgeInsets.all(20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Center(
//                           child: RichText(
//                             textAlign: TextAlign.center,
//                             text: TextSpan(
//                                 text: getText(context, 'signUp') + '\n',
//                                 style: kLabelTextStyle,
//                                 children: [TextSpan(text: getText(context, 'welcomeToTheFamily'), style: kTitleTextStyle.copyWith(fontSize: 25))]),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         RoundedTextField(
//                           title: getText(context, 'Username'),
//                           hint: getText(context, 'writeEmail'),
//                           fillColor: Colors.grey.shade200,
//                           keyboardType: TextInputType.emailAddress,
//                           onChanged: (value) {
//                             _username = value;
//                             validusername = validateUsername(_username);
//                             setState(() {});
//                           },
//                         ),
//                         Visibility(
//                           visible: !validusername && _username.length > 1,
//                           child: ShowUp(
//                             delay: delayAmount,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                               child: Text(
//                                 getText(context, errorMessage(null)),
//                                 style: TextStyle(color: Colors.redAccent, fontSize: 12),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         RoundedTextField(
//                           title: getText(context, 'email'),
//                           hint: getText(context, 'writeEmail'),
//                           fillColor: Colors.grey.shade200,
//                           keyboardType: TextInputType.emailAddress,
//                           onChanged: (value) {
//                             _userApiKey = value;
//                             validApiKey = validateEmail(_userApiKey);
//                             setState(() {});
//                           },
//                         ),
//                         if (!validApiKey && showErrorMessage(_userApiKey, ValidationErrorType.email))
//                           ShowUp(
//                             delay: delayAmount,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                               child: Text(
//                                 getText(context, errorMessage(ValidationErrorType.email)),
//                                 style: TextStyle(color: Colors.redAccent, fontSize: 12),
//                               ),
//                             ),
//                           ),
//                         SizedBox(height: 10),
//                         RoundedTextField(
//                           title: getText(context, 'password'),
//                           hint: getText(context, 'writePassword'),
//                           fillColor: Colors.grey.shade200,
//                           obscureText: true,
//                           keyboardType: TextInputType.visiblePassword,
//                           onChanged: (value) {
//                             _userPassword = value;
//                             validPassword = validatePassword(_userPassword);
//                             setState(() {});
//                           },
//                         ),
//                         if (!validPassword && showErrorMessage(_userPassword, ValidationErrorType.password))
//                           ShowUp(
//                             delay: delayAmount,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: Text(
//                                 getText(context, errorMessage(ValidationErrorType.password)),
//                                 style: TextStyle(color: Colors.redAccent, fontSize: 12),
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Visibility(
//                 visible: validatePassword(_userPassword) && validateEmail(_userApiKey),
//                 child: InkWell(
//                   onTap: () async {
//                     signUp();
//                   },
//                   child: ShowUp(
//                     delay: delayAmount,
//                     child: Container(
//                       height: 80,
//                       width: MediaQuery.of(context).size.width,
//                       alignment: Alignment.center,
//                       color: kFontsColor,
//                       child: Text(getText(context, 'Continue'), style: kTFTextStyle.copyWith(color: Colors.white)),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           Visibility(
//             visible: !(validatePassword(_userPassword) && validateEmail(_userApiKey)),
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: InkWell(
//                 onTap: () => replacePage(context, SignInView.route),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(vertical: 30),
//                   child: RichText(
//                     text: TextSpan(
//                       text: getText(context, "haveAccount"),
//                       style: TextStyle(color: kFontsColor, fontWeight: FontWeight.w600),
//                       children: [
//                         TextSpan(
//                           text: " " + getText(context, 'Sign in'),
//                           style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.w700),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Future<void> signUp() async {
//     final ProgressDialog pr = ProgressDialog(context);
//     await pr.show();
//     _userApiKey.trim();
//     // dynamic _result = isAnonymous
//     //     ? await _auth.registerWithEmailAndPasswordAnyno(_userEmail, _userPassword)
//     //     : await _auth.registerWithEmailAndPassword(_userEmail, _userPassword, _username);
//     dynamic _result = await _auth.registerWithEmailAndPassword(_userApiKey, _userPassword, _username);
//     await pr.hide();
//     if (_result is String) {
//       // If there is a issue with sign up
//       AlertDialogBox.showAlert(context, locale: true, message: _result);
//     } else {
//       popPage(context);
//       // if (isAnonymous)
//       //   Navigator.pushReplacementNamed(context, 'EditProfileView');
//       // else {
//       // if (await AppSharedPreferences().isFirstLaunch())
//       //   Navigator.pushReplacement(
//       //     context,
//       //     PageRouteBuilder(
//       //       transitionDuration: Duration(milliseconds: 700),
//       //       transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) =>
//       //           FadeTransition(opacity: animation, child: child),
//       //       pageBuilder: (_, __, ___) => OnboardingScreen(),
//       //     ),
//       //   );
//       // else
//       // Navigator.pushReplacementNamed(context, 'Wrapper');
//       // await Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
//       // Navigator.pushReplacementNamed(context, 'Wrapper');
//       // }
//       // isAnonymous ? Navigator.pushReplacementNamed(context, EditProfileView.route) : Navigator.pushReplacementNamed(context, Wrapper.route);
//     }
//   }
// }
