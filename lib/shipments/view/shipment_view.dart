import 'package:flutter/material.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/core/model/shipment.dart';

class ShipmentView extends StatefulWidget {
  static const String route = 'ShipmentView';
  final Shipment shipment;

  const ShipmentView({this.shipment});
  @override
  _ShipmentViewState createState() => _ShipmentViewState(shipment);
}

class _ShipmentViewState extends State<ShipmentView> {
  final Shipment shipment;

  _ShipmentViewState(this.shipment);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipment Details'),
        backgroundColor: kPrimaryColor,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('From:\t${shipment.fromAddress.name}', style: TextStyle(fontWeight: FontWeight.w600, color: kFontsColor)),
            Text('To:\t${shipment.buyerAddress.name}', style: TextStyle(fontWeight: FontWeight.w600, color: kFontsColor)),
            Text('Status: ${shipment.status}', style: TextStyle(fontWeight: FontWeight.w600, color: kFontsColor)),
            Text('Status: ${shipment.status}', style: TextStyle(fontWeight: FontWeight.w600, color: kFontsColor)),
            Text('Tracking Number: ${shipment.trackingCode}', style: TextStyle(fontWeight: FontWeight.w600, color: kDark3)),
          ],
        ),
      ),
    );
  }
}
