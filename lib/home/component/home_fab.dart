import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zships/component/bounce.dart';
import 'package:zships/component/modal_bottom_sheet.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/shipments/view/rate_calculator.dart';

class HomeFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () => modalBottomSheet(context, title: 'Rate Calculator', child: RateCalculatorView(), fullHeight: true),
      child: Container(
        decoration: BoxDecoration(color: kButtonColor, borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.calculate, color: kWhite, size: 35),
        ),
      ),
    );
  }
}
