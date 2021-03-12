import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zships/auth/model/user.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/localization/constants.dart';

class CustomAppBar extends PreferredSize {
  final double height;
  final String title;
  final bool trailingIcon;
  final TextStyle textStyle;
  final BuildContext context;

  User user;
  CustomAppBar(this.context, {this.textStyle, this.title, this.trailingIcon = true, this.height = kToolbarHeight + 30});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    user = Provider.of(context);
    return AppBar(
      automaticallyImplyLeading: false,
      brightness: Brightness.dark,
      backgroundColor: kPrimaryColor,
      elevation: 0,
      toolbarHeight: kToolbarHeight + 30,
      actions: [
        if (trailingIcon)
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 20),
            child: Image.asset('assets/images/shipment.png', color: kWhite, height: 50, width: 50),
          ),
      ],
      flexibleSpace: Stack(
        children: [
          Container(
            alignment: trailingIcon ? Alignment.centerLeft : Alignment.center,
            height: kToolbarHeight + 30 + MediaQuery.of(context).padding.top,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, right: 20, left: 20, bottom: 25),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: kPrimaryColor, gradient: kMainGradient),
            child: Text(
              title ?? getText(context, 'Welcome ${user.name ?? 'To zShips'}'),
              style: textStyle ?? TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 20,
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: kBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
