import 'package:flutter/material.dart';
import 'package:zships/component/alertDialog.dart';
import 'package:zships/component/progress_indicator.dart';
import 'package:zships/constants/validate.dart';
import 'package:zships/core/model/shipment.dart';
import 'package:zships/globals.dart';
import 'package:zships/service/api/api_service.dart';

// ignore: invalid_use_of_protected_member
class HomeController {
  final BuildContext context;
  final State client;
  bool _shipmentsLoaded = false;
  List<Shipment> filteredShipments = [];
  bool get shipmentsLoaded => _shipmentsLoaded;

  HomeController(this.context, this.client) {
    _shipmentsLoaded = safeListIsNotEmpty(allShipments);
    filteredShipments.addAll(allShipments);
  }

  Future<void> loadShipments({bool force = false}) async {
    ProgressDialog pr = ProgressDialog(context);
    if (force) await pr.show();
    if (ApiService.instance.key == null) await Future.delayed(Duration(seconds: 2));
    await ApiService.instance.retrieveAllShipment();
    _shipmentsLoaded = true;
    filteredShipments.clear();
    filteredShipments.addAll(allShipments);
    client.setState(() {});
    if (force) await pr.hide();

    if (!safeListIsNotEmpty(allShipments)) {
      if (await checkConnection() == false)
        AlertDialogBox.showAlert(context, message: "Please check your internet and try again");
      else
        AlertDialogBox.showAlert(context, message: "Sorry there has been an error, please check that your api key is correct from the settings");
    }
  }

  void search(String value) {
    print(filteredShipments);
    filteredShipments.clear();
    print(filteredShipments);
    if (safeIsNotEmpty(value)) {
      print('searching');
      allShipments.forEach((shipment) {
        if (shipment.trackingCode.startsWith(value) || shipment.id.startsWith(value)) filteredShipments.add(shipment);
      });
    } else {
      filteredShipments.addAll(allShipments);
    }
    client.setState(() {});
  }
}
