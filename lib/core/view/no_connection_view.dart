import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zships/component/rounded_button.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/constants/helper_methods.dart';
import 'package:zships/constants/validate.dart';
import 'package:zships/localization/constants.dart';

class NoConnectionView extends StatelessWidget {
  static const String route = 'NoConnectionView';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset(
                  kZShipLogo,
                  height: MediaQuery.of(context).size.width / 2,
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ),
              Lottie.asset(kLottieNoConnectionAsset, alignment: Alignment.center, height: 300, width: 300),
              Text(
                getText(context, 'No Internet Connection, Please try again'),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: kFontsColor),
              ),
              SizedBox(height: 10),
              RoundedButton(
                title: getText(context, 'Try Again'),
                margin: EdgeInsets.all(40),
                onTap: () async {
                  if (await checkConnection()) popPage(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
