import 'package:flutter/material.dart';
import 'package:zships/constants/colors.dart';

class RatingLegends extends StatelessWidget {
  RatingLegends({@required this.context});

  final BuildContext context;
  final TextStyle textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Rate Estimations', style: TextStyle(color: kFontsColor, fontSize: 24, fontWeight: FontWeight.bold)),
        Divider(),
        FittedBox(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: Text('Carrier', style: textStyle)),
                Expanded(flex: 2, child: Text('Avg. delivery days', textAlign: TextAlign.center, style: textStyle)),
                Expanded(child: Text('Cost', textAlign: TextAlign.end, style: textStyle)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
