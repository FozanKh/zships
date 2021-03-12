import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:zships/component/alertDialog.dart';
import 'package:zships/component/progress_indicator.dart';
import 'package:zships/ship_engine/models/se_shipment.dart';
import 'package:zships/ship_engine/service/se_services.dart';

class ShipmentController {
  BuildContext context;
  ShipmentSE shipment;

  ShipmentController(this.context, {@required this.shipment});

  Future<void> getLabel() async {
    ProgressDialog pr = ProgressDialog(context);
    await pr.show();
    try {
      shipment.labels = await ShipEngineServices.instance.getLabelByShipmentId(shipmentId: shipment.shipmentId);
      await pr.hide();
    } catch (e) {
      await pr.hide();
      if ((e as String).contains('Error'))
        AlertDialogBox.showAlert(context, message: e.toString());
      else if (await AlertDialogBox.showAssertionDialog(context, message: e.toString(), continueButton: 'Create')) createLabel();
      return;
    }
    log(shipment.labels.first.trackingNumber);
    return;
  }

  Future<void> createLabel() async {
    ProgressDialog pr = ProgressDialog(context);
    await pr.show();
    try {
      shipment.labels = await ShipEngineServices.instance.createLabelByShipmentId(shipmentId: shipment.shipmentId);
      await pr.hide();
    } catch (e) {
      await pr.hide();
      AlertDialogBox.showAlert(context, message: e.toString());
    }
    log(shipment.labels.first.trackingNumber);
    return;
  }
}
