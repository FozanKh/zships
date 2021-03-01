import 'package:flutter/material.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';

class SettingTile extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Function onTap;
  final String title;
  final Color color;
  final IconData icon;
  final double iconSize;
  final Widget trailing;

  const SettingTile({Key key, this.padding, this.margin, this.onTap, this.title, this.icon, this.iconSize, this.trailing, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kCardHeight,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  if (icon != null)
                    Icon(
                      icon ?? Icons.settings_ethernet,
                      color: color ?? kDark2,
                      size: 20,
                    ),
                  SizedBox(width: 15),
                  Text(title, style: TextStyle(color: color ?? kDark2, fontWeight: FontWeight.w500)),
                ],
              ),
              trailing ?? pkEditIcon
            ],
          ),
        ),
      ),
    );
  }
}
