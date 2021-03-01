import 'package:flutter/material.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/localization/constants.dart';

class HomeAppBar extends PreferredSize {
  final double height;

  HomeAppBar({this.height = kToolbarHeight + 30});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      brightness: Brightness.dark,
      backgroundColor: kPrimaryColor,
      elevation: 0,
      toolbarHeight: kToolbarHeight + 30,
      flexibleSpace: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            height: kToolbarHeight + 30 + MediaQuery.of(context).padding.top,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, right: 20, left: 20, bottom: 15),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: kPrimaryColor, gradient: kMainGradient),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(getText(context, 'Welcome to zShips'), style: TextStyle(color: Colors.white, fontSize: 24)),
              ],
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
