import 'package:flutter/material.dart';
import 'package:zships/component/progress_indicator.dart';
import 'package:zships/constants/validate.dart';
import 'package:zships/globals.dart';
import 'package:zships/service/api/api_service.dart';

class HomeController {
  final BuildContext context;
  bool _shipmentsLoaded = false;

  bool get shipmentsLoaded => _shipmentsLoaded;

  HomeController(this.context) {
    _shipmentsLoaded = safeListIsNotEmpty(allShipments);
  }

  loadShipments() async {
    ProgressDialog pr = ProgressDialog(context);
    await pr.show();
    await ApiService.instance.gettingAllShipments();
    _shipmentsLoaded = true;
    await pr.hide();
  }
}
