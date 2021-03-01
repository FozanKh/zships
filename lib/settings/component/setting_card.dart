import 'package:zships/component/bounce.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:flutter/material.dart';

class SettingCard extends StatelessWidget {
  final Color color;
  final String subTitle;
  final String title;
  final Color titleColor;
  final IconData icon;
  final Function onTap;
  final bool navigate;

  const SettingCard({
    this.icon,
    this.title,
    this.onTap,
    this.navigate = false,
    this.titleColor,
    this.color,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: kContainerDecoration.copyWith(color: color ?? kLight2, borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color == kRed4
                          ? kRed02
                          : color == kBlueButtonColor
                              ? kDark4
                              : kLight1,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: titleColor ?? kFontsColor, size: 20),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: TextStyle(color: titleColor ?? kFontsColor, fontSize: 12, fontWeight: FontWeight.w600, height: 1.3)),
                        if (subTitle != null)
                          Text(
                            subTitle,
                            style: TextStyle(color: titleColor ?? kFontsColor, fontSize: 10, fontWeight: FontWeight.w600),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
            if (navigate)
              Flexible(
                child: Container(
                  decoration: BoxDecoration(color: kLight2, shape: BoxShape.circle),
                  child: pkEditIcon,
                ),
              )
          ],
        ),
      ),
    );
  }
}
