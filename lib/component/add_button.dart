import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zships/component/bounce.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/localization/constants.dart';

class AddButton extends StatelessWidget {
  final Function onTap;
  final int count;
  const AddButton({this.onTap, this.count = 0});
  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 35,
        margin: EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: kBorderRadius, border: Border.all(color: kLight2)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (count != 0)
              Align(
                alignment: customAlignment(context),
                child: Container(
                  alignment: Alignment.center,
                  width: 23,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  color: kFontsColor,
                  child: Text(
                    count.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(CupertinoIcons.cart, color: kFontsColor, size: 20),
                SizedBox(width: 5),
                Text(
                  getText(context, 'Buy'),
                  style: TextStyle(fontSize: 14, color: kFontsColor, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
