import 'package:flutter/material.dart';
import 'package:zships/component/bounce.dart';
import 'package:zships/component/icon_text.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/constants/helper_methods.dart';
import 'package:timeago/timeago.dart' as timeAgo;
import 'package:zships/constants/validate.dart';
import 'package:zships/main.dart';
import 'package:zships/ship_engine/models/se_shipment.dart';
import 'package:zships/shipments/view/shipment_view.dart';
import 'package:zships/constants/extensions.dart';

class ShipmentCard extends StatelessWidget {
  final ShipmentSE shipment;

  const ShipmentCard({Key key, this.shipment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () => navigateTo(context, ShipmentView.route, args: {'shipment': shipment}),
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
                        Text('${shipment.shipTo?.name ?? ''}', style: TextStyle(fontSize: 18)),
                        Text('From: ${shipment.shipFrom?.name ?? ''}', style: kHintTS.copyWith(fontSize: 12)),
                        SizedBox(height: 5),
                        // Text('From: ${shipment.fromAddress.name}', style: kHintTS.copyWith(fontSize: 12)),
                        // Text('From: ${shipment.updatedAt}', style: kHintTS.copyWith(fontSize: 12)),
                        // Text(order?.customerPhone ?? '', style: TextStyle(fontSize: 14, color: kFontsColor)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (shipment.createdAt != null)
                              IconText(icon: Icons.access_time, text: timeAgo.format(shipment.createdAt, locale: MyApp.lang)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (safeListIsNotEmpty(shipment.serviceCode))
                    Text('${shipment.serviceCode.titleCase ?? ''}', style: TextStyle(fontSize: 10, color: Colors.black)),
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
                child: Text('${shipment.shipmentStatus.titleCase ?? ''}', style: TextStyle(fontSize: 10, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
