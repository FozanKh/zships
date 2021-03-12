import 'package:flutter/material.dart';
import 'package:zships/component/rounded_button.dart';
import 'package:zships/component/titled.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/extensions.dart';
import 'package:zships/constants/validate.dart';
import 'package:zships/ship_engine/models/se_shipment.dart';
import 'package:zships/shipments/controller/shipment_controller.dart';

class ShipmentView extends StatefulWidget {
  static const String route = 'ShipmentView';
  final ShipmentSE shipment;

  const ShipmentView({this.shipment});
  @override
  _ShipmentViewState createState() => _ShipmentViewState(shipment);
}

class _ShipmentViewState extends State<ShipmentView> {
  final ShipmentSE shipment;
  ShipmentController controller;

  _ShipmentViewState(this.shipment);
  @override
  void initState() {
    controller = ShipmentController(context, shipment: shipment);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipment Details'),
        backgroundColor: kPrimaryColor,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Shipment ID:\t${shipment.shipmentId}', style: TextStyle(fontWeight: FontWeight.w600, color: kFontsColor)),
            Text('From:\t${shipment.shipFrom.name}', style: TextStyle(fontWeight: FontWeight.w600, color: kFontsColor)),
            Text('To:\t${shipment.shipTo.name}', style: TextStyle(fontWeight: FontWeight.w600, color: kFontsColor)),
            Text('Service:\t${shipment.serviceCode.titleCase}', style: TextStyle(fontWeight: FontWeight.w600, color: kFontsColor)),
            Text('Status:\t${shipment.shipmentStatus.titleCase}', style: TextStyle(fontWeight: FontWeight.w600, color: kFontsColor)),
            Text('Total Weight:\t${shipment.totalWeight}', style: TextStyle(fontWeight: FontWeight.w600, color: kFontsColor)),
            if (safeIsNotEmpty(shipment.labels))
              Text('Track number:\t${shipment.labels.first.trackingNumber}', style: TextStyle(fontWeight: FontWeight.w600, color: kFontsColor)),
            Text('Created At: ${shipment.createdAt.toUtc().toString().split(' ').first}',
                style: TextStyle(fontWeight: FontWeight.w600, color: kDark3)),
            if (!safeIsNotEmpty(shipment.labels))
              RoundedButton(
                  title: 'Get Label',
                  onTap: () async {
                    await controller.getLabel();
                    setState(() {});
                  }),
            if (safeIsNotEmpty(shipment.labels)) Divider(color: kFontsColor),
            if (safeIsNotEmpty(shipment.labels))
              Titled(title: 'Label', largeTitle: true, child: Image.network(shipment.labels.first.labelDownload.png))
            // Text('Total Weight:\t${shipment.labels.first.labelDownload.png}', style: TextStyle(fontWeight: FontWeight.w600, color: kFontsColor)),
          ],
        ),
      ),
    );
  }
}
