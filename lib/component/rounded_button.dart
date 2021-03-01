import 'package:flutter/material.dart';
import 'package:zships/component/bounce.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';

class RoundedButton extends StatelessWidget {
  final Color buttonColor;
  final String title;
  final double titleSize;
  final Color titleColor;
  final Color borderColor;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double height;
  final TextStyle textStyle;
  final bool bounce;
  final void Function() onTap;

  const RoundedButton({
    this.buttonColor,
    @required this.title,
    this.titleColor = Colors.white,
    this.onTap,
    this.margin,
    this.padding,
    this.titleSize,
    this.borderRadius,
    this.borderColor,
    this.height,
    this.bounce = true,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return bounce
        ? Bounce(
            onTap: onTap,
            child: Container(
              height: height ?? kCardHeight,
              alignment: Alignment.center,
              margin: margin ?? EdgeInsets.only(top: 10),
              padding: padding ?? EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: borderRadius ?? kBorderRadius,
                color: borderColor == null ? buttonColor ?? kFontsColor : kTransparent,
                border: borderColor != null ? Border.all(color: borderColor, width: 2) : null,
              ),
              child: Text(title,
                  style: textStyle ?? TextStyle(fontSize: titleSize ?? 16, fontWeight: FontWeight.w500, color: titleColor ?? kFontsColor)),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
              height: height ?? kCardHeight,
              alignment: Alignment.center,
              margin: margin ?? EdgeInsets.only(top: 10),
              padding: padding ?? EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: borderRadius ?? kBorderRadius,
                color: borderColor == null ? buttonColor ?? kFontsColor : kTransparent,
                border: borderColor != null ? Border.all(color: borderColor, width: 2) : null,
              ),
              child: Text(title,
                  style: textStyle ?? TextStyle(fontSize: titleSize ?? 16, fontWeight: FontWeight.w500, color: titleColor ?? kFontsColor)),
            ),
          );
  }
}
