import 'package:flutter/material.dart';
import 'package:zships/component/alertDialog.dart';
import 'package:zships/component/progress_indicator.dart';
import 'package:zships/constants/validate.dart';
import 'package:zships/service/api/api_service.dart';
import 'package:zships/ship_engine/models/se_shipment.dart';

// ignore: invalid_use_of_protected_member
class HomeController {
  final BuildContext context;
  final State client;
  bool _shipmentsLoaded = false;
  List<ShipmentSE> allShipments = [];
  List<ShipmentSE> filteredShipments = [];
  bool get shipmentsLoaded => _shipmentsLoaded;

  HomeController(this.context, this.client) {
    _shipmentsLoaded = safeListIsNotEmpty(allShipments);
    filteredShipments.addAll(allShipments);
  }

  Future<void> loadShipments({bool force = false}) async {
    ProgressDialog pr = ProgressDialog(context);
    if (force) await pr.show();
    try {
      if (ApiService.instance.key == null) await Future.delayed(Duration(seconds: 2));
      allShipments = await ApiService.instance.fetchAllShipment();
      _shipmentsLoaded = true;
      filteredShipments.clear();
      filteredShipments.addAll(allShipments);
      client.setState(() {});
      if (force) await pr.hide();
    } catch (e) {
      if (force) await pr.hide();
      AlertDialogBox.showAlert(context, message: e.toString());
    }
    if (!safeListIsNotEmpty(allShipments)) {
      if (await checkConnection() == false) AlertDialogBox.showAlert(context, message: "Please check your internet and try again");
    }
  }

  void search(String value) {
    filteredShipments.clear();
    if (safeIsNotEmpty(value)) {
      print('searching');
      allShipments.forEach((shipment) {
        if (shipment.shipFrom.name.startsWith(value) ||
            shipment.shipTo.name.startsWith(value) ||
            (shipment.labels?.first?.trackingNumber?.startsWith(value) ?? false) ||
            shipment.shipmentId.startsWith(value)) filteredShipments.add(shipment);
      });
    } else {
      filteredShipments.addAll(allShipments);
    }
    client.setState(() {});
  }
}
