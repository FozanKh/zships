import 'package:flutter/material.dart';
import 'package:zships/component/bounce.dart';
import 'package:zships/component/icon_text.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/core/model/shipment.dart';
import 'package:timeago/timeago.dart' as timeAgo;

import '../../main.dart';

class ShipmentCard extends StatelessWidget {
  final Shipment shipment;

  const ShipmentCard({Key key, this.shipment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounce(
      // onTap: () => navigateTo(context, OrderView.route, args: {'order': order}),
      child: Container(
        height: 100,
        margin: EdgeInsets.all(5),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: kBoxShadow,
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('${shipment.buyerAddress.name}', style: TextStyle(fontSize: 18)),
                        Text('From: ${shipment.fromAddress.name}', style: kHintTS.copyWith(fontSize: 12)),
                        SizedBox(height: 5),
                        // Text('From: ${shipment.fromAddress.name}', style: kHintTS.copyWith(fontSize: 12)),
                        // Text('From: ${shipment.updatedAt}', style: kHintTS.copyWith(fontSize: 12)),
                        // Text(order?.customerPhone ?? '', style: TextStyle(fontSize: 14, color: kFontsColor)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconText(icon: Icons.access_time, text: timeAgo.format(DateTime.parse(shipment.createdAt), locale: MyApp.lang)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text('${shipment.rates.first.carrier}', style: TextStyle(fontSize: 10, color: Colors.black)),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: kPrimary1,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5)),
                  boxShadow: kBoxShadow,
                ),
                child: Text('${shipment.status}', style: TextStyle(fontSize: 10, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
