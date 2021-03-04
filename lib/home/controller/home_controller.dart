import 'package:flutter/material.dart';
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

  Future<void> loadShipments() async {
    // ProgressDialog pr = ProgressDialog(context);
    // await pr.show();
    await ApiService.instance.gettingAllShipments();
    _shipmentsLoaded = true;
    filteredShipments.clear();
    filteredShipments.addAll(allShipments);
    client.setState(() {});
    // await pr.hide();
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
