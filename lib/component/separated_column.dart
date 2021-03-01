import 'package:flutter/material.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';

class SeparatedColumn extends StatelessWidget {
  final List<Widget> children;
  Divider divider;
  final Color background;
  final double indentation;
  final BoxDecoration decoration;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  SeparatedColumn({@required this.children, this.divider, this.decoration, this.margin, this.padding, this.indentation = 13, this.background}) {
    if (divider == null) divider = Divider(color: Colors.grey.withOpacity(0.7), indent: indentation, height: 1);
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    if (children?.isNotEmpty ?? false) {
      for (int i = 0; i < children.length - 1; i++) {
        items.addAll([children[i], divider]);
      }
      items.add(children[children.length - 1]);
    }
    return Container(
      decoration: decoration ??
          BoxDecoration(
            borderRadius: kBorderRadius,
            color: background ?? kLight2,
            boxShadow: kBoxShadow,
          ),
      padding: padding,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items,
      ),
    );
  }
}
