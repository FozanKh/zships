import 'package:flutter/material.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/ship_engine/models/rate/se_rate.dart';

// ignore: must_be_immutable
class RateRow extends StatelessWidget {
  final RateSE rate;

  RateRow({Key key, this.rate}) : super(key: key);
  TextStyle textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 2.5),
        decoration: BoxDecoration(borderRadius: kBorderRadius, color: kWhite, boxShadow: kBoxShadowLight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Text('${rate.carrierFriendlyName}', style: textStyle)),
            rate.estimatedDeliveryDate != null
                ? Expanded(child: Text('${rate.deliveryDays} days', style: textStyle, textAlign: TextAlign.center))
                : SizedBox(), // SizedBox to keep the distance equal.
            Expanded(
                child: Text('${rate.shippingAmount.amount.toStringAsFixed(2)} ${rate.shippingAmount.currency.toUpperCase()}',
                    style: textStyle, textAlign: TextAlign.end)),
          ],
        ),
      ),
    );
  }
}
