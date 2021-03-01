import 'package:flutter/material.dart';
import 'package:zships/component/animations/bottom_slide_transition.dart';
import 'package:zships/component/animations/bottom_slide_transition.dart';
import 'package:zships/component/rounded_button.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/constants/validate.dart';
import 'package:zships/localization/constants.dart';

class AlertDialogBox {
  static Future<bool> showAlert(context, {String message, bool locale = false, String title = '', String buttonTitle = 'ok'}) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return BottomSlideTransition(
          child: AlertDialog(
            title: title.isNotEmpty
                ? Text(
                    locale ? getText(context, title) : title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kFontsColor,
                    ),
                    textAlign: TextAlign.center,
                  )
                : null,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: kLight3,
            contentPadding: !safeIsNotEmpty(message) ? EdgeInsets.fromLTRB(24, 10, 24, 24) : EdgeInsets.fromLTRB(24, 20, 24, 24),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  if (title.isEmpty) SizedBox(height: 5),
                  if (safeIsNotEmpty(message))
                    Center(
                      child: Text(
                        locale ? getText(context, message) : message,
                        // style: kLabelTextStyle,
                        style: kAlertTS,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, !safeIsNotEmpty(message) ? 10 : 0, 20, 0),
                    child: RoundedButton(
                      buttonColor: Colors.black,
                      title: getText(context, buttonTitle),
                      titleColor: Colors.white,
                      onTap: () => Navigator.pop(context, true),
                      height: kCardHeight - 10,
                      padding: EdgeInsets.zero,
                      margin: !safeIsNotEmpty(message) ? EdgeInsets.zero : null,
                      bounce: false,
                      titleSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<String> showCustomAlert(
      {@required String message,
      @required BuildContext context,
      String buttonOneText = '',
      bool isDismissible,
      bool locale = false,
      String title = ''}) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: BottomSlideTransition(
            child: AlertDialog(
              title: title != ''
                  ? Text(
                      locale ? getText(context, title) : title,
                      style: kMidTitleTextStyle,
                      textAlign: TextAlign.center,
                    )
                  : null,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
              backgroundColor: kLight3,
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Center(
                      child: Text(
                        locale ? getText(context, message) : message,
                        style: kAlertTS,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          if (buttonOneText != '')
                            Expanded(
                              child: RoundedButton(
                                buttonColor: kLight0,
                                title: getText(context, buttonOneText),
                                titleColor: kFontsColor,
                                onTap: () => Navigator.pop(context, "one"),
                                height: kCardHeight - 10,
                                padding: EdgeInsets.zero,
                                bounce: false,
                                titleSize: 14,
                              ),
                            ),
                          if (isDismissible) SizedBox(width: 20),
                          if (isDismissible)
                            Expanded(
                              child: RoundedButton(
                                buttonColor: kLight0,
                                title: getText(context, 'ok'),
                                titleColor: kFontsColor,
                                onTap: () => Navigator.pop(context, "two"),
                                height: kCardHeight - 10,
                                padding: EdgeInsets.zero,
                                bounce: false,
                                titleSize: 14,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<bool> showAssertionDialog(context, {String message, bool locale = false, String title = '', String continueButton}) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return BottomSlideTransition(
          child: AlertDialog(
            title: title != ''
                ? Text(
                    locale ? getText(context, title) : title,
                    style: kMidTitleTextStyle,
                    textAlign: TextAlign.center,
                  )
                : null,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: kLight3,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Center(
                    child: Text(
                      locale ? getText(context, message) : message,
                      style: kAlertTS,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: RoundedButton(
                            buttonColor: kLight0,
                            title: getText(context, 'cancel'),
                            titleColor: kDark2,
                            onTap: () => Navigator.pop(context, false),
                            height: kCardHeight - 10,
                            padding: EdgeInsets.zero,
                            titleSize: 14,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: RoundedButton(
                            buttonColor: kFontsColor,
                            title: continueButton != null ? getText(context, continueButton) : getText(context, 'sure'),
                            titleColor: kLight0,
                            onTap: () => Navigator.pop(context, true),
                            height: kCardHeight - 10,
                            padding: EdgeInsets.zero,
                            bounce: false,
                            titleSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
